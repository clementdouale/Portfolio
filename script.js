
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




