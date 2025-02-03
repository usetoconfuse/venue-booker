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
$partySize = $jsonData["partySize"];
$minGrade = $jsonData["minGrade"];
$date = $jsonData["date"];

// Retrieve all results meeting filter criteria:
// Capacity that accomodates the party size,
// Catering available with at least the minimum grade,
// Venue is available on the chosen date.
$sql = 'SELECT venue_id FROM venue
WHERE capacity >= '.$partySize.'
AND EXISTS (
    SELECT venue_id FROM catering
    WHERE venue.venue_id = catering.venue_id AND grade >= '.$minGrade.')
AND NOT EXISTS (
    SELECT venue_id FROM venue_booking
    WHERE venue.venue_id = venue_booking.venue_id AND booking_date = "'.$date.'");';

$result = mysqli_query($conn, $sql);
    
// Process query results into JSON
$resultArray = array();
while ($row = mysqli_fetch_array($result)) {
    $resultArray[] = $row;
}

echo json_encode($resultArray);
mysqli_close($conn);
?>