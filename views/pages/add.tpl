{extends file="layouts/main.tpl"}

{block name="body"}

<div class="container mt-4">

    <h2 class="mb-4 pb-2">Add new Recipe</h2>
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
    
    <form action="" method="post" enctype="multipart/form-data" class="form-light" id="recipe-form">               
            <div class="mb-3">
                <label class="form-label" for="recipe_name"><h6>Recipe Name</h6></label>
                <input type="text" class="form-control" id="recipe_name" name="recipe_name">
            </div>
            
            <div class="mb-3">
                <label for="formFile" class="form-label"><h6>Recipe Image</h6></label>
                <input class="form-control" type="file" id="formFile" name="recipe_image">
            </div>

            <div class="mb-3"> 
                <label class="form-label" for="cat_id"><h6>Recipe category</h6></label>
                <select class="form-control" id="cat_id" name="cat_id">
                    {foreach from=$categories item=category}
                        <option value="{$category.cat_id}">{$category.cat_name}</option>
                    {/foreach}
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label" for="recipe_time"><h6>Recipe Time</h6></label>                           <!--recipe metadata: ....-->
                <input type="text" class="form-control" id="recipe_time" name="recipe_time">
            </div>

            <div class="mb-3">
                <label class="form-label" for="recipe_servings"><h6>Recipe Servings</h6></label>
                <input type="text" class="form-control" id="recipe_servings" name="recipe_servings">
            </div>

            <div class="mb-3">
                <label class="form-label" for="recipe_budget"><h6>Recipe Budget</h6></label>
                <select class="form-control" id="recipe_budget" name="recipe_budget">
                    <option value="Lowcost">Low cost</option>
                    <option value="medium">Medium</option>
                    <option value="expensive">Expensive</option>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label" for="recipe_ingredients"><h6>Recipe ingredients</h6></label>
                <textarea class="form-control" id="recipe_ingredients" name="recipe_ingredients"></textarea>
            </div>

            <div class="mb-3">
                <label class="form-label" for="recipe_instructions"><h6>Recipe Instructions</h6></label>
                <textarea class="form-control" id="recipe_instructions" name="recipe_instructions"></textarea>  <!-- input changed to textarea -->
            </div>

            <!-- <div class="mb-3">
                <label class="form-label" for="recipe_instructions">Recipe Instructions</label>
                <textarea class="form-control" id="recipe_instructions" name="recipe_instructions"></textarea>
            </div> -->
            <button type="submit" class="btn btn-primary">Add Recipe</button>        
    </form>

</div>
{/block}