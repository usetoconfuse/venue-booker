<?php
include "db-config.php";
            
// Establish database connection
$conn = new mysqli($servername, $username, $password, $dbname);
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Retrieve all venue details used for the detailed information page for each venue
// This includes all information about the venue as well as 
$sql = "SELECT venue_id, name, latitude, longitude FROM venue;";

$result = mysqli_query($conn, $sql);
    
// Process query results into JSON
$resultArray = array();
while ($row = mysqli_fetch_array($result)) {
    $resultArray[] = $row;
}

echo json_encode($resultArray);
mysqli_close($conn);
?>