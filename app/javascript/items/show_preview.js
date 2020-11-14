if (document.URL.match(/items\/\d+/)) {
  document.addEventListener("DOMContentLoaded", () => {
    if (document.querySelector(".item-show") != null) {

      const dotImages = document.querySelectorAll(".owl-dot-inner > img");
  
      for (let i = 0; i < dotImages.length; i ++) {
        const dotImage = dotImages[i];
        if (i == 0) {
          setActive(i);
        };
        dotImage.addEventListener("mouseover", () => {
          removeActive();
          setActive(i);
        });
  
        function setActive(num) {
          const owlDots = document.getElementsByClassName("owl-dot");
          const owlDot = owlDots[num];
          owlDot.classList.add("active");
  
          const owlItems = document.getElementsByClassName("owl-item");
          const owlItem = owlItems[num];
          owlItem.classList.add("active");
  
          setWidth(num);
        };
  
        function removeActive() {
          if (document.getElementsByClassName("owl-dot active").length != 0) {
            const owlDots = document.getElementsByClassName("owl-dot active");
            const owlDot = owlDots[0];
            owlDot.classList.remove("active");
  
            const owlItems = document.getElementsByClassName("owl-item active");
            const owlItem = owlItems[0];
            owlItem.classList.remove("active");
          };
        };
  
        function setWidth(number) {
          const owlStage = document.querySelector(".owl-stage");
          const width = number * -450;
          owlStage.style.left = width + "px";
        };
  
      };
    };
  });
};