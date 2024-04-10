<?php
session_start();
require_once(__DIR__.'/../includes/config.include.php');
require_once(__DIR__.'/../includes/db.include.php');
require_once(__DIR__.'/../includes/autoloader.include.php');


if($_SESSION['user_data']){
    $recipe_id = (int) $_POST['recipe_id'];
    if($recipe_id) {
        $Favourite = new Favourite($Conn);
        $toggle = $Favourite->toggleFavourite($_POST['recipe_id']);
    if($toggle) {
    echo json_encode(array(
        "success" => true,
        "reason" => "Recipe was added to users favourites."
    ));

}else{
    echo json_encode(array(
        "success" => true,
        "reason" => "Recipe was removed from users favourites."
    ));
}

    }else{
        echo json_encode(array(
            "success" => false,
            "reason" => "Recipe ID not provided."
        ));
    }

    
}else{
    echo json_encode(array(
        "success" => false,
        "reason" => "User not logged in."
    ));
}
