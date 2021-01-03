for (let i = 0; i <= 4; i++) {
  const element = document.getElementById(`card-${i + 1}`);
  if (element) {
    element.onclick = () => {
      const checkBox = document.getElementById(`card-${i + 1}-checkbox`);
      const text = document.getElementById(`card-${i + 1}-text-hold`);
      const check = checkBox.checked
      checkBox.checked = !check
      element.classList.toggle('checked')
      text.classList.toggle('display-none')
    };
  }
}