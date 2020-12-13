
window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => { 
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const itemProfit = document.getElementById("profit");
    addTaxDom.innerHTML = Math.floor(inputValue*0.1);
    itemProfit.innerHTML = Math.floor(inputValue*0.9);
  });
});
