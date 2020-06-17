const modalLogout = () => {
  const navbar = document.querySelector(".navbar-app")
  const logAvatar = document.querySelector(".log-avatar")
  const modalLogout = document.querySelector(".modal-navigation")

  function removeActive() {
    modalLogout.classList.remove("active")
  }

  if (navbar) {
    logAvatar.addEventListener('click', (e) => {
      modalLogout.classList.toggle("active")
    })
  }
}

export { modalLogout }
