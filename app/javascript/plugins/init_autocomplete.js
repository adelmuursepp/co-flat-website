import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('apartment_address');
  if (addressInput) {
    places({ container: addressInput });
  }
};

const initAutocompleteSearch = () => {
  const addressInput = document.getElementById('search');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete, initAutocompleteSearch };