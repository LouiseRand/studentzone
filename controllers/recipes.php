<?php
$cat_id = $_GET['id'];
$Recipe = new Recipe($Conn);
$recipes = $Recipe->getAllRecipesForCategory($cat_id);
$Smarty->assign('recipes', $recipes);

$Category = new Category($Conn);
$category = $Category->getCategory($cat_id);

$Smarty->assign('category', $category);
