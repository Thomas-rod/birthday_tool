// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { modalLogout } from '../components/modal_logout'
import { modalAddBirthday } from '../components/modal_add_birthday'
import { confettiLoader } from '../components/confeti'
import { displayFormProfil } from '../components/onboarding_flow'
// import { validationFormProfil } from '../components/validation_form_profil'


document.addEventListener('turbolinks:load', () => {
  modalLogout();
  modalAddBirthday();
  confettiLoader();
  displayFormProfil();
  // validationFormProfil();
  // Call your functions here, e.g:
  // initSelect2();
});
