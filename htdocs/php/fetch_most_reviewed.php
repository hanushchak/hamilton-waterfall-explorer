<?php
// Author: Maksym Hanushchak, 000776919
try
{  
    require 'core.php';
    $core = new Core();
    
    echo json_encode($core->getMostReviewed());

}
catch(Exception $e)
{
    echo "Error occured: " . $e;
    die();
}

?>
