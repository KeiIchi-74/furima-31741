document.addEventListener("DOMContentLoaded", () => {
  if (document.querySelector(".category-show-item-price")) {
    const itemsPrice = document.querySelectorAll(".category-show-item-price");
    for (let i = 0; i < itemsPrice.length; i ++) {
      const itemPrice = itemsPrice[i];
      const price = itemPrice.textContent.replace(/(\d)(?=(\d\d\d)+$)/g, "$1,");
      itemPrice.textContent = price;
    };
  };
});