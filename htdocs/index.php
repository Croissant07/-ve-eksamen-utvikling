<?php
// Koble til databasen (bruk Docker-containerens navn som vert)
$servername = "mysql-db";  // Viktig: bruk tjenestenavnet i docker-compose
$username = "user";        // Bruk IKKE "root" om du ikke trenger det
$password = "pass";
$dbname = "treningsapp";


// Lag forbindelse
$conn = new mysqli($servername, $username, $password, $dbname);

// Sjekk tilkobling
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Hent data fra 'Bruker' tabellen
$sql = "SELECT * FROM Bruker";
$result = $conn->query($sql);

// Sjekk om det er resultater
if ($result->num_rows > 0) {
    // Start HTML-tabell for å vise data
    echo "<table border='1'><tr><th>Bruker ID</th><th>Navn</th><th>Email</th><th>Alder</th></tr>";

    // Hent og vis hver rad
    while($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["bruker_id"]. "</td><td>" . $row["navn"]. "</td><td>" . $row["email"]. "</td><td>" . $row["alder"]. "</td></tr>";
    }
    echo "</table>";
} else {
    echo "0 results";
}

// Lukk tilkoblingen
$conn->close();
?>
