<?php


//$User = new User($Conn, $Smarty);





if(isset($_SESSION['user_data'])) {
    $user_data = $_SESSION['user_data'];
    $user_name1 = $user_data['user_name1'];
    $user_degree = $user_data['user_degree'];
    $Smarty->assign('user_name1', $user_name1);
    $Smarty->assign('user_degree', $user_degree);
}