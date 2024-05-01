<?php
require_once __DIR__ . '/../classes/comment.class.php'; // Adjust the path as per your project structure

// Check if the form was submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Check if the user is logged in
    if (isset($_SESSION['user_data'])) {
        // Get the user data from the session
        $user_data = $_SESSION['user_data'];

        // Check if the required fields are set
        if (isset($_POST['recipe_id']) && isset($_POST['comment'])) {
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
            } else {
                // Failed to insert comment
                echo "<p>Failed to submit your comment. Please try again later.</p>";
            }
        } else {
            // Required fields not set
            echo "<p>Invalid form submission. Please try again.</p>";
        }
    } else {
        // User is not logged in
        echo "<p>Please log in to leave a comment.</p>";
    }
}

// Display the recipe template regardless of comment submission status
//$Smarty->display('recipe.tpl');

