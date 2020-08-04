
let rounds = 0; // Total round have passed
let pWin = 0;   // The Player's point
let pLose = 0;  // The Computer's point

// Computer will randomly return either ‘Rock’, ‘Paper’ or ‘Scissors’.

function computerPlay() {
  let num = Math.floor(Math.random() * Math.floor(3));
  switch (num) {
    case 0:
      return "rock";
      break;
    case 1:
      return "paper";
      break;
    default:
      return "scissors"
      break;
  }
}
// It will return the result the srting result (pS: playerSelection; cS: computerSelection)
function playRound(pS, cS) {
  rounds++;
  if (pS == cS) {
    return 'We have the same result!'+` We chose ${pS} together!`;
  } else if ((pS=='scissors' && cS=='paper') || (pS=='paper' && cS=='rock') || (pS=='rock' && cS=='scissors')) {
    pWin++;
    return `You win this round! You chose ${pS} (${pS} beats ${cS})`;
  } else {
    pLose++;
    return `You lose this round! You chose ${pS} (${cS} beats ${pS})`;
  }
};

const playerSelected = Array.from(document.querySelectorAll('.player button'));
  playerSelected.forEach((b) => {
    b.addEventListener('click', () => {
      let result = document.createElement('li');
      let contai = document.querySelector('.history-result');
      let kq = playRound(b.name, computerPlay());
      result.textContent = `${kq}`;
      contai.appendChild(result);
      console.log(pWin);

      let showResult = document.querySelector('.show-result');
      showResult.innerHTML = `
        <div class="result">
          <h3>Result:</h3>
          <i>${kq}</i>
        </div>
        <div class="scores">
          <p class="number-rounds"><strong>Total rounds: </strong>${rounds}</p>
          <p class="won"><strong>You won: </strong>${pWin}</p>
          <p class="draws"><strong>Draws: </strong>${rounds-pWin-pLose}</p>
          <p class="lose"><strong>You lose: </strong>${pLose}</p>
        </div>
      `;

      if (pWin==5 && pLose<5) {
        alert("You is the Champion!!!")
      } else if (pLose == 5 && pWin<5) {
        alert("The winner is Computer.")
      } else {
        return
      }
    });
  });


  // function for Top navbar
  function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(e) {
  if (!e.target.matches('.dropbtn')) {
  var myDropdown = document.getElementById("myDropdown");
    if (myDropdown.classList.contains('show')) {
      myDropdown.classList.remove('show');
    }
  }
}

/* Set the width of the sidebar to 250px (show it) */
function openNav() {
  document.getElementById("mySidepanel").style.width = "250px";
}

/* Set the width of the sidebar to 0 (hide it) */
function closeNav() {
  document.getElementById("mySidepanel").style.width = "0";
} 
