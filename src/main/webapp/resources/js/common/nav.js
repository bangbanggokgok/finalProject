// document.body.addEventListener("scroll", () => {
//   if(this.scrolltop()>navback.height()){

//     navback.classList.toggle("scrolled");
//   }
// });

(function () {
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
})();

(() => {
  const navi = document.getElementsByClassName(".nav-nav1")[0];
  const navin = document.getElementsByClassName(".nav-in")[0];
  // const navback = docuemnt.querySelector("#mainNavbar1");
})();
const toggleBtn = document.querySelector(".ham");
const managerBtn = document.querySelector(".manager");

toggleBtn.addEventListener("click", () => {
  $(".nav-nav1").toggleClass("active");
  $(".nav-in").toggleClass("active");
  // navin.classList.toggle("active");
});
const managerMenu = document.querySelector(".manager-menu");
managerBtn.addEventListener("click", () => {
  managerMenu.classList.toggle("active");
});
