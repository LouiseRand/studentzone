{extends file="layouts/main.tpl"}
{block name="body"}
    
    <h1 class="mb-4 mb-3">{$recipe.recipe_name}</h1>
    <div class="row">
        <div class="col-md-6">
            {if $recipe.images}
                
                <div class="row" id= "lightgallery">
                    {foreach from=$recipe.images item=image}
                        <div class="col-md-4">
                            <div class="recipe-image mb-4" style="background-image: url('../user-images/{$image.recipe_image}');">
                                <a href="../user-images/{$image.recipe_image}"></a>                               
                            </div>       
                        </div>
                    {/foreach}
                </div> 
            {/if}                
        </div>

        <div class="col-md-6">

            <p>{$recipe.recipe_instructions}</p>

            <ul class="recipe-features">
                <li><i class="fas fa-star-half-alt"></i> {$recipe_rating} St3ars</li>
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
    </div>



    <div class="col-md-6">         <!--Block row 2-->
        
    </div>
</div>

{/block}
