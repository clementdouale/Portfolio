// Example: Toggling a mobile menu
document.getElementById('menu-toggle').addEventListener('click', function() {
    document.getElementById('nav-menu').classList.toggle('active');
});

const cvLink = document.querySelector('.cv-link');

cvLink.addEventListener('mouseover', () => {
  cvLink.style.backgroundColor = '#0069d9';
});

cvLink.addEventListener('mouseout', () => {
  cvLink.style.backgroundColor = '#007bff';
});