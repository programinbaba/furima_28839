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

      const inputHTML = document.createElement("input")
      inputHTML.setAttribute("id", `item_image_${imageElementNum}`)
      inputHTML.setAttribute("name", "message[images][]")
      inputHTML.setAttribute("type", "file")

      imageElement.appendChild(blobImage)
      imageElement.appendChild(inputHTML)
      imageList.appendChild(imageElement)

      inputHTML.addEventListener("change", (e) => {
        file = e.target.files[0]
        blob = window.URL.createObjectURL(file)

        createImageHTML(blob)
      })
    }

    document.getElementById("item-image").addEventListener("change", (e) => {
      const file = e.target.files[0]
      const blob = window.URL.createObjectURL(file)

      createImageHTML(blob)
    })
  })
}