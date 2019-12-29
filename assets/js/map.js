mapboxgl.accessToken = process.env.API_KEY_MAPBOX;
const MAP_ID = 'map';
const MAP_CENTER = [-123.326103, 42.440739];
const MAP_ZOOM = 9;
const MAP_STYLE = 'mapbox://styles/mapbox/streets-v11';
const MAP_OPTIONS = {
  enableHighAccuracy: true,
};

const make = (map) => {
  navigator.geolocation.getCurrentPosition(({ coords }) => {
    const { latitude, longitude } = coords;

    map.setCenter([longitude, latitude]);

    // todo: implement with real data
    let toMake = 10;
    const makePet = () => ({
      lat: latitude + Math.random(),
      long: longitude + Math.random()
    });

    while (toMake--) {
      const { long, lat } = makePet();
      new mapboxgl.Marker()
        .setLngLat([long, lat])
        .addTo(map)
    }
  }, (error) => {
    console.log("map:error", { error });
  }, MAP_OPTIONS);
}

const map = new mapboxgl.Map({
  container: MAP_ID,
  style: MAP_STYLE,
  center: MAP_CENTER,
  zoom: MAP_ZOOM
});

make(map);

export { map }
