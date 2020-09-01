if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener("DOMContentLoaded", function(){
    const imageList = document.getElementById("image-list")

    // 選択した画像を表示する関数
    const createImageHTML = (blob) => {
      const imageElement = document.createElement("div")
      imageElement.setAttribute("id", "image-element")
      let imageElementNum = document.querySelectorAll("#image-element").length
      const blobImage = document.createElement("img")
      blobImage.setAttribute("src", blob)

      // <div id="image-list><div id="image-element"><img src=blob><inputHTML></div></div>
      imageElement.appendChild(blobImage)
      imageList.appendChild(imageElement)

      // <input id="item_image_数字" name="message[images][]" type="file">
      const inputHTML = document.createElement("input")
      // 画像投稿枚数を6枚に制限(6枚目の画像の下にinputが生成されない)
      if (imageElementNum < 5) {
        inputHTML.setAttribute("id", `item_image_${imageElementNum}`)
        inputHTML.setAttribute("name", "item[images][]")
        inputHTML.setAttribute("type", "file")
        
        imageElement.appendChild(inputHTML)
      }

      inputHTML.addEventListener("change", (e) => {
        console.log(imageElementNum)
        // 画像投稿枚数を6枚に制限
        if (imageElementNum < 5) {
          file = e.target.files[0]
          blob = window.URL.createObjectURL(file)

          createImageHTML(blob)
        }
      })
    }

    document.getElementById("item-image").addEventListener("change", (e) => {
      const file = e.target.files[0]
      const blob = window.URL.createObjectURL(file)

      createImageHTML(blob)
    })
  })
}