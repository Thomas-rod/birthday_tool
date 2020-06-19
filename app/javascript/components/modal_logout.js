const modalLogout = () => {
  if (document.querySelector(".navbar-app")) {
    const navbar = document.querySelector(".navbar-app")
    const logAvatar = document.querySelector(".log-avatar")
    const modalLogout = document.querySelector(".modal-navigation")
    const modalBgLogout = document.querySelector(".modal-navigation-bg")

    function toggleActive() {
      modalLogout.classList.toggle("active")
      modalBgLogout.classList.toggle("active")
    }

    if (navbar) {
      logAvatar.addEventListener('click', () => {
        toggleActive()
      })
    }
    if (modalLogout.classList.contains("active")) {

      modalBgLogout.addEventlistener('click', () => {
        toggleActive()
      })
    }
  }
}

export { modalLogout }
