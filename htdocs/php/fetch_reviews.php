<?php
// Author: Maksym Hanushchak, 000776919
try
{  
    require 'core.php';
    $core = new Core();
    
    $waterfall_id = filter_input(INPUT_POST, "waterfall_id", FILTER_VALIDATE_INT);

    if($waterfall_id !== false && $waterfall_id !== null)
    {
        echo json_encode($core->getReviews($waterfall_id));
    }
    else
    {
        echo null;
    }
}
catch(Exception $e)
{
    echo "Error occured: " . $e;
    die();
}

?>
