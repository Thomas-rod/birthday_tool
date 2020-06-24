const validationFormProfil = () => {
  if (document.getElementById('button-onboarding-display')) {

    // ALL MY ELEMENT THAT I WILL USE
    const firstNameCheck = document.getElementById('profil_first_name')
    const lastNameCheck = document.getElementById('profil_last_name')
    const genderCheck = document.getElementById('profil_gender')
    const dayBirthdayCheck = document.getElementById('profil_birthday_date_3i')
    const monthBirthdayCheck = document.getElementById('profil_birthday_date_2i')
    const yearBirthdayCheck = document.getElementById('profil_birthday_date_1i')
    const buttonFormSubmit = document.getElementById('button-submit-form-onboarding')

    // ARRAY USED TO CREATE A FUNCTION
    const keyUpListener = [firstNameCheck, lastNameCheck]
    const clickListener = [genderCheck, dayBirthdayCheck, monthBirthdayCheck, yearBirthdayCheck]
    const globalInput = [firstNameCheck, lastNameCheck, genderCheck, dayBirthdayCheck, monthBirthdayCheck, yearBirthdayCheck]

    // VARIABLE USED TO WAIT UNTIL THE LAST KEYUP BEFORE DOING AN ACTION
    let timeout;

    // THIS FUNCTION WILL BE USE TO CHECK IF ALL INPUT HAD past-validation CLASS (USED TO DISPLAY SUBMIT BUTTON)
    function checkClassValidation(array) {
      let counter = 0
      array.forEach((input) => {
        if (input.classList.contains('past-validation')) {
          counter += 1
        }
      })
      return counter
    }

    // THIS FUNCTION WILL BE DISPLAY SUBMIT BUTTON USING checkClassValidation (If all input had the class (so it's equal to 6), then it display the button
    function displaySubmitButton() {
      if (checkClassValidation(globalInput) >= 6) {
        buttonFormSubmit.style.display = 'block'
      } else {
        buttonFormSubmit.style.display = 'none'
      }
    }

    // THIS FUNCTION WILL ADD past-validation CLASS TO EACH INPUT
    function formValidation(input) {
      if (input.value.length > 0 && input.value != "") {
        input.classList.add('past-validation')
      } else {
        input.classList.remove('past-validation')
      }
    }


    // EVENT LISTENER ON STRING INPUT
    keyUpListener.forEach((input) => {
      input.addEventListener('keyup', () => {
        clearTimeout(timeout);
        timeout = setTimeout(function () {
          formValidation(input)
        }, 100);
      });
    })

    // EVENT LISTENER ON COLLECTION INPUT
    clickListener.forEach((input) => {
      input.addEventListener('click', () => {
        clearTimeout(timeout);
        timeout = setTimeout(function () {
          formValidation(input)
        }, 100);
      });
    })

    // EVENT LISTENER DOCUMENT TO RESET displaySubmitButton
    document.addEventListener('click', () => {
      displaySubmitButton()
    });
    document.addEventListener('keyup', () => {
      displaySubmitButton()
    });
  }
}


export { validationFormProfil }
