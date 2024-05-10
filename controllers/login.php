<?php
if ($_POST) {
    if (isset($_POST['register'])) {
        // Registration logic
        $User = new User($Conn);

        $email_parts = explode('@', $_POST['email']);    // Check if email is from uos.ac.uk domain
        if ($email_parts[1] !== 'uos.ac.uk') {
            $error = "Email must be from uos.ac.uk domain.";  
        } elseif ($User->isEmailExists($_POST['email'])) {     //prevention of duplicate email addresses for new accounts
            $error = "Email is already in use. Please choose a different email.";
        } elseif ($User->isUsernameExists($_POST['user_name1'])) {   //prevent duplicate usernames for new accounts
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
        } elseif (!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
            $error = "Email is not valid.";
        } else {
            // Prepare SQL statement with parameters
            $stmt = $Conn->prepare("SELECT * FROM users WHERE user_email = :email");
    
            // Bind parameters
            $stmt->bindParam(':email', $_POST['email']);
    
            // Execute statement
            $stmt->execute();
    
            // Fetch user data
            $user_data = $stmt->fetch(PDO::FETCH_ASSOC);
    
            // Verify password
            if ($user_data) {
                if (password_verify($_POST['password'], $user_data['user_pass'])) {
                    // User authenticated successfully, proceed with login
                    $_SESSION['is_loggedin'] = true;
                    $_SESSION['user_data'] = $user_data;
                    header("Location: /studentzone/account");
                    exit();
                } else {
                    // Incorrect password
                    $error = "Incorrect password.";
                }
            } else {
                // User not found
                $error = "User not found.";
            }
        }
    
        // Assign error message to Smarty template
        $Smarty->assign('error', $error);
    }
    
}
