// NOT USED IN THIS APPLICATION, BUT CAN BE HELPFULL

const validationFormProfil = () => {
  if (document.getElementById('button-submit-form-onboarding')) {

    // ALL MY ELEMENT THAT I WILL USE
    const firstNameCheck = document.getElementById('profil_first_name')
    const lastNameCheck = document.getElementById('profil_last_name')
    const genderCheck = document.getElementById('profil_gender')
    const dayBirthdayCheck = document.getElementById('profil_birthday_date_3i')
    const monthBirthdayCheck = document.getElementById('profil_birthday_date_2i')
    const yearBirthdayCheck = document.getElementById('profil_birthday_date_1i')
    const buttonFormSubmit = document.getElementById('button-submit-form-onboarding')

    const errorMessagesHtml = document.querySelectorAll('.message-error')

    document.addEventListener('click', (e) => {
      console.log(e)
      console.log(errorMessagesHtml[0])
    })

    const form = document.getElementById('new_profil');

    form.addEventListener('submit', (e) => {
      let errorMessages = []
      console.log(errorMessages)

      if (firstNameCheck.value === "" || firstNameCheck.value == null) {
        errorMessages.push("Did you forget your first name ?")
        document.getElementById('first-name-errors').innerHTML(
          "<p class='error-message-input'>Did you forget your first name ?</p>"
          )
      }
      if (lastNameCheck.value === "" || lastNameCheck.value == null) {
        errorMessages.push("Did you forget your last name ?")
      }
      if (genderCheck.value === "" || genderCheck.value == null) {
        errorMessages.push("Did you forget your gender ?")
      }
      if ((dayBirthdayCheck.value === "" || dayBirthdayCheck.value == null) || (monthBirthdayCheck.value === "" || monthBirthdayCheck.value == null) || (yearBirthdayCheck.value === "" || yearBirthdayCheck.value == null) ) {
        errorMessages.push("Come on .. Do we need to remind you your own birthday ?")
      }
      console.log(errorMessages)
      if (errorMessages.length > 0) {
        e.preventDefault()
      }
    })
  }
}


export { validationFormProfil }
