document.addEventListener("DOMContentLoaded", () => {
  if (document.querySelector(".categories-lists")) {
    const categoriesLists = document.querySelectorAll(".categories-list");
    const categoryNames = document.querySelectorAll(".category-name");
    for (let i = 0; i < categoriesLists.length; i++) {
      const categoriesList = categoriesLists[i];
      categoriesList.addEventListener("click", e => {
        e.preventDefault();
        const categoryName = categoryNames[i];
        categoryName.scrollIntoView({behavior: "smooth"});
      });
    };
  };
});