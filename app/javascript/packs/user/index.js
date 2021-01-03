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
  const elements = document.getElementsByTagName(`h3`);
  for (let i = 0; i < elements.length; i++) {
    const resultNumber = elements[i].textContent
    const text = createResult(resultNumber)
    elements[i].innerHTML = text
  }


}
showResult()