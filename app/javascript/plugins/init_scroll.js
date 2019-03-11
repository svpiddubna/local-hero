
const initScroll = () => {
  const sidebar = document.querySelector('.card-filter');
  window.addEventListener('scroll', e => {
  if(window.scrollY > 85){
    sidebar.style.transform = `translateY(-70px)`;
  } else {
    sidebar.style.transform = `translateY(0)`
  }
});
};

export { initScroll };

