import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'


// Connects to data-controller="map2"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }
  connect() {
     this.speedFactor = 120; // number of frames per longitude degree
      this.animation; // to store and cancel the animation
      this.startTime = 0;
      this.progress = 0; // progress = timestamp - startTime
      this.resetTime = false; // indicator of whether time reset is needed for the animation
      this.pauseButton = document.getElementById('pause');

      mapboxgl.accessToken = this.apiKeyValue
      this.map = new mapboxgl.Map({
        container: this.element,
        style: 'mapbox://styles/mapbox/streets-v12'
      });

      this.#addMarkersToMap()
      this.markerCoordinates = this.markersValue.map(marker => [marker.lng, marker.lat]);
      this.currentIndex = 0;
    // beginning of map
    this.geojson = {
      'type': 'FeatureCollection',
      'features': [
          {
              'type': 'Feature',
              'geometry': {
                  'type': 'LineString',
                  'coordinates': [[0, 0]]
              }
          }
      ]
    };


    this.map.on('load', () => {
        this.map.addSource('line', {
            'type': 'geojson',
            'data': this.geojson
        });

        // add the line which will be modified in the animation
        this.map.addLayer({
            'id': 'line-animation',
            'type': 'line',
            'source': 'line',
            'layout': {
                'line-cap': 'round',
                'line-join': 'round'
            },
            'paint': {
                'line-color': '#ed6498',
                'line-width': 5,
                'line-opacity': 0.8
            }
        });

      this.startTime = performance.now();
      this.animateLine = this.animateLine.bind(this);
      this.animateLine(performance.now());



          // animated in a circle as a sine wave along the map.

    });


    // click the button to pause or play
          this.pauseButton.addEventListener('click', () => {
              this.pauseButton.classList.toggle('pause');
              if (this.pauseButton.classList.contains('pause')) {
                  cancelAnimationFrame(this.animation);
              } else {
                  this.resetTime = true;
                  this.animateLine();
              }
          });

          // reset startTime and progress once the tab loses or gains focus
          // requestAnimationFrame also pauses on hidden tabs by default
          document.addEventListener('visibilitychange', () => {
              this.resetTime = true;
          });

  }
   animateLine = (timestamp) => {
      if (!this.startTime || this.resetTime) {
        this.startTime = timestamp;
        this.resetTime = false;
      }

      // Stop when all marker points are visited
      if (this.currentIndex >= this.markerCoordinates.length - 1) return;

      const start = this.markerCoordinates[this.currentIndex];
      const end = this.markerCoordinates[this.currentIndex + 1];
      const duration = 5000; // 1 second per segment
      const progress = (timestamp - this.startTime) / duration;

      if (progress < 1) {
        const lng = start[0] + (end[0] - start[0]) * progress;
        const lat = start[1] + (end[1] - start[1]) * progress;
        this.geojson.features[0].geometry.coordinates.push([lng, lat]);
        this.map.getSource('line').setData(this.geojson);

        this.animation = requestAnimationFrame(this.animateLine);
      } else {
        // Ensure we end exactly at the next marker
        this.geojson.features[0].geometry.coordinates.push(end);
        this.map.getSource('line').setData(this.geojson);

        this.currentIndex += 1;
        this.startTime = timestamp;
        this.animation = requestAnimationFrame(this.animateLine);
      }
    };
  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map);
    })
  }
}
