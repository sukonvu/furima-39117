function calculateProfit() {
  const priceInput = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  const price = parseFloat(priceInput.value);
  if (!isNaN(price)) {
    const tax = Math.floor(price * 0.1);
    const profitValue = price - tax;

    addTaxPrice.textContent = tax;
    profit.textContent = profitValue;
  } else {
    addTaxPrice.textContent = "0";
    profit.textContent = "0";
  }
}

document.addEventListener("DOMContentLoaded", function () {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", calculateProfit);
});
