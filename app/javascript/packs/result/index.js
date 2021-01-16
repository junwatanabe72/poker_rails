const createResult = (number) => {
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
export const result = () => {
  document.addEventListener("turbolinks:load", function () {
    const otherElement = document.getElementById(`game-other-result-text`);
    if (!otherElement) {
      return
    }
    const resultOtherNumber = otherElement.textContent
    const otherText = createResult(resultOtherNumber)
    otherElement.innerHTML = otherText

    const element = document.getElementById(`game-result-text`);
    const resultNumber = element.textContent
    const text = createResult(resultNumber) ? createResult(resultNumber) : otherText
    element.innerHTML = text
  })
}