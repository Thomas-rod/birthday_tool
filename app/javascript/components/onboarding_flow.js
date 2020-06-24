const displayFormProfil = () => {
  if (document.getElementById('button-onboarding-display')) {

    const buttonDisplayFlow = document.getElementById('button-onboarding-display')
    const formFlow = document.querySelector(".onboarding-container--form")

    function changeDisplay() {
      buttonDisplayFlow.style.display = 'none'
      formFlow.style.display = 'block'
    }

    buttonDisplayFlow.addEventListener('click', () => {
      changeDisplay();
    })

  }
}

export { displayFormProfil }
