{extends file="layouts/main.tpl"}

{block name="body"}

<div class="container mt-4">

    <h1 class="mb-4 pb-2">Add new Recipe</h1>

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
    
    <form action="" method="post" enctype="multipart/form-data" class="form-light" >               
            <div class="mb-3">
                <label class="form-label" for="recipe_name">Recipe Name</label>
                <input type="text" class="form-control" id="recipe_name" name="recipe_name">
            </div>
            
            <div class="mb-3">
                <label for="formFile" class="form-label">Recipe Image</label>
                <input class="form-control" type="file" id="formFile" name="recipe_image">
            </div>

            <div class="mb-3"> 
                <label class="form-label" for="cat_id">Recipe category</label>
                <select class="form-control" id="cat_id" name="cat_id">
                    {foreach from=$categories item=category}
                        <option value="{$category.cat_id}">{$category.cat_name}</option>
                    {/foreach}
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label" for="recipe_time">Recipe Time</label>                           <!--recipe metadata: ....-->
                <input type="text" class="form-control" id="recipe_time" name="recipe_time">
            </div>

            <div class="mb-3">
                <label class="form-label" for="recipe_servings">Recipe Servings</label>
                <input type="text" class="form-control" id="recipe_servings" name="recipe_servings">
            </div>

            <div class="mb-3">
                <label class="form-label" for="recipe_budget">Recipe Budget</label>
                <select class="form-control" id="recipe_budget" name="recipe_budget">
                    <option value="Lowcost">Low cost</option>
                    <option value="medium">Medium</option>
                    <option value="expensive">Expensive</option>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label" for="recipe_ingredients">Recipe ingredients</label>
                <input type="text" class="form-control" id="recipe_ingredients" name="recipe_ingredients">
            </div>
            <div class="mb-3">
                <label class="form-label" for="recipe_instructions">Recipe Instructions</label>
                <textarea class="form-control" id="recipe_instructions" name="recipe_instructions"></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Add Recipe</button>        
    </form>

</div>
{/block}