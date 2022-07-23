let navi = document.querySelector(".nav-nav1");
let navin = document.querySelector(".nav-in");
let toggleBtn = document.querySelector(".ham");
const managerBtn = document.querySelector(".manager");

// const navback = docuemnt.querySelector("#mainNavbar1");
toggleBtn.addEventListener("click", () => {
  navi.classList.toggle("active");
  navin.classList.toggle("active");
});

// document.body.addEventListener("scroll", () => {
//   if(this.scrolltop()>navback.height()){

//     navback.classList.toggle("scrolled");
//   }
// });

$(function () {
  $(document).scroll(function () {
    var $nav = $("#mainNavbar1");
    var $login = $(".login-btn");
    var $signUp = $(".signUp-btn");
    var $menu = $(".nav-menu");
    $nav.toggleClass("scrolled", $(this).scrollTop() > $nav.height());
    $login.toggleClass("color", $(this).scrollTop() > $nav.height());
    $signUp.toggleClass("color", $(this).scrollTop() > $nav.height());
    $menu.toggleClass("white", $(this).scrollTop() > $nav.height());
  });
});

const managerMenu = document.querySelector(".manager-menu");
managerBtn.addEventListener("click", () => {
  managerMenu.classList.toggle("active");
});
