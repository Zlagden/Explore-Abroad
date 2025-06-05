import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'


// Connects to data-controller="map2"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }
  connect() {
     this.speedFactor = 30; // number of frames per longitude degree
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





          // animated in a circle as a sine wave along the map.

    });

    this.animateLine();
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
   #animateLine() {
            if (this.resetTime) {
                // resume previous progress
                this.startTime = performance.now() - this.progress;
                this.resetTime = false;
            } else {
               this.progress = timestamp - this.startTime;
            }

            // restart if it finishes a loop
            if (this.progress > this.speedFactor * 360) {
                this.startTime = timestamp;
                this.geojson.features[0].geometry.coordinates = [];
            } else {
                const x = this.progress / this.speedFactor;
                // draw a sine wave with some math.
                const y = Math.sin((x * Math.PI) / 90) * 40;
                // append new coordinates to the lineString
                this.geojson.features[0].geometry.coordinates.push([x, y]);
                // then update the map
                this.map.getSource('line').setData(this.geojson);
            }
            // Request the next frame of the animation.
            this.animation = requestAnimationFrame(this.animateLine);
        }
  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map);
    })
  }
}
