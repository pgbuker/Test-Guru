document.addEventListener('turbolinks:load', function () {
  var confirm = document.getElementById('user_password_confirmation')

  if (confirm) { confirm.addEventListener('input', checkComparePassword) }

})

function checkComparePassword() {

 
  if (document.getElementById('user_password').value == document.getElementById('user_password_confirmation').value)
  {
    document.querySelector('.octicon-check-circle-fill').classList.remove('hide')
    document.querySelector('.octicon-alert-fill').classList.add('hide')
  } else {
    document.querySelector('.octicon-alert-fill').classList.remove('hide')
    document.querySelector('.octicon-check-circle-fill').classList.add('hide')
  }
}

