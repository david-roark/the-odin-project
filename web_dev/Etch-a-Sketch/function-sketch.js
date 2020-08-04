
// FUNCTION
  // function for button
  function drawColor() {
    optionForCeil('mouseover', changeColorDefault, 'remove');
    optionForCeil('mouseover', changeColorRandom, 'remove');
    optionForCeil('mouseover', changeColor, 'add');
  }

  function setColorfull() {
    optionForCeil('mouseover', changeColor, 'remove');
    optionForCeil('mouseover', changeColorDefault, 'remove');
    optionForCeil('mouseover', changeColorRandom, 'add');
  }

  function eraseColor() {
    optionForCeil('mouseover', changeColor, 'remove');
    optionForCeil('mouseover', changeColorRandom, 'remove');
    optionForCeil('mouseover', changeColorDefault, 'add');
  }

  function modeGird() {
    const ceils = Array.from(document.querySelectorAll('.ceil'));
    ceils.forEach(c => c.classList.toggle('ceil-change'));
  }

  function setSize() {
    let size = Number(prompt('type size'), 16);
    if (size <= 0 || size > 100 || isNaN(size)) {
      alert('Please type a number greater than 0 and smaller 100!')
    } else {
      const list = document.querySelectorAll('.ceil');
      list.forEach(n => n.remove());

      buildCeil(size);
      optionForCeil('mouseover', changeColorBlack, 'add');
    }
  }

  function resetColor() {
    const list = document.querySelectorAll('.ceil');
    list.forEach(n => n.remove());

    buildCeil(16);
    optionForCeil('mouseover', changeColorBlack, 'add');
  }

// another function
  function getUserColor () {
    const userColor = document.querySelector('#userColor').value;
    return userColor;
  }

  function randomColor() {
    let r = Math.floor(Math.random() * Math.floor(255));
    let g = Math.floor(Math.random() * Math.floor(255));
    let b = Math.floor(Math.random() * Math.floor(255));

    return `rgb(${r},${g},${b})`;
  }

  function changeColorDefault() {
    this.style.backgroundColor = "whitesmoke";
  }

  function changeColorBlack() {
    this.style.backgroundColor = "black";
  }

  function changeColor() {
    this.style.backgroundColor = getUserColor();
  }

  function changeColorRandom(){
    this.style.backgroundColor = randomColor();
  }



  function buildCeil(number) {
    const sketchArea = document.querySelector('.sketch-area');
    for(let i = 1; i <= number*number; i++) {
      const ceil = document.createElement('div');
      ceil.setAttribute('class', 'ceil')
      ceil.style.cssText = `height: ${480/number - 2}px; width: ${480/number - 2}px;`

      sketchArea.appendChild(ceil);
    }
  }
// change event listener for each ceil
  function optionForCeil(optionEvent, optionFunction, optionChoice) {
    const sketchCeil = Array.from(document.querySelectorAll('.ceil'));

    if (optionChoice == 'add') {
      sketchCeil.forEach(ceil => {ceil.addEventListener(optionEvent, optionFunction)})
    } else if (optionChoice == 'remove') {
      sketchCeil.forEach(ceil => {ceil.removeEventListener(optionEvent, optionFunction)})
    } else {
      return
    }
  }


// DOM HTML
  // create square 16x16 for default
  buildCeil(16);
  // add event mouseover to each ceil
  optionForCeil('mouseover', changeColorBlack, 'add');
