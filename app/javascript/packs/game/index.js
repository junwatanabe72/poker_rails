export const game = () => {
  document.addEventListener("turbolinks:load", function () {
    for (let i = 1; i <= 5; i++) {
      const element = document.getElementById(`card-${i}`);
      if (!element) {
        return
      }
      element.addEventListener("click", () => {
        const checkBox = document.getElementById(`card-${i}-checkbox`);
        const text = document.getElementById(`card-${i}-text-hold`);
        const check = checkBox.checked
        checkBox.checked = !check
        element.classList.toggle('checked')
        text.classList.toggle('display-none')
      })
    }
  })
}