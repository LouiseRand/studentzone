<?php 
$search_query = $_POST['query'];
$Smarty->assign('query', $search_query);
$Post = new Post($Conn);
$posts = $Post->searchPosts($search_query);
$Smarty->assign('posts', $posts);
