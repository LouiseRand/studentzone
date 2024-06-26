<?php
class Comment {
    protected $Conn;

    public function __construct($Conn) {
        $this->Conn = $Conn;
    }

    public function createComment($comment_data){
        $query = "INSERT INTO comments (recipe_id, user_id, comment_text, created_at) VALUES (?, ?, ?, ?)";
        try {   
            $stmt = $this->Conn->prepare($query);
            $stmt->bindParam(1, $comment_data['recipe_id'], PDO::PARAM_INT);
            $stmt->bindParam(2, $comment_data['user_id'], PDO::PARAM_INT);
            $stmt->bindParam(3, $comment_data['comment_text'], PDO::PARAM_STR);
            $stmt->bindParam(4, date('Y-m-d H:i:s'), PDO::PARAM_STR);
            return $stmt->execute();
        } catch (PDOException $e) {
            // Log error or handle it as required
            error_log('Failed to insert comment: ' . $e->getMessage());
            return false;
        }
    }




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