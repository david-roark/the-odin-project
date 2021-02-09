'use strict';
let library = [];

// Object book
class Book {
  constructor(author, title, numberPages, completed) {
    this.author = author;
    this.title = title;
    this.numberPages = +numberPages;
    this.completed = completed;
  }
}

// check book exist?
function exist(book) {
  return library.some(function (e) {
    return (e.title === book.title && e.author === book.author);
  });
}

function addToLibrary(newBook) {
  if (exist(newBook)) {
    alert("This book already exist!");
    return;
  }

  library.push(newBook);
  saveLocal();
  return;
}

function removeFromLibrary(idBook) {
  library.splice(+idBook, 1);
  saveLocal();
  showGirds();
}

function changeComplete(idBook) {
  let v = library[idBook].completed;
  library[idBook].completed = !v;
  saveLocal();
  showGirds();
}

// add book to library
function jsAddBook() {
  let author = document.getElementById("authorBook").value;
  let title = document.getElementById("titleBook").value;
  let numberPages = document.getElementById("numberPages").value;
  let completed = document.getElementById("completed").checked;

  let newBook = new Book(author, title, numberPages, completed);

  addToLibrary(newBook);
  document.forms.reset();
  showGirds();
}

// Girds
  function showGirds() {
    let container = document.querySelector('.container');
    container.innerHTML = ''

    for (let i = 0; i < library.length; i++) {
      let book = library[i];
      let bookCard = document.createElement('div');
      
      bookCard.innerHTML = `
        <div class="card">
          <div class="title-book">${book.title}</div>
          <div class="author-book">By: ${book.author}</div>
          <div class="number-pages">Total: ${book.numberPages} pages</div>
          <button class="btn" onclick="changeComplete(${i})">${book.completed ? "Completed" : "Not completed"}</button>
          <button class="btn" onclick="removeFromLibrary(${i})">Delete</button>
        </div>
      `;

      container.appendChild(bookCard);
    }
  }

// form
function openForm() {
  document.querySelector("#new-book-form").style.display = 'block';
}

function closeForm() {
  document.querySelector("#new-book-form").style.display = 'none';
}


// Local storage
function saveLocal() {
  localStorage.setItem('library', JSON.stringify(library));
}

function restoreLocal() {
  library = JSON.parse(localStorage.getItem('library'));
  if (library === null) library = [];
}

// 
restoreLocal();
showGirds();

