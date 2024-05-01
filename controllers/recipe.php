<?php
// Include the file for handling comment submissions
require_once 'handle_comment_submission.php'; 

// Continue with your existing code
$recipe_id = $_GET['id'];

// Fetch recipe data
$Recipe = new Recipe($Conn);
$recipe_data = $Recipe->getRecipe($recipe_id);
$Smarty->assign('recipe', $recipe_data);

// Calculate recipe rating
$Review = new Review($Conn);
$recipe_rating = $Review->calculateRating($recipe_id);
$Smarty->assign('recipe_rating', round($recipe_rating['avg_rating'], 1));











