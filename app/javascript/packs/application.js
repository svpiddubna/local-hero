import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
// internal imports
import { initMapbox } from '../plugins/init_mapbox';
import { initAutocompleteUser } from '../plugins/init_autocomplete';
import { initAutocompleteEvent } from '../plugins/init_autocomplete';
// import { initFlipper } from '../plugins/init_flipper';
import { initScroll } from '../plugins/init_scroll';

initMapbox();
initAutocompleteUser();
initAutocompleteEvent();
// initFlipper();
initScroll();
