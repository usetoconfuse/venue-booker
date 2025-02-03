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

// Return all entries or only the entry with the matching id as requested
$sql = 'SELECT * FROM catering';
if ($venue_id != "all") {
    $sql .= ' WHERE venue_id = '.$venue_id;
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