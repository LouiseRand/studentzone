{extends file="layouts/main.tpl"}
{block name="body"}
    
    <h1 class="mb-4 mb-3">{$recipe.recipe_name}</h1>
    <div class="row">

        <div class="col-md-6">

            <div class="row">
            

                <div class="row">                            
                    <div class="recipe-image-box">
                        <div class="recipe-image" style="background-image: url('/studentzone/user-images/{$recipe.recipe_image}');">
                            <a href="index.php?p=recipe&id={$recipe.recipe_image}"></a>
                        </div>
                                                   
                    </div>                         
                </div>

            </div> 
                
             

            <h1>Ingredients:</h1>
            <p>{$recipe.recipe_ingredients}</p>
            <h1>Instructions:</h1>
            <p>{$recipe.recipe_instructions}</p>

            <ul class="recipe-features">
                <li><i class="fas fa-star-half-alt"></i> {$recipe_rating} Stars</li>
                <li><i class="far fa-clock"></i>{$recipe.recipe_time}</li>
                <li><i class="fas fa-users"></i>{$recipe.recipe_servings}</li>
                <li><i class="fas fa-dollar-sign"></i>{$recipe.recipe_budget}</li>
                <li><i class="fas fa-tags"></i>{$recipe.recipe_tags}</li>


            </ul>
            {if $user_data}
                {if $is_fav}
                    <button id="removeFav" type="button" class="btn btn-primary mb-3" data-recipeid="{$recipe.recipe_id}">Remove from favourites</button>
                {else}
                    <button id="addFav" type="button" class="btn btn-primary mb-3" data-recipeid="{$recipe.recipe_id}">Add to favourites</button>
                {/if}
            {/if}
                


        </div>
    </div> 
    <h1>Leave a review</h1>
    {if $user_data}
        <form action="" method="post">
        <div class="form-group">
            <label for="rating">Rating</label>
            <select class="form-control" id="rating" name="rating">
                <option value="1">1 Star (Very bad)</option>
                <option value="2">2 Star (Bad)</option>
                <option value="3">3 Star (Okay)</option>
                <option value="4">4 Star (Good)</option>
                <option value="5">5 Star (Very Good)</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
        </form>

    {else}
        <p>Please login to leave a review of this recipe.</p>
    {/if}
    
{/block}

