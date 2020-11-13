if (document.URL.match(/\/items\/new/) || document.URL.match(/items\z/) || document.URL.match(/\/items\/\d+\/edit/) || document.URL.match(/\/items\/\d+/) && document.getElementById("item-price") != null) {
  document.addEventListener("DOMContentLoaded", () => {
    const priceInput = document.getElementById("item-price");
    if (priceInput.value != null) {
      setPrice();
    };

    priceInput.addEventListener("input", () => {
      setPrice();
    });

     function setPrice() {
      const inputValue = priceInput.value;
      const addTaxDom = document.getElementById("add-tax-price");
      let addTaxPrice = inputValue / 10;
      let addTaxPriceFloor = Math.floor(addTaxPrice);
      let addTaxPriceString = addTaxPriceFloor.toString(10);
      let addTaxPriceDisplay = addTaxPriceString.replace(/(\d)(?=(\d\d\d)+$)/g, "$1,");
      addTaxDom.innerHTML = `${addTaxPriceDisplay}`
  
      const profitDom = document.getElementById("profit");
      let profitPrice = inputValue - addTaxPrice;
      let profitPriceFloor = Math.floor(profitPrice)
      let profitPriceString = profitPriceFloor.toString(10);
      let profitPriceDisplay = profitPriceString.replace(/(\d)(?=(\d\d\d)+$)/g, "$1,");
      profitDom.innerHTML = `${profitPriceDisplay}`
    };
  });
};
