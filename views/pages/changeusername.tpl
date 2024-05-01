{extends file="layouts/main.tpl"}

{block name="body"}
    <div class="container">
    <h1 class="mb-4 pb-2">Change your password</h1>

    <div class="btn-group mb-3" role="group" aria-label="Account menu">
    <a href="/studentzone/account" class="btn btn-secondary">Home</a>
    <a href="/studentzone/favourite" class="btn btn-secondary">Favourite Recipes</a>
    <a href="/studentzone/myrecipes" class="btn btn-secondary">My Recipes</a>
    <a href="/studentzone/add" class="btn btn-secondary">Add Recipe</a>
    <a href="/studentzone/changepassword" class="btn btn-secondary">Change Password</a>
    <a href="/studentzone/changeusername" class="btn btn-secondary">Change Username</a>
    </div>
    
    {if $error}
        <div class="alert alert-danger mb-3" role="alert">
            {$error}
        </div>
    {else if $success}
        <div class="alert alert-success mb-3" role="alert">
            {$success}
        </div>
    {/if}
    
    <form action="" method="post">
        <div class="form-group">
            <label for="currentName1">Current Username</label>
            <input type="user_name1" class="form-control" id="currentName1" name="currentName1">
        </div>
        <div class="form-group">
            <label for="newName1">New Username</label>
            <input type="user_name1" class="form-control" id="newName1" name="newName1">
        </div>
        <button type="submit" class="btn btn-primary">Change Username</button>
    </form>
    
    </div>

{/block}