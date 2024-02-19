<?php
class Category {
    protected $Conn;

    public function __construct($Conn){
        $this->Conn = $Conn;
    }
    public function getAllCategories(){
        $query = "SELECT * FROM recipe_categories ORDER BY cat_name ASC";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getCategory($category_id) {
        $query = "SELECT * FROM recipe_categories WHERE cat_id = :cat_id";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute([
            "cat_id" => $category_id
        ]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }    
    

}


