document.addEventListener("DOMContentLoaded", () => {
  if (document.querySelector(".category-list")) {
    const categoryTag = document.querySelector(".category-tag");
    const categoryContainer = document.querySelector(".category-container");
    const categoryDots = document.querySelectorAll(".category-dot>a");

    categoryTag.addEventListener("mouseover", () => {
      categoryContainer.classList.remove("hidden");
      for (let i = 0; i < categoryDots.length; i++) {
        const categoryDot = categoryDots[i];
  
        categoryDot.addEventListener("mouseover", () => {
          categoryContainer.classList.remove("hidden");
        });
  
        categoryDot.addEventListener("mouseout", () => {
          categoryContainer.classList.add("hidden");
        });
      };
    });

    categoryTag.addEventListener("mouseout", () => {
      categoryContainer.classList.add("hidden");
    });


    
  };
});