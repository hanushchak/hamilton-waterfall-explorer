<?php 
// Author: Maksym Hanushchak, 000776919
class Core
{
    public function postReview($waterfall_id, $review_name, $review_text, $review_rating)
    {
        try
        {
            require 'connect.php';

            $command = "INSERT INTO fp_reviews (waterfall_id, review_text, review_rating, review_name) VALUES (?, ?, ?, ?);";
            
            $stmt = $dbh->prepare($command);
            $success = $stmt->execute([$waterfall_id, $review_text, $review_rating, $review_name]);

            if ($success && $stmt->rowCount() == 1){
                return true;
            }
            else
            {
                return false;
            }
        }
        catch (Exception $e)
        {
            echo "Error occured: " . $e; 
            die();
        }
    }

    public function getReviews($waterfall_id)
    {
        try
        {
            require 'connect.php';

            $command = "SELECT * FROM fp_reviews WHERE waterfall_id = ?;"; 
            $stmt = $dbh->prepare($command); 
            $stmt->execute([$waterfall_id]); 

            $array = $stmt->fetchAll(PDO::FETCH_ASSOC);
            return $array;
        }
        catch (Exception $e)
        {
            echo "Error occured: " . $e;
            die();
        }
    }

    public function getMostReviewed()
    {
        try
        {
            require 'connect.php';

            $command = "SELECT fp_waterfalls.id, COUNT(fp_reviews.waterfall_id) AS number_of_reviews FROM fp_waterfalls LEFT JOIN fp_reviews ON fp_waterfalls.id = fp_reviews.waterfall_id GROUP BY fp_reviews.waterfall_id ORDER BY 2 DESC LIMIT 10;"; 
            $stmt = $dbh->prepare($command); 
            $stmt->execute(); 

            $array = $stmt->fetchAll(PDO::FETCH_ASSOC);
            return $array;
        }
        catch (Exception $e)
        {
            echo "Error occured: " . $e;
            die();
        }
    }

    public function getHighestRating()
    {
        try
        {
            require 'connect.php';

            $command = "SELECT fp_waterfalls.id, CAST(AVG(fp_reviews.review_rating) AS DECIMAL(3,2)) AS average_rating FROM fp_waterfalls LEFT JOIN fp_reviews ON fp_waterfalls.id = fp_reviews.waterfall_id GROUP BY fp_reviews.waterfall_id ORDER BY 2 DESC LIMIT 10;"; 
            $stmt = $dbh->prepare($command); 
            $stmt->execute(); 

            $array = $stmt->fetchAll(PDO::FETCH_ASSOC);
            return $array;
        }
        catch (Exception $e)
        {
            echo "Error occured: " . $e;
            die();
        }
    }

    public function getWaterfalls()
    {
        try
        {
            require 'connect.php';

            $command = "SELECT * FROM fp_waterfalls;"; 
            $stmt = $dbh->prepare($command); 
            $stmt->execute(); 

            $array = $stmt->fetchAll(PDO::FETCH_ASSOC);
            return $array;
        }
        catch (Exception $e)
        {
            echo "Error occured: " . $e;
            die();
        }
    }
}

?>