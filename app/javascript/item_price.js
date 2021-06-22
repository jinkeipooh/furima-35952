window.addEventListener('load', () => {
  const priceInput = document.getElementById('item-price');
  const addTaxDom = document.getElementById('add-tax-price');
  const addProfit = document.getElementById('profit');
  priceInput.addEventListener('input', () => {
    inputValue = priceInput.value;
    addTaxDom.innerHTML = parseInt(inputValue/10, 10);
    addProfit.innerHTML = parseInt(inputValue - inputValue/10, 10);
  });
});