if (document.URL.match(/\/items\/new/) || document.URL.match(/items/)){
  document.addEventListener("DOMContentLoaded", () => {
    class Image {
      constructor(num){
        this.num = num;

        this.blobImage = document.createElement("img");

        this.cameraIcon = document.getElementById("camera");
        this.cameraIcon.addEventListener("click", () => {
          this.clickJudgement();
        });

        this.itemImage = document.getElementById(`item_image_${this.num}`);
        this.itemImage.addEventListener("change", e => {
          this.createImage(e);
        });

        if (this.num != 0) {
          this.itemImageBack = document.getElementById(`item_image_${this.num - 1}`);
        };

        this.imagePrevContainer = document.createElement("div");
        this.imagePrevContainer.classList.add("image-prev-container");
        this.imagePrevContainer.classList.add("hidden");
        this.imagePrevContainer.setAttribute("id", `image_${this.num}`);
        if (this.num == 4) {
          this.imagePrevContainer.classList.add("last");
        };

        if (this.num != 0) {
          this.imagePrevContainerBack = document.getElementById(`image_${this.num - 1}`);
        };
        
        this.imagePrev = document.createElement("div");
        this.imagePrev.classList.add("image-prev");
        
        this.PrevBtn = document.createElement("div");
        this.PrevBtn.classList.add("image-prev-btn");
        
        this.editBtn = document.createElement("div");
        this.editBtn.classList.add("image-edit-btn");
        this.editBtn.textContent = "編集";
        this.editBtn.addEventListener("click", () => {
          this.imageEdit();
        });
        
        this.deleteBtn = document.createElement("div");
        this.deleteBtn.classList.add("image-delete-btn");
        this.deleteBtn.textContent = "削除";
        this.deleteBtn.addEventListener("click", () => { 
          this.imageDelete();
        });

        this.imageList = document.getElementById("image-list");
        
        this.createHTML();
      };

      createHTML() {
        this.PrevBtn.appendChild(this.editBtn);
        this.PrevBtn.appendChild(this.deleteBtn);
        this.imagePrev.appendChild(this.blobImage);
        this.imagePrevContainer.appendChild(this.imagePrev);
        this.imagePrevContainer.appendChild(this.PrevBtn);
        this.imageList.appendChild(this.imagePrevContainer);
        this.imageList.appendChild(this.cameraIcon);
      };

      createImageHTML(blob) {
        this.blobImage.setAttribute("src", blob);
        this.imagePrevContainer.classList.remove("hidden");
        if (this.num == 4) {
          this.cameraIcon.setAttribute("class", "hidden");
          return;
        };
        this.createImageNext();
      };

      clickJudgement() {
        this.labelNum = this.getAllBackLabel();
        this.hiddenNum = this.getAllBackHidden();
        if (this.num == 0 && this.blobImage.src == ""){
          this.itemImage.click();
          return;
        } else if (this.num == 0 && this.imagePrevContainer.classList.contains("label") && this.imagePrevContainer.classList.contains("hidden")) {
          this.itemImage.click();
          return;
        } else if (this.imagePrevContainer.classList.contains("hidden") && this.labelNum == 1 && this.hiddenNum == 1) {
          this.itemImage.click();
          return;
        } else if (this.imagePrevContainer.classList.contains("hidden") && 
        !this.imagePrevContainerBack.classList.contains("hidden") &&
        this.labelNum == 0 && this.hiddenNum == 1) {
          this.itemImage.click();
        };
      };

      createImage(e) {
        const file = e.target.files[0];
        const blob = window.URL.createObjectURL(file);
        this.removeLabel();
        this.createImageHTML(blob);
      };

      createImageNext() {
        this.allLabelNum = this.allLabel();
        this.allHiddenNum = this.allHidden();
        if (this.num == 4 && this.labelNum == 0 && this.hiddenNum == 0) {
          this.cameraIcon.setAttribute("class", "hidden");
          return;
        } else if (this.allLabelNum == 0 && this.allHiddenNum == 0 && document.getElementsByClassName("image-prev-container").length == 5) {
          this.cameraIcon.setAttribute("class", "hidden");
          return;
        } else if (document.getElementById(`image_${this.num + 1}`)) {
          return;
        };
        new Image(this.num + 1);
      };

      deleteImageNext() {
        if (this.num == 4) {
          return;
        };
        document.getElementById(`image_${this.num + 1}`).remove();
      };

      imageEdit() {
        this.itemImage.value = "";
        this.cameraIcon.setAttribute("class", "fas fa-camera");
        this.imagePrevContainer.classList.add("hidden"); 
        this.setLabel(); 
        this.itemImage.click();
      };

      imageDelete() {
        this.itemImage.value = "";
        this.blobImage.removeAttribute("src");
        this.blobImage.removeAttribute("class");
        this.cameraIcon.setAttribute("class","fas fa-camera");
        this.imagePrevContainer.classList.add("hidden");
        if (this.num == 0){
          this.setLabel()  
        };  
      };

      setLabel() {
        this.imagePrevContainer.classList.add("label");
      };

      removeLabel() {
        this.imagePrevContainer.classList.remove("label");
      };

      getAllBackLabel() {
        let labelNum = 0;
        if (this.num == 0) {
          return labelNum;
        };
        for (i = 0; i < this.num + 1; i++) {
          if(document.getElementById(`image_${this.num - i}`).classList.contains("label")){
            labelNum += 1;
          } else if (i == this.num) {
            return labelNum;
          };
        };
      };

      getAllBackHidden() {
        let hiddenNum = 0;
        if (this.num == 0) {
          return hiddenNum;
        };
        for (i = 0; i < this.num + 1; i++) {
          if (document.getElementById(`image_${this.num - i}`).classList.contains("hidden")){
            hiddenNum += 1;
          } else if (i == this.num) {
            return hiddenNum;
          };
        };
      };

      allLabel() {
        let allLabelNum = 0;
        if (document.getElementsByClassName("image-prev-container").length != 5) {
          return 1;
        };
        for (i = 0; i < 5; i++) {
          if (document.getElementById(`image_${i}`).classList.contains("label")) {
            allLabelNum += 1;
          } else if (i == 4) {
            return allLabelNum;
          };
        };
      };

      allHidden() {
        let allHiddenNum = 0;
        if (document.getElementsByClassName("image-prev-container").length != 5) {
          return 1;
        };
        for (i = 0; i < 5; i++) {
          if (document.getElementById(`image_${i}`).classList.contains("hidden")) {
            allHiddenNum += 1;
          } else if (i == 4) {
            return allHiddenNum;
          };
        };
      };


    };

    new Image(0);
    
  });
};