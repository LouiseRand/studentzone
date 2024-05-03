<?php
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['query'])) {
    $search_query = $_POST['query'];
    $Smarty->assign('query', $search_query);

    // Execute searchRecipes method
    $Recipe = new Recipe($Conn); 
    $recipes = $Recipe->searchRecipes($search_query);
    $Smarty->assign('recipes', $recipes);
} else {
    // Handle case when form is not submitted or query parameter is not set
    // For example, you can display a message or redirect to a different page
}



