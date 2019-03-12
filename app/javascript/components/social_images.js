import { italic } from "ansi-colors";

function addValidationOnButton() {
  // 1 creer le formulaire
  // 2 add #validate id sur bouton formulaire
  // 3 add event listener sur le bouton #validate (event.preventDefault())
  //   4 selectAll '.picture-selected'
  const button = document.querySelector("#validate-pics");
  const input = document.getElementById('pics-input');
  button.addEventListener('click', (event) => {
    event.preventDefault()
    let ids = []
    document.querySelectorAll('.picture-selected').forEach((e) => {
      ids.push(e.dataset.categoryId)
    })
    input.value = ids.join(",")
    document.querySelector('form').submit()
  })


  //   5 recupe le .dataset.CategoryId sur chaque element
  //   6 stocker toutes les ids l'input hidden
  // 7 submit le form
  // 8 creer les elements en db ds le controller
}

function categoriesSelector() {
  addValidationOnButton()
  
  const categories = document.querySelectorAll('.category')

  categories.forEach((cat) => {
    cat.addEventListener('click', (event) => {
      const mainCategory = cat.dataset.mainCategory
      document.querySelectorAll(`.${mainCategory}`).forEach((e) => {
        e.classList.remove("picture-selected")
      })
      event.currentTarget.classList.add("picture-selected")
    })
  })
}

export { categoriesSelector }