<?php 
// Author: Maksym Hanushchak, 000776919
    try{
        if($_SERVER["SERVER_NAME"] === "csunix.mohawkcollege.ca"){
            $dbh = new PDO("mysql:host=localhost;dbname=", "", "");
        }
        else{
            $dbh = new PDO("mysql:host=localhost;dbname=hamilton_waterfall_explorer", "root", "");
        }
    }
    catch(Exception $e) {
        echo "Error occured: " . $e;
        die();
    } 
?>