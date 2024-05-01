{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container mt-4">
    <h1 class="mb-3 ">My Account</h1>

    <div class="btn-group mb-3" role="group" aria-label="Account menu">
    <a href="/studentzone/account" class="btn btn-secondary">Home</a>
    <a href="/studentzone/favourite" class="btn btn-secondary">Favourite Recipes</a>
    <a href="/studentzone/myrecipes" class="btn btn-secondary">My Recipes</a>
    <a href="/studentzone/add" class="btn btn-secondary">Add Recipe</a>
    <a href="/studentzone/changepassword" class="btn btn-secondary">Change Password</a>
    <a href="/studentzone/changeusername" class="btn btn-secondary">Change Username</a>
    </div>

    <ul>
        {foreach from=$user_recipes item=recipe} <!--$user_recipes is called from myrecipes.php -->
            <div class="row">
            <div class="col-md-3">
                <div class="recipe-card">
                    <div class="recipe-card-image" style="background-image: url('/studentzone/user-images/{$recipe.recipe_image}');">
                        <a href="/studentzone/recipe/{$recipe.recipe_id}"></a>
                    </div>
                    <a href="/studentzone/recipe/{$recipe.recipe_id}"><h3>{$recipe.recipe_name}</h3></a>                             
                </div>                         
            </div>
            </div>
        {/foreach}
    </ul>










    
    </div>
{/block}
