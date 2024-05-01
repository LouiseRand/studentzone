<?php 
$search_query = $_POST['query'];
$Smarty->assign('query', $search_query);

//executes searchRecipes method:
$Recipe = new Recipe($Conn); 
$recipes = $Recipe->searchRecipes($search_query);
$Smarty->assign('recipes', $recipes);