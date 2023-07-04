document.addEventListener('turbolinks:load', function() {
const timerEl = document.getElementById('timer')


  if (timerEl) {
    var timeLeft = parseInt(timerEl.dataset.timeLeft);
         
      setInterval(updateTimer, 1000)

      function updateTimer() {
        if (timeLeft > 0) {
        const minutes = Math.floor(timeLeft / 60)
        let seconds = timeLeft % 60
        seconds  = seconds < 10 ? "0" + seconds: seconds
        timerEl.innerHTML = `${minutes}:${seconds}`
        timeLeft--
      } if (timeLeft <= 0) {
        var myTimer = setInterval(updateTimer, 1000)
        clearInterval(myTimer)
        document.body.querySelector("form").submit()
      }
    }
  }
})
