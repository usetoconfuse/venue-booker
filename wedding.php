<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">
    <meta name="viewport">

    <!-- Include Bootstrap and jQuery -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"rel="stylesheet"
    integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Source file -->
    <script src="wedding.js"></script>

    <title>MyWedding</title>
    <link rel="icon" href="favicon.png">

    <style>
        
    /* Set the background image of the webpage to nice leaves */
    body{background-image:url("background.jpg");
        backdrop-filter:blur(4px);
        background-attachment:fixed;
        min-height:100vh;}

    /* Offset the sticky position for containers to account for navbar */
    .sticky-offset{top:72px;}

    </style>

</head>

<!-- Body has sticky-top to that tooltips display correctly -->
<body class="sticky-top">

<!-- Navbar -->
<nav class = "navbar navbar-expand-lg bg-primary navbar-dark sticky-top">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
        <a class="navbar-brand ps-lg-5 ps-4">MyWedding</a>
        <ul class="navbar-nav ps-4">
            <li class="nav-item">
                <a class="nav-link active" href="wedding.php">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="about.html">About</a>
            </li>
        </ul>
    </div>
</nav>

<!-- Container and row for content (filters and results) -->
<div id="main" class="container">
<div id="mainrow" class="row py-3 gap-3 d-flex justify-content-center">

    <!-- Filter column -->
    <div id="filterList" class="col-lg-3 py-2 h-100 bg-light d-flex flex-column sticky-lg-top sticky-offset">
        <h1 class="d-flex align-self-center">Filter</h1>
        <hr>

        <!-- Filter input form -->
        <form>
            <!-- Party size number input -->
            <label for="partySize" class="form-label">Party Size</label>
            <input id="partySize" name="partySize" type="number" class="form-control" min="0" max="1000">
            <hr>

            <!-- Catering grade input -->
            <div class="row py-1">
            <label for="minGrade" class="col-9 col-form-label">Minimum Catering Grade</label>
            <div class="col-3">
            <input readonly id="minGradeText" type="text" class="form-control" value="1">
            </div>
            </div>
            <input id="minGrade" name="minGrade" type="range" class="form-range" min="1" max="5" value="1">
            <hr>

            <!-- Date input -->
            <label for="dateSelector" class="form-label">Date</label>
            <input id="dateSelector" name="dateSelector" type="date" min="2024-01-01" max="2024-12-31" class="form-control">
            <hr>

            <!-- Dropdown for sorting options -->
            <div class="row mb-2">
                <label for="sortBy" class="col-3 col-form-label">Sort By</label>
                <div class="col-9">
                <select id="sortBy" name="sortBy" class="form-select">
                    <option selected value="ratingH">Rating: High-Low</option>
                    <option value="ratingL">Rating: Low-High</option>
                    <option value="priceH">Price: High-Low</option>
                    <option value="priceL">Price: Low-High</option>
                    <option value="capacityH">Capacity: High-Low</option>
                    <option value="capacityL">Capacity: Low-High</option>
                    <option value="reviewsH">Reviews: High-Low</option>
                    <option value="reviewsL">Reviews: Low-High</option>
                    <option value="bookingsH">Bookings: High-Low</option>
                    <option value="bookingsL">Bookings: Low-High</option>
                </select>
                </div>
            </div>
        </form>
    </div>

    <!-- Venue list group -->
    <div class="col-lg-5 py-2 h-100 bg-light d-flex flex-column">
    <h1 class="d-flex align-self-center">Venues</h1>
    <hr>
    <h3 id="emptyListText" class="d-flex align-self-center">Enter a party size and date to see venues!</h3>
    <div id="venueList" class="list-group list-group-flush" role="tablist"></div>
    </div>

    <!-- Tab pane to display info for the selected venue -->
    <div id="infoCol" class="col-lg-3 py-2 h-100 bg-light d-flex flex-column sticky-lg-top sticky-offset">
        <h1 class="d-flex align-self-center">Information</h1>
        <hr>
    <div class="tab-content" id="venueInfo"></div>
    </div>
</div>
</div>

</body>

</html>