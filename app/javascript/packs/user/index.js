export const createResult = (number) => {
  const handList = {
    high: "hight card",
    one: "one pair",
    two: "two pair",
    three: "three card",
    straight: "straight",
    flush: "flush",
    full: "full house",
    four: "four card",
    sflush: "straight flush",
    royal: "royal straight flush"
  }
  const handNames = Object.values(handList)
  const result = handNames[number]
  return result

}

export const user = () => {
  document.addEventListener("turbolinks:load", function () {
    for (let i = 1; i <= 6; i++) {
      const element = document.getElementById(`user-victory${i}`);
      if (!element) {
        return
      }
      const resultNumber = element.textContent
      const text = createResult(resultNumber)
      element.innerHTML = text
    }
  })
}