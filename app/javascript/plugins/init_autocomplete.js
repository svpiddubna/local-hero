import places from 'places.js';

const initAutocompleteUser = () => {
  const addressInput = document.getElementById('user_address');
  if (addressInput) {
    places({ container: addressInput });
  }
};

const initAutocompleteEvent = () => {
  const addressInput = document.getElementById('event_address');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocompleteUser};
export { initAutocompleteEvent};

