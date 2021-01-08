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
        const isHold = document.getElementById(`card-${i}-is-hold`);
        const isHoldValue = isHold.value
        const check = checkBox.checked
        console.log(isHoldValue)
        checkBox.checked = !check
        isHold.value = !check
        element.classList.toggle('checked')
        text.classList.toggle('display-none')
      })
    }
  })
}