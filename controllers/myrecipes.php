<?php
$Recipe = new Recipe($Conn);
$user_recipes = $Recipe->getUserRecipes();
$Smarty->assign('user_recipes', $user_recipes);