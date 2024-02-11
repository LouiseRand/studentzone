<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL & ~E_NOTICE);



require_once(__DIR__ . '/includes/boot.include.php');


if($_GET['p']) {

    $secure_pages = array('account','changepassword','myrecipes','favorite','add');
    if (in_array($_GET['p'], $secure_pages)) {
        if(!$_SESSION['is_loggedin']) {
            header("Location: index.php?p=login");
            exit();
        }    
    }

 
    $Smarty->assign('view_name', $_GET['p']);
    require_once('controllers/'.$_GET['p'].'.php');
    $Smarty->display('pages/'.$_GET['p'].'.tpl');


    
}else{
    $Smarty->assign('view_name', 'home');
    require_once('controllers/home.php');
    $Smarty->display('pages/home.tpl');
}