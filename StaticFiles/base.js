function format(){
  let b = document.getElementsByTagName("pre");
  for (let i = 0; b.length; i++) {
    hljs.highlightBlock(b[i],false);
  }
}

function keyEvent(event) {
  const key = event.keyCode || event.which
  const arrow_left = 37
  const arrow_right = 39
  let slideCount = document.querySelector('.Control').innerText.split("/")
  let current = Number(slideCount[0].replace('<<','').trim())
  let last = Number(slideCount[1].replace('>>','').trim())
  let previous = ((current - 1) == 0) ? last : (current - 1)
  let next = ((current + 1) > last) ? 1 : (current + 1)

  if (key == arrow_left) {
    window.location.href = `${previous}.html`
  }
  if (key == arrow_right) {
    window.location.href = `${next}.html`
  }
}

document.addEventListener("keydown", keyEvent, false);