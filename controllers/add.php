<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL & ~E_NOTICE);
$Category = new Category($Conn);
$categories = $Category->getAllCategories();
$Smarty->assign('categories', $categories);


if($_POST) {                                              // if post -ensures form is not processed untill a submission is made//
    if(!$_POST['recipe_name']){                           //validate text based data//
        $error = "Recipe name not set";
    }else if(!$_POST['recipe_ingredients']){
        $error = "Recipe ingredients not set";
    }else if(!$_POST['recipe_instructions']){
        $error = "Recipe instructions not set";
    }else if(!$_POST['recipe_time']){
        $error = "Recipe time not set";
    }else if(!$_POST['recipe_servings']){
        $error = "Recipe servings not set";
    }else if(!$_FILES['recipe_image'][ 'name']) {           
        $error = "Please upload a recipe image";
    }
    
    if($error) {
        $Smarty->assign('error', $error);
    }else{
        $random = substr(str_shuffle(MD5(microtime())), 0, 10);
        $new_filename = $random . $_FILES['recipe_image']['name'];
        
        if (move_uploaded_file($_FILES['recipe_image']['tmp_name'], __DIR__.'/../user-images/'.$new_filename)) {


            $user_id = $_SESSION['user_data']['user_id'];
            // Add the user ID to the $_POST array
            $_POST['user_id'] = $user_id;
            $user_name1 = $_SESSION['user_data']['user_name1'];   //calling the username of user who added the recipe
           




            $Recipe = new Recipe($Conn);
            $_POST['recipe_image'] = $new_filename;
            $attempt = $Recipe->addRecipe($_POST);
    
    
            if($attempt) {
                $Smarty->assign('success', "Your recipe has been added.");
            }else{
                $Smarty->assign('error', "An error occurred.");
            }
        } 
    }   
}