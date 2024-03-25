<?php

class Recipe{
    protected $Conn;
    public function __construct($Conn){
        $this->Conn = $Conn;
    }

    public function addRecipe($data){
        $query = "INSERT INTO recipes (cat_id, user_id, recipe_name, recipe_image, recipe_time, recipe_servings, recipe_budget, recipe_instructions) 
        VALUES (:cat_id, :user_id, :recipe_name, :recipe_image, :recipe_time, :recipe_servings, :recipe_budget, :recipe_instructions)";
        $stmt = $this->Conn->prepare($query);
        $data['user_id'] = $_SESSION['user_data']['user_id'];
        return $stmt->execute($data);
    }
    
    public function getRecipe($recipe_id){
        $query = "SELECT * FROM recipes WHERE recipe_id = :recipe_id";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute([
            "recipe_id" => $recipe_id
        ]);
        $recipe_data = $stmt->fetch(PDO::FETCH_ASSOC);


        $query = "SELECT * FROM recipe_images WHERE recipe_id = :recipe_id"; //get recipe images
        $stmt = $this->Conn->prepare($query);
        $stmt->execute([
            "recipe_id" => $recipe_id
        ]);
        $recipe_data['images'] = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $recipe_data;

    }

    public function searchRecipes($query_string) {
        $query = "SELECT * FROM recipes WHERE recipe_name LIKE :query_string";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute([
            "query_string" => "%".$query_string."%"
        ]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
        

    }

    public function getAllRecipesForCategory($category_id){
        $query = "SELECT * FROM recipes WHERE cat_id = :cat_id";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute([
        "cat_id" => $category_id
        ]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC); 
    }
    
    public function getAllFavouritesForUser(){
        $query = "SELECT * FROM user_favs LEFT JOIN recipes ON user_favs.recipe_id = recipes.recipe_id WHERE user_favs.user_id = :user_id";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute([
            "user_id" => $_SESSION['user_data']['user_id']
        ]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    

}

