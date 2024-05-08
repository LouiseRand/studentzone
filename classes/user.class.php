<?php
class User {   
    protected $Conn;
    public function __construct($Conn){
        $this ->Conn = $Conn; //this links the $Conn inside the class to the one outside the class
    }




    public function createUser($user_data){   //used to register a new user:
        $sec_password = password_hash($user_data['password'], PASSWORD_DEFAULT);  //password security using pw hash to prevent raw storage of PWs
        $query= "INSERT INTO users ( user_email, user_pass, user_degree, user_name1) VALUES( :user_email, :user_pass, :user_degree, :user_name1)"; //defining SQL query
        $stmt = $this->Conn->prepare($query);
        return $stmt->execute(array(
            'user_email'=> $user_data['email'],
            'user_degree'=> $user_data['degree'],
            'user_name1' => $user_data['user_name1'],
            'user_pass' => $sec_password)); //pass through user registration data and execute the query
    }




    public function loginUser($email,$password){
        $query = "SELECT * FROM users WHERE user_email = :user_email";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute(array('user_email' => $email));
        $attempt = $stmt->fetch();
        if($attempt && password_verify($password, $attempt['user_pass'])) {
            return $attempt;    
        }else{   
            return false;    
        }
    }
    public function getUser($user_id) {
        $query = "SELECT * FROM users WHERE user_id = :user_id";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute(array(':user_id' => $user_id));
        return $stmt->fetch();
    }
    
    public function changeUserPassword($current_pass, $new_pass) {
        if(!password_verify($current_pass, $_SESSION['user_data']['user_pass'])) {
            // wrong pass
            return false;
        }
    
        $new_sec_pass = password_hash($new_pass, PASSWORD_DEFAULT);
        $query = "UPDATE users SET user_pass = :user_pass WHERE user_id = :user_id";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute(array('user_pass' => $new_sec_pass, 'user_id' => $_SESSION['user_data']['user_id']));
        return true;
    }
    
    public function getUserName($user_id) {
        // Retrieve user data based on user ID
        $user_data = $this->getUser($user_id);
        
        // Extract and return the username
        return $user_data['user_name1'];
        return $user_data['user_degree'];     
    }

    public function isEmailExists($email) {
        $query = "SELECT COUNT(*) FROM users WHERE user_email = :email";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute(array(':email' => $email));
        $count = $stmt->fetchColumn();
        return $count > 0;
    }

    public function isUsernameExists($username) {
        $query = "SELECT COUNT(*) FROM users WHERE user_name1 = :username";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute(array(':username' => $username));
        $count = $stmt->fetchColumn();
        return $count > 0;
    }


}
