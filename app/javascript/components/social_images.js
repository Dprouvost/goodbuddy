const images = document.querySelectorAll('.image-size');
const selectedImage = document.querySelectorAll('.image-selected');
images.forEach((image) => {
  image.addEventListener('click', () => {
    if (selectedImage)
      event.currentTarget.classList.toggle("image-selected");
  });
});