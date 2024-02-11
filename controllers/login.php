<?php
if($_POST) {                            //only process regestration form with a submission not on page load.
    if($_POST['register']) {
        if(!$_POST['email']){
            $error = "Email not set";   //check email input is not null on regestration
        }else if(!$_POST['password']){
            $error = "Password not set";      
        }else if(!$_POST['password_confirm']){
            $error = "Password not set";      
        }
        else if($_POST['password']!=$_POST['password_confirm']){
            $error = "password and confirm password must match";
        }
        else if(strlen($_POST['password']) <8) {
            $error = "Password must be at least 8 characters in length";
        }
        else if(!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)){
            $error = "Email is not valid";
        }

       
        if($error) {
            $Smarty->assign('error', $error);
        }else{   
            $User = new User($Conn);
            $attempt = $User->createUser($_POST);
            
            if($attempt) {

                $email = new \SendGrid\Mail\Mail(); 
                $email->setFrom("S224306@uos.ac.uk", "Louise Rand");
                $email->setSubject("Welcome to StudentZone");
                $email->addTo($_POST['email'], "User");
                $email->addContent(
                     "text/html", "<h1>Welcome to StudentZone!</h1>"
                );
                $sendgrid = new \SendGrid('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');
                $response = $sendgrid->send($email);



                $Smarty->assign('success', "Your account has been created. Please login.");
            }else{
                $Smarty->assign('error', "An error occurred, please try again later.");
            }
        }   
        
        }else if($_POST['login']) {
        if(!$_POST['email']){
            $error = "Email not valid"; 
        }else if(!$_POST['password']){
            $error = "Password not valid";


        }else if(strlen($_POST['password']) <8) {
            $error = "Password must be at least 8 characters in length";
        }
        else if(!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)){
            $error = "Email is not valid";
        }else{
            $User=new User($Conn);
            $user_data=$User->loginUser($_POST['email'],$_POST['password']);
            if($user_data) {
                $_SESSION['is_loggedin'] = true;
                $_SESSION['user_data'] = $user_data;              
                header("Location: index.php?p=account");  
                exit();   
            }else{   
                $Smarty->assign('error', "Incorrect Email/Password");    
            }
        }

    }
}