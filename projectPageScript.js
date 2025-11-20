// Base slideshow logic found here: https://www.w3schools.com/howto/tryit.asp?filename=tryhow_js_slideshow

// Create the member vars related to showing specific slides in the slideshow
let slideIndex = 0;

var slides = document.querySelectorAll(".slides");
console.log(slides.length);
showSlides(slideIndex);

function incrementSlides(n){
    showSlides(slideIndex += n);
}

function decrementSlides(n){
    showSlides(slideIndex -= n);
}

function setSlide(n){
    showSlides(slideIndex = n);
}

function showSlides(n){
    let i;

    // Wrap n back around if it goes over the number of slides we have
    if(n > slides.length-1){
        slideIndex = 0;
    }
    if(n < 0){
        slideIndex = slides.length-1;
    }

    // Set the display of all slides to be 'none', then, we can enable only the one we care about
    for(i = 0; i < slides.length; i++){
        slides[i].style.display = "none";
        
    }

    // Show the slide index's slide in the slideshow
    slides[slideIndex].style.display = "";

}