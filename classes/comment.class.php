<?php
class Comment {
    protected $Conn;

    public function __construct($Conn) {
        $this->Conn = $Conn;
    }

    public function createComment($comment_data){
        $query = "INSERT INTO comments (recipe_id, user_id, comment_text, created_at) VALUES (:recipe_id, :user_id, :comment_text, :created_at)";
        try {   
            $stmt = $this->Conn->prepare($query);
            return $stmt->execute([
                ':recipe_id' => $comment_data['recipe_id'], // Use the passed parameter
                ':user_id' => $comment_data['user_id'], // Use the passed parameter
                ':comment_text' => $comment_data['comment_text'], // Use the passed parameter
                ':created_at' => date('Y-m-d H:i:s') // Generate the current timestamp
            ]);
        } catch (PDOException $e) {
            // Log error or handle it as required
            error_log('Failed to insert comment: ' . $e->getMessage());
            return false;
        }
    }

    // Method to retrieve comments for a specific recipe ID
    //public function getCommentsForRecipe($recipe_id) {
      //  $query = "SELECT * FROM comments WHERE recipe_id = :recipe_id";
      //  $stmt = $this->Conn->prepare($query);
       // $stmt->execute(['recipe_id' => $recipe_id]);
      //  return $stmt->fetchAll(PDO::FETCH_ASSOC);
   // }

// Method to retrieve comments for a specific recipe ID along with user names
public function getCommentsForRecipeWithUserNames($recipe_id) {
    $query = "
        SELECT comments.*, users.user_name1
        FROM comments
        INNER JOIN users ON comments.user_id = users.user_id
        WHERE recipe_id = :recipe_id
    ";
    $stmt = $this->Conn->prepare($query);
    $stmt->execute(['recipe_id' => $recipe_id]);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

}