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
  const result = handNames[number] ? handNames[number] : ""
  return result

}

const showResult = () => {
  const element = document.getElementById(`game-result-text`);
  const resultNumber = element.textContent
  const text = createResult(resultNumber)
  element.innerHTML = text
}
showResult()