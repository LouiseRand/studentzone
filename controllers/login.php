<?php
if ($_POST) {
    if (isset($_POST['register'])) {
        // Registration logic
        $User = new User($Conn);
        if ($User->isEmailExists($_POST['email'])) {
            $error = "Email is already in use. Please choose a different email.";
        } elseif ($User->isUsernameExists($_POST['user_name1'])) {
            $error = "Username is already taken. Please choose a different username.";
        } else {
            // Validate form inputs
            if (!$_POST['email'] || !$_POST['user_name1'] || !$_POST['degree'] || !$_POST['password']) {
                $error = "All fields are required.";
            } else if (strlen($_POST['user_name1']) < 2) {
                $error = "Username must be at least 2 characters in length.";
            } else if (strlen($_POST['degree']) < 5) {
                $error = "Degree must be at least 5 characters in length.";
            } else if (strlen($_POST['password']) < 8) {
                $error = "Password must be at least 8 characters in length.";
            } else if ($_POST['password'] !== $_POST['password_confirm']) {
                $error = "Password and confirm password must match.";
            } else if (!preg_match('/[A-Z]/', $_POST['password'])) {
                $error = "Password must contain at least one uppercase letter.";
            } else if (!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
                $error = "Email is not valid.";
            }
        }

        // Handle errors or proceed with registration
        if (isset($error)) {
            // Assign error message to Smarty template
            $Smarty->assign('error', $error);
        } else {
            // Proceed with user registration
            $attempt = $User->createUser($_POST);
            if ($attempt) {
                // Registration successful
                // Send welcome email
                try {
                    $email = new \SendGrid\Mail\Mail(); 
                    $email->setFrom("S224306@uos.ac.uk", "Louise Rand");
                    $email->setSubject("Welcome to student zone!");
                    $email->addTo($_POST['email'], "User");
                    $email->addContent(
                        "text/html", "<h1>Welcome to Student Zone!</h1>" //email contents
                    );
                    $sendgrid = new \SendGrid('YOUR_SENDGRID_API_KEY');
                    $response = $sendgrid->send($email);

                    // Reset error variable after successful registration
                    $error = null;

                    // Redirect or display success message
                    $Smarty->assign('success', "Your account has been created. Please now login.");
                } catch (Exception $e) {
                    // If SendGrid fails, still consider the registration successful
                    $Smarty->assign('success', "Your account has been created. Please now login. (Failed to send welcome email)");
                }
            } else {
                // Registration failed
                $Smarty->assign('error', "An error occurred during registration. Please try again later.");
            }
        }
    } elseif (isset($_POST['login'])) {
        // Login logic
        // Validate form inputs
        if (!$_POST['email'] || !$_POST['password']) {
            $error = "Both email and password are required.";
        } else if (!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
            $error = "Email is not valid.";
        } else {
            // Attempt to authenticate user
            $User = new User($Conn);
            $user_data = $User->loginUser($_POST['email'], $_POST['password']);
            if ($user_data) {
                // User authenticated successfully, proceed with login
                $_SESSION['is_loggedin'] = true;
                $_SESSION['user_data'] = $user_data;
                header("Location: /studentzone/account");
                exit();
            } else {
                // Authentication failed, display error message
                $error = "Incorrect email/password combination.";
            }
        }

        // Assign error message to Smarty template
        $Smarty->assign('error', $error);
    }
}
