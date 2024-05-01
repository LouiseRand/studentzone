<?php

class Recipe {
    protected $Conn;
    public function __construct($Conn){
        $this->Conn = $Conn;
    }

    public function addRecipe($data) {
        // Get the user ID and username from the session
        $user_id = $_SESSION['user_data']['user_id'];
        $username = $_SESSION['user_data']['user_name1'];
    
        // Prepare the insert query
        $query = "INSERT INTO recipes (cat_id, user_id, user_name1, recipe_name, recipe_image, recipe_time, recipe_servings, recipe_budget, recipe_ingredients, recipe_instructions) 
                  VALUES (:cat_id, :user_id, :user_name1, :recipe_name, :recipe_image, :recipe_time, :recipe_servings, :recipe_budget, :recipe_ingredients, :recipe_instructions)";
    
        // Prepare the statement
        $stmt = $this->Conn->prepare($query);
    
        // Bind parameters
        $stmt->bindParam(':cat_id', $data['cat_id']);
        $stmt->bindParam(':user_id', $user_id);
        $stmt->bindParam(':user_name1', $username);
        $stmt->bindParam(':recipe_name', $data['recipe_name']);
        $stmt->bindParam(':recipe_image', $data['recipe_image']);
        $stmt->bindParam(':recipe_time', $data['recipe_time']);
        $stmt->bindParam(':recipe_servings', $data['recipe_servings']);
        $stmt->bindParam(':recipe_budget', $data['recipe_budget']);
        $stmt->bindParam(':recipe_ingredients', $data['recipe_ingredients']);
        $stmt->bindParam(':recipe_instructions', $data['recipe_instructions']);
    
        // Execute the statement
        return $stmt->execute();
    }


    public function getRecipe($recipe_id){                 //Fetching an individual recipe.
        $query = "SELECT * FROM recipes WHERE recipe_id = :recipe_id";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute([
            "recipe_id" => $recipe_id
        ]);
        $recipe_data = $stmt->fetch(PDO::FETCH_ASSOC);
        $query = "SELECT * FROM recipe_images WHERE recipe_id = :recipe_id";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute([
            "recipe_id" => $recipe_id
        ]);
        $recipe_data['images'] = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $recipe_data;

    }


    public function searchRecipes($query_string) {    //search function
        $query = "SELECT * FROM recipes WHERE recipe_name LIKE :query_string";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute([
            "query_string" => "%".$query_string."%"  //allows the return of partial results matching the search input: pizza will also be searched with p
        ]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
        

    }



    
    public function getAllRecipesForCategory($category_id){   //shows all recipes from a category with the same cat id.
        $query = "SELECT * FROM recipes WHERE cat_id = :cat_id";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute([
        "cat_id" => $category_id
        ]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC); 
    }


    //public function getFeaturedRecipes(){          //featured recipe slide cards
    //$query = "SELECT * FROM recipes WHERE recipe_featured = 1";
    ///$stmt = $this->Conn->prepare($query);
   // $stmt->execute();
   // return $stmt->fetchAll(PDO::FETCH_ASSOC);

   // }

    public function getUserRecipes(){
        $query = "SELECT * FROM recipes WHERE user_id = :user_id";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute([
            "user_id" => $_SESSION['user_data']['user_id']
        ]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
        

    }



    //public function randomlySetFeaturedRecipes(){
     //   $query = "UPDATE recipes SET recipe_featured = 0 WHERE recipe_featured = 1";
      //  $stmt = $this->Conn->prepare($query);
      //  $stmt->execute();
       
     //   $query = "UPDATE recipes SET recipe_featured = 1 ORDER BY RAND() LIMIT 6";
     //   $stmt = $this->Conn->prepare($query);
      //  $stmt->execute();
        


   // }

}


