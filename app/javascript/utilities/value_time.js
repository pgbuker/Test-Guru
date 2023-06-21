document.addEventListener('turbolinks:load', function () {
  var control = document.getElementById('time_limit')

  if (control) {
      showValueTime(control)
  }
})



function showValueTime(control) {
  const value = document.querySelector('#value');
  const input = document.querySelector('#time_limit');
  value.textContent = input.value;
  input.addEventListener('input', (event) => {
    value.textContent = event.target.value; 
  })
}
