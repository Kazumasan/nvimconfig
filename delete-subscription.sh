#!/bin/bash

main() {
  printf "%s [priority='INFO' thread='' user='' org='' trace=''] Starting vCenter subscription delete task.\n" "$(date '+%Y-%m-%d %H:%M:%S %Z')"
  VC_HOST="localhost"
  read -p "Enter FQDN of vCenter Server to be unsubsribed: " vcenter
  if [[ "$vcenter" ]]; then
    VC_HOST=$vcenter
  fi
  read -p "Enter the SSO Username for $VC_HOST: " user_name
  read -s -p "Enter the SSO Password for $VC_HOST: " password
  echo
  CREDENTIAL=$(echo -n "${user_name}:${password}" | base64 -w 0)
  export CREDENTIAL
  export VC_HOST
  printf "%s [priority='INFO' thread='' user='' org='' trace=''] Unsubscribing $VC_HOST.\n" "$(date '+%Y-%m-%d %H:%M:%S %Z')"
  get_session_id
  trigger_delete_subscription_task
  printf "%s [priority='INFO' thread='' user='' org='' trace=''] Finished vCenter subscription delete task.\n" "$(date '+%Y-%m-%d %H:%M:%S %Z')"
  exit 0
}

validate_input() {
  if [[ $# -lt 2 || $1 == "-h" || $1 == "--help" ]]; then
    echo "Usage: $0 <SSO administrator username> <SSO administrator password> [IP address or FQDN of vCenter to be unsubscribed]"
    exit 1
  fi
}

init_env_vars() {
  user_name=$1
  password=$2
  CREDENTIAL=$(echo -n "${user_name}:${password}" | base64 -w 0)
  export CREDENTIAL

  VC_HOST=localhost
  if [[ "$3" ]]; then
    VC_HOST=$3
  fi
  export VC_HOST
}

function get_session_id {
  response_file=$(mktemp)
  err_file=$(mktemp)
  status_code=$(curl -k -s -S -w "%{http_code}" -o "${response_file}" -X POST "https://${VC_HOST}/rest/com/vmware/cis/session" -H 'Accept: application/json' -H "Authorization: Basic ${CREDENTIAL}" 2>"${err_file}")
  if [[ "${status_code}" -eq 000 ]]; then
    printf "%s [priority='ERROR' thread='' user='' org='' trace=''] Connect error: %s.\n" "$(date '+%Y-%m-%d %H:%M:%S %Z')" "$(cat "${err_file}")"
    exit 1
  fi

  SESSION_ID=$(jq -r '.value' "${response_file}")
  if [[ -z "${SESSION_ID}" || "${SESSION_ID}" == "null" ]]; then
    printf "%s [priority='ERROR' thread='' user='' org='' trace=''] Response code is %s. Response: %s.\n" "$(date '+%Y-%m-%d %H:%M:%S %Z')" "${status_code}" "$(cat "${err_file}")"
    exit 1
  fi
  export SESSION_ID
}

function trigger_delete_subscription_task {
  response_file=$(mktemp)
  err_file=$(mktemp)
  status_code=$(curl -k -s -S -w "%{http_code}" -o "${response_file}" -X DELETE "https://${VC_HOST}/api/license/subscription/assignment?vmw-task=true" -H "vmware-api-session-id: ${SESSION_ID}" 2>"${err_file}")

  task_id=$(cat "${response_file}")
  if [[ "${status_code}" -eq 202 ]]; then
    printf "%s [priority='INFO' thread='' user='' org='' trace=''] Delete task with id %s created.\n" "$(date '+%Y-%m-%d %H:%M:%S %Z')" "${task_id}"
  fi

  if [[ "${status_code}" -eq 000 ]]; then
    printf "%s [priority='ERROR' thread='' user='' org='' trace=''] Connect error: %s.\n" "$(date '+%Y-%m-%d %H:%M:%S %Z')" "$(cat "${err_file}")"
    exit 1
  fi

  if [[ "${status_code}" -ne 202 ]]; then
    printf "%s [priority='ERROR' thread='' user='' org='' trace=''] Response code is: %s. Response: %s.\n" "$(date '+%Y-%m-%d %H:%M:%S %Z')" "${status_code}" "$(cat "${response_file}")"
    exit 1
  fi
}

main "$@"
