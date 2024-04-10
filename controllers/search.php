<?php 
$search_query = $_POST['query'];
$Smarty->assign('query', $search_query);
$Recipe = new Recipe($Conn);
$recipes = $Recipe->searchRecipes($search_query);
$Smarty->assign('recipes', $recipes);
