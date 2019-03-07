import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
// internal imports
import { initMapbox } from '../plugins/init_mapbox';
import { initAutocompleteUser } from '../plugins/init_autocomplete';
import { initAutocompleteEvent } from '../plugins/init_autocomplete';

initMapbox();
initAutocompleteUser();
initAutocompleteEvent();
