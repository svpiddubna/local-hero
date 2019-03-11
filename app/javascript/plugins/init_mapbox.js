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
    new mapboxgl.Marker()
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
        "circle-color": "#fdb631",
        "circle-opacity": 0.2
      }
    });
  });
}


const initMapbox = () => {
  if (mapElement) {
    const map = buildMap();
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
    drawCircleRadius(map, markers[0]);
  }
};


export { initMapbox };
