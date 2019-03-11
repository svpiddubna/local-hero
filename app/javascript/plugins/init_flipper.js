var card = document.getElementById('card');

const Flipper = () => {
  document.getElementById('flip').addEventListener('click', function() {
    card.classList.toggle('flipped');
}, false);
};

export { Flipper };
