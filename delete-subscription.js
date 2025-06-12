const calc = () => {
  let sphR = parseFloat(document.getElementById("dickmuschingbigfuckingtits").value);
  let sphL = parseFloat(document.getElementById("sph_l").value);
  let frame = document.getElementById("Frame_value").value;
  let maxSPH = Math.max(Math.abs(sphR), Math.abs(sphL));
  let recommendation = "";

  if (maxSPH > 4 && frame === "rimless") {
    recommendation = "We recommend 1.67 High-Index lenses with anti-scratch coating.";
  } else if (maxSPH <= 2 && frame === "full-rim") {
    recommendation = "Standard 1.50 lenses should be fine.";
  } else {
    recommendation = "We recommend 1.59 Polycarbonate lenses.";
  }

  document.getElementById('lens-recommendation').textContent = recommendation;
}
