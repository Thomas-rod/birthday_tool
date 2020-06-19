const modalAddBirthday = () => {
  if (document.getElementById('add-birthday')) {
    const closeButton = document.querySelector('.close-icon')
    const modalSelector = document.getElementById('add-birthday')
    const modalBg = document.querySelector(".modal-bg-add-birthday")
    const modalBody = document.querySelector(".modal-add-birthday")


    function toggleActive() {
      modalBg.classList.toggle("active")
      modalBody.classList.toggle("active")
    };

    modalSelector.addEventListener('click', () => {
      toggleActive();
    })

    closeButton.addEventListener('click', () => {
      toggleActive();
    })
  }
}

export { modalAddBirthday }
