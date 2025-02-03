<?php
include "db-config.php";
            
// Establish database connection
$conn = new mysqli($servername, $username, $password, $dbname);
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Get requested venue id from received post message
$requestBody = file_get_contents("php://input");
$jsonData = json_decode($requestBody, true);
$venue_id = htmlspecialchars($jsonData["venue_id"]);

// Retrieve all venue details used for the detailed information page for each venue
// This includes all information about the venue as well as 
$sql = "SELECT score FROM venue_review_score WHERE venue_id = $venue_id;";

$result = mysqli_query($conn, $sql);
    
// Process query results into JSON
$resultArray = array();
while ($row = mysqli_fetch_array($result)) {
    $resultArray[] = $row;
}

echo json_encode($resultArray);
mysqli_close($conn);
?>