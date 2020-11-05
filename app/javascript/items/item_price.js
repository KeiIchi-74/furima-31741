if (document.URL.match(/new/)) {
  function displayPrice() {
    const priceInput = document.getElementById("item-price");
    priceInput.addEventListener("input", () => {
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
    });
  };
  window.addEventListener("load", displayPrice )
};
