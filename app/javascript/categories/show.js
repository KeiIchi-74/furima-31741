document.addEventListener("DOMContentLoaded", () => {
  if (document.querySelector(".category-show-btn-container")) {
    const categoryShowMain = document.querySelector(".category-show-main");
    categoryShowMain.animate([{opacity: "0"}, {opacity: "1"}], 400);
  };
});