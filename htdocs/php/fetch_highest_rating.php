<?php
// Author: Maksym Hanushchak, 000776919
try
{  
    require 'core.php';
    $core = new Core();
    
    echo json_encode($core->getHighestRating());

}
catch(Exception $e)
{
    echo "Error occured: " . $e;
    die();
}

?>
