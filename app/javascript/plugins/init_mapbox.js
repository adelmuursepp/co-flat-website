import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/outdoors-v11'
  });
};

const buildMap2 = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map-apartment-show',
    style: 'mapbox://styles/mapbox/outdoors-v11',
    zoom: 2
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup) 
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) {
    console.log('mapbox js working');
    const map = buildMap(mapElement);
    const markers = JSON.parse(mapElement.dataset.markers);
    var nav = new mapboxgl.NavigationControl();
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
    
      // Pass the element as an argument to the new marker
      new mapboxgl.Marker({color: '#444444'})
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(map);
    });
    map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl }));
    map.addControl(nav, 'top-left');
    map.scrollZoom.disable();
  }
};


const initMapbox2 = () => {
  const mapElement = document.getElementById('map-apartment-show');
  if (mapElement) {
    const map = buildMap2(mapElement);
    const markers = JSON.parse(mapElement.dataset.markers);
    var nav = new mapboxgl.NavigationControl();
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
    
      // Pass the element as an argument to the new marker
      new mapboxgl.Marker({color: '#444444'})
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(map);
    });
    map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl }));
    map.addControl(nav, 'top-left');
    map.scrollZoom.disable();
  }
};




export { initMapbox, initMapbox2 };