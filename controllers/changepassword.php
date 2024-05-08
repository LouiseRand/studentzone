<?php
if ($_POST) {
    // Check if required fields are set
    if (!isset($_POST['currentPassword']) || !isset($_POST['newPassword'])) {
        $error = "Both current and new password are required.";
    } else {
        // Check if the fields are empty
        if (empty($_POST['currentPassword']) || empty($_POST['newPassword'])) {
            $error = "Both current and new password are required.";
        } else {
            // Sanitize input data
            $currentPassword = trim($_POST['currentPassword']);
            $newPassword = trim($_POST['newPassword']);

            // Call the method to change password
            $changePass = $User->changeUserPassword($currentPassword, $newPassword);

            if ($changePass === true) {
                $success = "Password has been updated successfully.";
            } elseif ($changePass === false) {
                $error = "Failed to update password. The current password is incorrect.";
            } else {
                $error = "An error occurred while updating the password.";
            }
        }
    }

    // Assign error or success message to Smarty template
    if (isset($error)) {
        $Smarty->assign('error', $error);
    } elseif (isset($success)) {
        $Smarty->assign('success', $success);
    }
}

