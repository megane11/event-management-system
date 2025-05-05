const slidesContainer = document.getElementById("carouselSlides");
const totalSlides = 3;
let currentSlide = 0;

function updateSlide() {
  slidesContainer.style.transform = `translateX(-${currentSlide * 100}%)`;
}

function nextSlide() {
  currentSlide = (currentSlide + 1) % totalSlides;
  updateSlide();
}

function prevSlide() {
  currentSlide = (currentSlide - 1 + totalSlides) % totalSlides;
  updateSlide();
}
