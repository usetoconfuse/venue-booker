// This script includes all functionality for the details page details.php
// This page provides details for a specific venue such as charts and location info

// This function creates a Leaflet map marker from given name and coordinates with the matching address
async function createMarker(map, name, latitude, longitude) {
    let addressData = await(fetch(`https://nominatim.openstreetmap.org/reverse?lat=${latitude}&lon=${longitude}&format=json`));
    let addressJson = await addressData.json();
    let address = addressJson.address;

    let streetAddress = address.road;
    if (address.house_number) {
        streetAddress = address.house_number + " " + streetAddress;
    }
    let city = address.city
    let postcode = address.postcode;

    let marker = L.marker([latitude, longitude]).addTo(map).openPopup();

    marker.bindPopup(`<b>${name}</b><br>${streetAddress}<br>${city}<br>${postcode}`);

    // Return marker so that we can choose to have the popup displaying initially
    return marker;
}

$(document).ready(async function() {

// Get all data for the selected venue
let currentId = $(".card").attr("id").slice(5);

if (!parseInt(currentId)) {
    $(".card-body").html("<h1>Oops! Venue not found</h1>");
    return;
}

const venueDetails = await(fetch("querylist.php", {
    method: "POST",
    headers: {"Content-Type" : "application/json"},
    body: JSON.stringify({"venue_id": currentId})
}));
const venueJson = await venueDetails.json();

const cateringDetails = await(fetch("querycatering.php", {
    method: "POST",
    headers: {"Content-Type" : "application/json"},
    body: JSON.stringify({"venue_id": currentId})
}));
const cateringJson = await cateringDetails.json();

if (JSON.stringify(venueJson) == "[]") {
    $(".card-body").html("<h1>Oops! Venue not found</h1>");
    return;
}

else {

let currentVenue = venueJson[0];

let name = currentVenue.name;
let capacity = currentVenue.capacity;
let weekendPrice = currentVenue.weekend_price;
let weekdayPrice = currentVenue.weekday_price;
let licensed = currentVenue.licensed;
let reviews = currentVenue.reviews;
let avgscore = currentVenue.avgscore;
let bookings = currentVenue.bookings;
let currentLatitude = currentVenue.latitude;
let currentLongitude = currentVenue.longitude;
// Fix average score to 1 decimal place
avgscore = (Math.round(avgscore * 10)/10).toFixed(1);



let licensedImage = "";
if (licensed == 0) {
    licensedImage = `<img class="img-fluid mt-3" src="nolicense.png" alt="No license"
    style="max-height:1.4rem" data-bs-toggle="tooltip" data-bs-placement="right" title="This venue is not licensed">`;
}

// Add canvases for charts and venue details to the card
let cardHtml = `
    <div class="row p-2">
        <div class="col-lg-6">
            <h2>Booking History - 2024</h2>
            <canvas id="bookingChart" class="p-2 border border-secondary"></canvas>
        </div>
        <div class="col-lg-6">
            <h2>Reviews</h2>
            <canvas id="reviewChart" class="p-2 border border-secondary"></canvas>
        </div>
    </div>

    <hr>

    <div class='d-flex mt-3 align-self-center'>
        <h1 class='px-3'>${name}</h1>
        ${licensedImage}
        <p class='fs-2 ms-3'>£${weekdayPrice}/£${weekendPrice}
        <span class='text-muted' style='font-size:60%'>weekday/weekend</span></p>
    </div>
    
    <div class='row'>
        <div class='col-lg-4 ps-3'>
            <div class="d-flex ps-3">
                <div class="d-flex">
                    <img class="img-fluid mt-1" src="capacity.svg" alt="Capacity" style="max-height:1.5rem"
                    data-bs-toggle="tooltip" data-bs-placement="bottom" title="Capacity">
                    <p class="fs-5 ps-1">${capacity}</p>
                </div>
                <div class="d-flex ps-5">
                    <img class="img-fluid mt-1" src="star.png" alt="Score" style="max-height:1.4rem"
                    data-bs-toggle="tooltip" data-bs-placement="bottom" title="Score">
                    <p class="ps-2 fs-5">${avgscore}
                    <span class="text-muted" style="font-size:80%">(${reviews} reviews)</span></p>
                </div>
                <div class="d-flex ps-4">
                    <img class="img-fluid mt-1" src="bookings.png" alt="Bookings" style="max-height:1.3rem"
                    data-bs-toggle="tooltip" data-bs-placement="bottom" title="Bookings">
                    <p class="fs-5 ps-1">${bookings}</p>
                </div>
            </div>
    
            <h4 class="ps-4 pt-2">Catering Options</h4>
            <div class="col-6 ms-4">
            <table class="table text-end">
                <thead>
                    <tr>
                    <th scope="col">Grade (1-5)</th>
                    <th scope="col">Price pp</th>
                    </tr>
                </thead>
                <tbody>`;

                // Populate catering options table
                cateringJson.forEach(option => {
                    cardHtml += `
                    <tr class="cateringOption">
                        <td>${option.grade}</td>
                        <td>£${option.cost}</td>
                    </tr>`;
                });
    
    // Add map showing venue location 
    cardHtml +=  `
                </tbody>  
            </table>
            </div>
        </div>
        <div class="col-lg-8 pe-4">
            <div id="map" class="border border-secondary" style="height:30vh"></div>
            <p class="text-muted fs-6">Zoom to see other venues</p>
        </div>
    </div>`;

// Add card contents
$(".card-body").html(cardHtml);

// Enable 'not licensed' icon tooltip
$(".img-fluid").tooltip();



// --------------------------------------------------------------------
// ------------------------------CHARTS--------------------------------
// --------------------------------------------------------------------

// Data for booking chart
const bookChart = document.getElementById('bookingChart');

const dateResults = await fetch("querybookingdates.php", {
    method: "POST",
    headers: {"Content-Type" : "application/json"},
    body: JSON.stringify({"venue_id": currentId})
});
const bookingJson = await dateResults.json();

let monthlyData = Array();
for (let i=0; i<12; i++) {
    monthlyData[i] = 0;
}

bookingJson.forEach(item => {
    let date = new Date(item.booking_date);
    let month = date.getMonth();
    monthlyData[month]++;
});

// Create booking history chart
new Chart(bookChart, {
    type: 'line',
    data: {
    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
    datasets: [{
        label: 'Bookings',
        data: monthlyData,
        borderWidth: 1
    }]
    },
    options: {
    scales: {
        y: {
        beginAtZero: true
        }
    }
    }
});

// Data for review chart
const revChart = document.getElementById('reviewChart');

const reviewResults = await fetch("queryreviews.php", {
    method: "POST",
    headers: {"Content-Type" : "application/json"},
    body: JSON.stringify({"venue_id": currentId})
});
const reviewJson = await reviewResults.json();

let reviewData = Array();
for (let i=0; i<10; i++) {
    reviewData[i] = 0;
}

reviewJson.forEach(item => {
    let score = item.score;
    reviewData[score-1]++;
});

// Reverse so that reviews are displayed from highest to lowest rating
reviewData.reverse();

// Create review score chart
new Chart(revChart, {
    type: 'bar',
    data: {
    labels: ['10', '9', '8', '7', '6', '5', '4', '3', '2', '1'],
    datasets: [{
        label: 'Reviews',
        data: reviewData,
        borderWidth: 1
    }]
    },
    options: {
    indexAxis : 'y',
    scales: {
    x: {
        display : false
    },
    y: {
        grid: {
        display : false
        }
    }
    }
    }
});



// --------------------------------------------------------------------
// --------------------------------MAP---------------------------------
// --------------------------------------------------------------------

// Get latitude and longitude of every venue from venue table
const locationsData = await(fetch("querylocations.php"));
const locationsJson = await locationsData.json();

// Initialize the map and tile layer, focused on the selected venue's location
let map = L.map("map")
map.setView([currentLatitude, currentLongitude], 11);
L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 17,
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
}).addTo(map);

// Create a marker for the selected venue first
let currentMarker = await createMarker(map, name, currentLatitude, currentLongitude);
currentMarker.openPopup();

// Create a marker for every other venue
locationsJson.forEach(async item => {

    if (item.venue_id == currentId) return;

    createMarker(map, item.name, item.latitude, item.longitude);
});

}

});