<?php 
// Author: Maksym Hanushchak, 000776919
try
{  
    require 'core.php';
    $core = new Core();

    $waterfall_id = filter_input(INPUT_POST, "waterfall_id", FILTER_VALIDATE_INT);
    $review_name = filter_input(INPUT_POST, "review_name", FILTER_SANITIZE_SPECIAL_CHARS);
    $review_text = filter_input(INPUT_POST, "review_text", FILTER_SANITIZE_SPECIAL_CHARS);
    $review_rating = filter_input(INPUT_POST, "review_rating", FILTER_VALIDATE_INT);


    if($waterfall_id !== false && $waterfall_id !== null && $review_name !== null && $review_name !== false && $review_text !== null && $review_text !== false && $review_rating !== null && $review_rating !== false)
    {
        $response = $core->postReview($waterfall_id, $review_name, $review_text, $review_rating);
        
        echo $response;
    }
    else
    {
        echo false;
    }
}
catch(Exception $e)
{
    echo "Error occured: " . $e; // Echoes error message
    die(); // Stopt code execution
}

?>