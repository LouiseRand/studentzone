<?php
require_once __DIR__ . '/../classes/comment.class.php'; 

// Check if the form for submitting comments was submitted
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['comment'])) {
    // Check if the user is logged in
    if (isset($_SESSION['user_data'])) {
        // Get the user data from the session
        $user_data = $_SESSION['user_data'];

        // Get the recipe ID and comment text from the form
        $recipe_id = $_POST['recipe_id'];
        $comment_text = $_POST['comment'];

        // Create a new Comment object
        $comment = new Comment($Conn);

        // Prepare the comment data
        $comment_data = [
            'user_id' => $user_data['user_id'], // Get user ID from session data
            'recipe_id' => $recipe_id, // Use the recipe ID directly
            'comment_text' => $comment_text
        ];

        // Call the createComment method to insert the comment into the database
        $result = $comment->createComment($comment_data);

        // Check if the comment was successfully inserted
        if ($result) {
            // Comment inserted successfully
            echo "<p>Thank you for your comment!</p>";
            // Get the current URL
            $current_url = $_SERVER['REQUEST_URI'];
            // Check if the id parameter already exists in the current URL
            if (strpos($current_url, 'id=') === false) {
                // Append the recipe ID as a parameter to the current URL
                $redirect_url = $current_url . (strpos($current_url, '?') ? '&' : '?') . 'id=' . $recipe_id;
            } else {
                // If id parameter already exists, use the current URL
                $redirect_url = $current_url;
            }
            // Redirect to the updated URL after a delay
            echo "<script>setTimeout(function() { window.location.href = '$redirect_url'; }, 1000);</script>";  
        } else {
            // Failed to insert comment
            echo "<p>Failed to submit your comment. Please try again later.</p>";
        }
    } else {
        // User is not logged in
        echo "<p>Please log in to leave a comment.</p>";
    }
}







