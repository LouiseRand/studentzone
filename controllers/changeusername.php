<?php
if($_POST) {
    if(!$_POST['currentname1']){
        $error = "Current username not set";
    }else if(!$_POST['newname1']){
        $error = "New username not set";
    }

    if($error) {
        $smarty->assign('error', $error);
    }else{
        // Validation passed
        $change_name1 = $User->changeusername1($_POST['currentname1'], 
        $_POST['newname1']);
        if($change_name1) {
            $Smarty->assign('success', "username has been updated.");
        }else{
            $Smarty->assign('error', "Something went wrong.");
        }

    }
}