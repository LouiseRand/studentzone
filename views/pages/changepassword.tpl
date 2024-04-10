{extends file="layouts/main.tpl"}

{block name="body"}

    <h1 class="mb-4 pb-2">Change your password</h1>

    <div class="btn-group mb-3" role="group" aria-label="Account menu">
    <a href="index.php?p=account" class="btn btn-secondary">Home</a>
    <a href="index.php?p=favourite" class="btn btn-secondary">Favourite Recipes</a>
    <a href="index.php?p=myrecipes" class="btn btn-secondary">My Recipes</a>
    <a href="index.php?p=add" class="btn btn-secondary">Add Recipe</a>
    <a href="index.php?p=changepassword" class="btn btn-secondary">Change Password</a>
    </div>

    {if $error}
        <div class="alert alert-danger mb-3" role="alert">
            {$error}
        </div>
    {else if $success}
        <div class="alert alert-success mb-3" role="alert">           <!--validation step needed here for email and not being able to change pw to a previous one-->
            {$success}
        </div>
    {/if}                                                
    
    <form action="" method="post">
        <div class="form-group">
            <label for="currentPassword">Current Password</label>
            <input type="password" class="form-control" id="currentPassword" name="currentPassword">
        </div>
        <div class="form-group">
            <label for="newPassword">New Password</label>
            <input type="password" class="form-control" id="newPassword" name="newPassword">
        </div>
        <button type="submit" class="btn btn-primary">Change password</button>
    </form>
    

    

{/block}