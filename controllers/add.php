<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL & ~E_NOTICE);

$Category = new Category($Conn);
$categories = $Category->getAllCategories();
$Smarty->assign('categories', $categories);

if($_POST) {
    if(!$_POST['recipe_name']) {
        $error = "Recipe name is required.";
    } else if(!$_POST['recipe_ingredients']) {
        $error = "Recipe ingredients are required.";
    } else if(!$_POST['recipe_instructions']) {
        $error = "Recipe instructions are required.";
    } else if(!$_POST['recipe_time']) {
        $error = "Recipe time is required.";
    } else if(!$_POST['recipe_servings']) {
        $error = "Recipe servings are required.";
    } else if (!$_POST['recipe_budget']) {  // Check if recipe budget is set
        $error = "Recipe budget not set";
    } else if(empty($_POST['cat_id'])) {
        $error = "Recipe category is required.";
    } else if(!$_FILES['recipe_image']['name']) {           
        $error = "Please upload a recipe image.";
    } else {
        // Generate a random filename for the uploaded image
        $random = substr(str_shuffle(MD5(microtime())), 0, 10);
        $new_filename = $random . $_FILES['recipe_image']['name'];
        
        // Move the uploaded image to the destination directory
        if (move_uploaded_file($_FILES['recipe_image']['tmp_name'], __DIR__.'/../user-images/'.$new_filename)) {
            // Prepare the recipe data for insertion
            $user_id = $_SESSION['user_data']['user_id'];
            $recipe_data = [
                'cat_id' => $_POST['cat_id'],
                'recipe_name' => $_POST['recipe_name'],
                'recipe_ingredients' => $_POST['recipe_ingredients'],
                'recipe_instructions' => $_POST['recipe_instructions'],
                'recipe_time' => $_POST['recipe_time'],
                'recipe_servings' => $_POST['recipe_servings'],
                'recipe_budget' => $_POST['recipe_budget'], // Include recipe_budget
                'recipe_image' => $new_filename,
                'user_id' => $user_id
            ];

            // Create a new Recipe object
            $Recipe = new Recipe($Conn);
            // Call the addRecipe method with the recipe data
            $attempt = $Recipe->addRecipe($recipe_data);
    
            if($attempt) {
                $Smarty->assign('success', "Your recipe has been added.");
            } else {
                $Smarty->assign('error', "An error occurred while adding your recipe.");
            }
        } else {
            $error = "Failed to upload the recipe image.";
        }
    }

    if($error) {
        $Smarty->assign('error', $error);
    }
}
?>
