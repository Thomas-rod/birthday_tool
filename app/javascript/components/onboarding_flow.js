const displayFormProfil = () => {
  if (document.getElementById('button-onboarding-display')) {

    const buttonDisplayFlow = document.getElementById('button-onboarding-display')
    const formFlow = document.querySelector(".onboarding-container--form")

    const errorMessages = document.querySelectorAll('.error-message-input')

    function changeDisplay() {
      buttonDisplayFlow.style.display = 'none'
      formFlow.style.display = 'block'
    }
    if (errorMessages.length > 0) {
      changeDisplay();
    } else {
      buttonDisplayFlow.addEventListener('click', () => {
        changeDisplay();
      })
    }

  }
}

export { displayFormProfil }
