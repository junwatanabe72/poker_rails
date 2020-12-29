const cardElements = [];
for (let i = 0; i <= 4; i++) {
  const element = document.querySelector(`.card-${i + 1}`);
  element.onclick = () => {
    console.log(element);
    element.style.backgroundColor = "red";
  };
  // console.log(document.querySelector(`.card-${i+1}`))
}
