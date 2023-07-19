// start code Flickity top-bar
var elemTopBar = document.querySelector(".top-bar");
var flkty = new Flickity(elemTopBar, {
  prevNextButtons: false,
  pageDots: false,
  contain: true,
  lazyLoad: true,
});
// end code Flickity top-bar

// start code Flickity itemSlide-carousel
var elemItemSlideCarousel = document.querySelector(".itemSlide-carousel");
var flkty = new Flickity(elemItemSlideCarousel, {
  pageDots: false,
  contain: true,
  lazyLoad: true,
  draggable: true,
  autoPlay: 2000,
});
// end code Flickity itemSlide-carousel

// start code Flickity itemSlide-carousel
var elem = document.querySelector(".homeProduct-content-carousel");
var flkty = new Flickity(elem, {
  pageDots: false,
  contain: true,
  groupCells: true,
  autoPlay: 2000,
});
// end code Flickity itemSlide-carousel
