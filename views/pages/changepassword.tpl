{extends file="layouts/main.tpl"}

{block name="body"}
    <div class="container">
    <div class="container">
    <h2 class="mb-4 mt-4 pb-2">Change your password</h2>
    <hr width="100%" color="#FFBF0B" size="5px"/>
    <div class="btn-group mb-3" role="group" aria-label="Account menu">
    <a href="/studentzone/account" class="btn btn-secondary">Home</a>
    <a href="/studentzone/favourite" class="btn btn-secondary">Favourite Recipes</a>
    <a href="/studentzone/myrecipes" class="btn btn-secondary">My Recipes</a>
    <a href="/studentzone/add" class="btn btn-secondary">Add Recipe</a>
    <a href="/studentzone/changepassword" class="btn btn-secondary">Change Password</a>
   
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
            <label for="currentPassword"><h6>Current Password</h6></label>
            <input type="password" class="form-control" id="currentPassword" name="currentPassword">
            <br>
        </div>
        <div class="form-group">
            <label for="newPassword"><h6>New Password</h6></label>
            <input type="password" class="form-control" id="newPassword" name="newPassword">
            <br>
        </div>
        <button type="submit" class="btn btn-studentzone">Change password</button>
    </form>
    </div>




    </div>
{/block}