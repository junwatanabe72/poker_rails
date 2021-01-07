export const createResult = (number) => {
  const handList = {
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
export const user = () => {
  for (let i = 1; i <= 5; i++) {
    const element = document.getElementById(`user-victory${i}`);
    if (!element) {
      return
    }
    const resultNumber = element.textContent
    const text = createResult(resultNumber)
    element.innerHTML = text
  }
}