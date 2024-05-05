<?php
// Include the file for handling comment submissions
require_once 'handle_comment_submission.php'; 
require_once __DIR__ . '/../classes/comment.class.php'; 

// Continue with your existing code
$recipe_id = $_GET['id'];
if($_POST['rating']) {
    $Review = new Review($Conn);
    $Review->createReview([
        "recipe_id" => (int) $recipe_id,
        "review_rating" => (int) $_POST['rating']
    ]);
}



// Fetch recipe data
$Recipe = new Recipe($Conn);
$recipe_data = $Recipe->getRecipe($recipe_id);
$Smarty->assign('recipe', $recipe_data);

// Calculate recipe rating
$Review = new Review($Conn);
$recipe_rating = $Review->calculateRating($recipe_id);
$Smarty->assign('recipe_rating', round($recipe_rating['avg_rating'], 1));


// Retrieve comments for the recipe from the database
$Comment = new Comment($Conn);
$comments = $Comment->getCommentsForRecipeWithUserNames($recipe_id);
// Pass the comments data to the template
$Smarty->assign('comments', $comments);


if($_SESSION['user_data']) {
    $Favourite = new Favourite($Conn);
    $is_fav = $Favourite->isFavourite($recipe_id);
    if($is_fav){
        $Smarty->assign('is_fav', true);
    }else{
        $Smarty->assign('is_fav', false);
    }
    
    
}





