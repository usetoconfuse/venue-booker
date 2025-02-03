<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">
    <meta name="viewport">

    <!-- Include Bootstrap, jQuery, Chart.js and Leaflet -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"rel="stylesheet"
    integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
    integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY="
    crossorigin=""/>
    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
    integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo="
    crossorigin=""></script>

    <!-- Source file -->
    <script src="details.js"></script>

    <title>Details</title>
    <link rel="icon" href="favicon.png">

    <style>
    /* Set the background image of the webpage to nice leaves */
    body{background-image:url("background.jpg");
        backdrop-filter:blur(4px);
        background-attachment:fixed;
        min-height:100vh;}
    </style>

</head>

<body>

<?php
// Get the ID of the selected venue
$venue_id = htmlspecialchars($_GET["venue_id"]);
?>

<!-- Navbar -->
<nav class = "navbar navbar-expand-lg bg-primary navbar-dark sticky-top">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
        <a class="navbar-brand ps-lg-5 ps-4">MyWedding</a>
        <ul class="navbar-nav ps-4">
            <li class="nav-item">
                <a class="nav-link" href="wedding.php">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="about.html">About</a>
            </li>
        </ul>
    </div>
</nav>

<!-- Card container, populated by script file -->
<div class="container d-flex justify-content-center">
<div id="card-<?php echo $venue_id?>" class="card my-3" style="width:75rem">
    <div class="card-body">
    </div>
</div>
</div>

</body>

</html>