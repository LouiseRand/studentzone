{extends file="layouts/main.tpl"}

{block name="body"}
   
<div class="container mt-4">
    <h2 class="mb-4 pb-2">My Account</h2>

    
    <h6>Welcome: {$user_name1}!</h6>
    <br>
    <h6> Studying: {$user_degree}</h6>
    <hr width="100%" color="#FFBF0B" size="5px"/>
    <div class="btn-group mb-3" role="group" aria-label="Account menu">
    <a href="/studentzone/account" class="btn btn-secondary">Home</a>
    <a href="/studentzone/favourite" class="btn btn-secondary">Favourite Recipes</a>
    <a href="/studentzone/myrecipes" class="btn btn-secondary">My Recipes</a>
    <a href="/studentzone/add" class="btn btn-secondary">Add Recipe</a>
    <a href="/studentzone/changepassword" class="btn btn-secondary">Change Password</a>
    
    </div>














   
</div>

{/block}
