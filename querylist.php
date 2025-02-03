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

// Retrieve venue details used to generate venue entries in the venue list
$sql = 'SELECT * FROM
(SELECT ven.*, avg(rev.score) AS "avgscore", count(rev.venue_id) AS "reviews"
FROM venue AS ven INNER JOIN venue_review_score AS rev 
ON ven.venue_id = rev.venue_id
GROUP BY ven.venue_id) tab1
INNER JOIN (
    SELECT venue_id, count(venue_id) AS "bookings"
    FROM venue_booking
    GROUP BY venue_id) tab2
ON tab1.venue_id = tab2.venue_id';

// Return all entries or only the entry with the matching id as requested
if ($venue_id != "all") {
    $sql .= ' WHERE tab1.venue_id = '.$venue_id;
}


$result = mysqli_query($conn, $sql);
    
// Process query results into JSON
$resultArray = array();
while ($row = mysqli_fetch_array($result)) {
    $resultArray[] = $row;
}

echo json_encode($resultArray);
mysqli_close($conn);
?>