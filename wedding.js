// This script provides all functionality for the main page wedding.php
// This includes retrieving venue data from the database
// and dynamically generating website elements using this data

// Array that holds all venue data for each venue,
// which includes all fields from the venue table,
// the number of reviews and average review score,
// and every catering option for each venue
let venueArray = Array();

// Function to find a venue from the array by id
function findVenue(search_id) {
    return venueArray.find(function(venue) {
        return venue.venue_id == search_id;
    });
}

$(document).ready(async function() {

const details = await fetch("querylist.php", {
    method: "POST",
    headers: {"Content-Type" : "application/json"},
    body: JSON.stringify({"venue_id": "all"})
});
const detailsData = await details.json();

// Populate array with all data except catering,
// and add a sub-array for catering options
detailsData.forEach(item => {

    // Add an empty array which will store the venue's catering options
    item.catering = Array();

    venueArray.push(item);
});

// Populate catering array for each entry
const catering = await fetch("querycatering.php", {
    method: "POST",
    headers: {"Content-Type" : "application/json"},
    body: JSON.stringify({"venue_id": "all"})
});
const cateringData = await catering.json();

// Add every catering option to the array for the matching venue
cateringData.forEach(item => {

    let cateringOption = new Object();
    cateringOption.grade = item.grade;
    cateringOption.cost = item.cost;

    let index = venueArray.indexOf(findVenue(item.venue_id));
    venueArray[index].catering.push(cateringOption);
})





// Create list group
let listHtml = '';
let tabHtml = '';
venueArray.forEach(item => {
    let id = item.venue_id;
    let name = item.name;
    let capacity = item.capacity;
    let weekendPrice = item.weekend_price;
    let weekdayPrice = item.weekday_price;
    let licensed = item.licensed;
    let reviews = item.reviews;
    let avgscore = item.avgscore;
    let bookings = item.bookings;
    // Fix average score to 1 decimal place
    avgscore = (Math.round(avgscore * 10)/10).toFixed(1);

    // Add a 'no license' icon for venues that aren't licensed
    let licensedImage = "";
    if (licensed != "1") {
        licensedImage = `<img class="img-fluid d-flex align-self-center" src="nolicense.png" alt="No license"
        style="max-height:1.4rem" data-bs-toggle="tooltip" data-bs-placement="right" title="This venue is not licensed">`;
    }

    // Build a list entry for each venue
    listHtml +=
    `<a class="list-group-item list-group-item-action" id="list-${id}" data-toggle="list" href="#tab-${id}" role="tab">

        <div class="d-flex">
            <h1 class='pe-3'>${name}</h1>
            ${licensedImage}
        </div>

        <div class="d-flex">
            <div class="d-flex col-2">
                <img class="img-fluid mt-1" src="capacity.svg" alt="Capacity" style="max-height:1.5rem"
                data-bs-toggle="tooltip" data-bs-placement="bottom" title="Capacity">
                <p class="fs-5 ps-1">${capacity}</p>
            </div>
            <div class="d-flex">
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

        <div class="d-flex justify-content-end">
            <p class="venuePriceText fs-1 mb-0"></p>
        </div>

    </a>`;

    
    // Build an info tab for each venue list entry

    // Name and price information
    tabHtml +=
    `<div class="tab-pane fade" id="tab-${id}" role="tabpanel">
        <h3 class="col-11 px-2">${name}</h3>
        <p class='fs-4 ps-2'>£${weekdayPrice}/£${weekendPrice}
        <span class='text-muted' style='font-size:80%'>weekday/weekend</span></p>
        <hr>`;

    // Table of catering options
    tabHtml +=
    `<h4 class="px-2">Select Catering</h4>
    <table class="table table-hover table-borderless">
    <thead>
        <tr>
        <th scope="col">Grade (1-5)</th>
        <th scope="col">Price pp</th>
        <th scope="col">Total cost</th>
        </tr>
    </thead>
    <tbody>`

    // Populate the catering table for each venue's info tab
    item.catering.forEach(option => {
        tabHtml += 
        `<tr class="cateringOption">
            <td>${option.grade}</td>
            <td>£${option.cost}</td>
            <td class="totalCateringCost">-</td>
        </tr>`;
    });
    
    tabHtml +=
    `</tbody>
    </table>`;

    // Display total cost of booking with this party size on this day
    tabHtml +=
    `<div class="d-flex justify-content-between my-1">
    <h4 class="totalBookingCost">Total: -</h4>`;

    // See more button - leads to a separate page containing detailed venue information
    tabHtml +=
    `<button class="btnDetails btn btn-primary">More details...</button>
    </div>
    </div>`;
});

// Add the constructed list and tabs to their containers
$("#venueList").html($("#venueList").html() + listHtml);
$("#venueInfo").html($("#venueInfo").html() + tabHtml);

// Hide all list tabs so no results display until filters are applied
$("#venueList a").hide();



    
    
// --------------------------------------------------------------------
// ------------------------EVENT HANDLERS------------------------------
// --------------------------------------------------------------------
    
// Add event listener for list items to switch to the venue's info tab
$(document).on("click", "#venueList a", function() {

    // Show the correct tab
    $(this).tab("show");

    // Reset the total cost display for each tab
    $(".totalBookingCost").text("Total: -");

    // Deselect any previously selected catering options
    $(".cateringOption").removeClass("table-primary");
});



// Enable 'not licensed' icon tooltip
$(".img-fluid").tooltip();



// Add event listener for entry in the party size field
$(document).on("input", "#partySize", function() {

    // Enforce that the party size must be between 0 and 1000 inclusive
    let num = parseInt($("#partySize").val());
    if (!num || num < 0) {
        $("#partySize").val(0);
    }
    else if (num > 1000) {
        $("#partySize").val(1000);
    }

    // Update the total catering costs based on party size
    $(".totalCateringCost").each(function() {
        let perPerson = $(this).prev().text();
        perPerson = perPerson.slice(1);
        $(this).text("£" + perPerson * $("#partySize").val());
    });
});



// Update slider value when a grade is chosen
$(document).on("input", "#minGrade", function() {

    $("#minGradeText").val($("#minGrade").val());
});



// Filter the list group whenever a filter (except sort by) is updated
// Calls submit on input in order to prevent having to specify Content-Type of message
$("form").on("input", async function() {
    $("form").submit();
})
$("form").on("submit", async function(e) {

    e.preventDefault();

    // Sort array based on sort criteria
    let criteria = $("#sortBy").val().slice(0,-1);
    let order = $("#sortBy").val().slice(-1);
    
    switch (criteria) {

        case "rating": 
            venueArray.sort((a, b) => a.avgscore - b.avgscore);
            break;

        case "price": 
            let date = new Date($("#dateSelector").val());
            if (date == "Invalid Date") return;

            if (date.getDay() == 0 || date.getDay() == 6) {
                venueArray.sort((a, b) => a.weekend_price - b.weekend_price);
            }
            else {
                venueArray.sort((a, b) => a.weekday_price - b.weekday_price);
            }
            break;
        
        case "capacity": 
            venueArray.sort((a, b) => a.capacity - b.capacity);
            break;

        case "reviews": 
            venueArray.sort((a, b) => a.reviews - b.reviews);
            break;

        case "bookings":
            venueArray.sort((a, b) => a.bookings - b.bookings);
            break;
    }

    if (order == "H") {
        venueArray.reverse();
    }

    venueArray.forEach(item => {
        let id = item.venue_id;
        let listEntry = $(`#list-${id}`).detach();
        $("#venueList").append(listEntry);
    });

    let partySize = $("#partySize").val();
    let minGrade = $("#minGrade").val();
    let date = $("#dateSelector").val();

    // Only show list once all filter criteria are selected
    if (!partySize || !minGrade || !date) return;

    const response = await fetch("queryfilter.php", {
        method: "POST",
        headers: {"Content-Type" : "application/json"},
        body: JSON.stringify({"partySize": partySize, "minGrade": minGrade, "date": date})
    });
    responseData = await response.json();

    // Deselect and hide venues and current tab
    $("[class*='active show']").removeClass("active show");
    $("#venueList a").removeClass("active");
    $("#venueList a").hide();

    // Show each venue that matches filter criteria
    // Show text prompt if no entries match filter
    if (JSON.stringify(responseData) == "[]") {
        $("#emptyListText").text("Sorry, no results found.");
        $("#emptyListText").removeClass("d-none");
    }
    else {
        $("#emptyListText").addClass("d-none");
        responseData.forEach(item => {
            let listId = "#list-"+item.venue_id;
            $(listId).show();

            // When showing a tab, also display the appropriate price depending on date
            let jsDate = new Date(date);
            let venuePrice;
            if (jsDate.getDay() == 0 || jsDate.getDay() == 6) {
                venuePrice = findVenue(item.venue_id).weekend_price;
            }
            else {
                venuePrice = findVenue(item.venue_id).weekday_price;
            }
            $(listId).find(".venuePriceText").text("£" + venuePrice);

            // Filter out the catering options below the minimum grade
            let tab ="#tab-"+item.venue_id;
            let selector = tab + " .cateringOption";
            $(selector).each(function() {
                let optionGrade = $(this).find("td:first");
                optionGrade.closest("tr").show();
                if(optionGrade.text() < minGrade) {
                    optionGrade.closest("tr").hide();
                }
            });
        });
    }
});



// Update the total cost when a different catering option is chosen
$(document).on("click", ".cateringOption", function() {

    // Highlight the currently selected option
    $(this).siblings().removeClass("table-primary");
    $(this).addClass("table-primary");

    // Get the total catering cost for the selected option
    let cPrice = $("[class*=table-primary]").find(".totalCateringCost").text();
    if (cPrice == "-" || !cPrice) return;
    let cateringPrice = cPrice.slice(1);

    // Select the current tab and get the venue ID
    let tab = $("[class*='active show']");
    let tabId = tab.attr("id").slice(4);

    // Get the correct price for the selected venue at the selected date
    let venuePrice = 0;
    let date = new Date($("#dateSelector").val());
    if (date == "Invalid Date") return;

    currentVenue = findVenue(tabId);

    if (date.getDay() == 0 || date.getDay() == 6) {
        venuePrice =currentVenue.weekend_price;
    }
    else {
        venuePrice =currentVenue.weekday_price;
    }

    // Apply the total price to the text field
    let totalPrice = parseInt(venuePrice) + parseInt(cateringPrice);
    tab.find(".totalBookingCost").text("Total: £"+totalPrice);
});



// Go to the details page when details button is clicked
// Pass venue details using get
$(document).on("click", ".btnDetails", function() {

    let currentId = $("[class*='active show']").attr("id").slice(4);

    let item = findVenue(currentId);

    let link = `details.php?venue_id=${item.venue_id}`;
    window.location=(link);
});

});