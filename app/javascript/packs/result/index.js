const createResult = (number) => {
  handList = {
    high: "ハイカード",
    one: "ワンペア",
    two: "ツーペア",
    three: "スリーカード",
    straight: "ストレート",
    flush: "フラッシュ",
    full: "フルハウス",
    four: "フォカード",
    sflush: "ストレートフラッシュ",
    royal: "ロイヤルストレートフラッシュ"
  }
  const handNames = Object.values(handList)
  const result = handNames[number]
  return result

}

const showResult = () => {
  const otherElement = document.getElementById(`game-other-result-text`);
  const resultOtherNumber = otherElement.textContent
  const otherText = createResult(resultOtherNumber)
  otherElement.innerHTML = otherText

  const element = document.getElementById(`game-result-text`);
  const resultNumber = element.textContent
  const text = createResult(resultNumber) ? createResult(resultNumber) : otherText
  element.innerHTML = text
}

showResult()