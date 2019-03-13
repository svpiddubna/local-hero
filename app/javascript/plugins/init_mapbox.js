import mapboxgl from 'mapbox-gl';

const mapElement = document.getElementById('map');



const buildMap = () => {
  console.log(mapElement.dataset.mapboxApiKey);
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10',
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url(${marker.image_url})`;
    element.style.backgroundSize = 'contain';
    element.style.width = '33px';
    element.style.height = '33px';

    new mapboxgl.Marker(element)
    .setLngLat([ marker.lng, marker.lat ])
    .setPopup(new mapboxgl.Popup({ offset: 25 })
    .setHTML(marker.infoWindow))
    .addTo(map);
  });
};

const addLocationMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url(${marker.image_url})`;
    element.style.backgroundSize = 'contain';
    element.style.width = '33px';
    element.style.height = '33px';

    new mapboxgl.Marker(element)
    .setLngLat([ marker.lng, marker.lat ])
    .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 12, duration: 0 });
};

const drawCircleRadius = (map, marker) => {
  map.on('style.load', function() {
    map.addLayer({
      "id": "alert_radius",
      "type": "circle",
      "source": {
        "type": "geojson",
        "data": {
          "type": "FeatureCollection",
          "features": [{
            "type": "Feature",
            "geometry": {
              "type": "Point",
              "coordinates": [marker.lng, marker.lat]
            }
          }]
        }
      },
      "paint": {
        "circle-radius": {
          stops: [
            [0, 0],
            [15, 1000]
          ],
          base: 2
        },
        "circle-color": "#29ace5",
        "circle-opacity": 0.3
      }
    });
  });
}


const initMapbox = () => {
  if (mapElement) {
    const map = buildMap();
    const markers = JSON.parse(mapElement.dataset.markers);
    const eventmarkers = JSON.parse(mapElement.dataset.eventmarkers);
    addLocationMarkersToMap(map, markers);
    addMarkersToMap(map, eventmarkers);
    fitMapToMarkers(map, markers);
    drawCircleRadius(map, markers[0]);
  }
};


export { initMapbox };
