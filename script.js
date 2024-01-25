document.getElementById('menu-toggle').addEventListener('click', function() {
    document.getElementById('nav-menu').classList.toggle('active');
});

// Existing CV Link Interactivity Code
const cvLink = document.querySelector('.cv-link');
cvLink.addEventListener('mouseover', () => {
  cvLink.style.backgroundColor = '#0069d9';
});
cvLink.addEventListener('mouseout', () => {
  cvLink.style.backgroundColor = '#007bff';
});


document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        document.querySelector(this.getAttribute('href')).scrollIntoView({
            behavior: 'smooth'
        });
    });
});

function toggleMenu() {
    var menu = document.getElementById("nav-menu");
    menu.style.display = menu.style.display === "block" ? "none" : "block";
}

