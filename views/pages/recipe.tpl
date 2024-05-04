{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container mt-4" >
    <div class="row"> 
    <div class="col-md-12">
        <h2 class="mb-4 mb-3">{$recipe.recipe_name} </h2><h3>Recipe added by user: {$recipe.user_name1}</h3>
        

        <hr width="100%" color="#FFBF0B" size="5px"/>

    </div>
    </div>
    </div>

    <div class=container>     
    
    
    <div class="row"> 
    
        <div class="col-md-6">
        

        {if $recipe.images}
            <div class="row">
                {foreach from=$recipe.images item=image}
                    <div class="recipe-image-box1">
                        <div class="recipe-image" style="background-image: url('/studentzone/user-images/{$recipe.recipe_image}');">
                            
                        </div>
                    </div>
                {/foreach}
            </div>
        {/if}  
        
        <div class="recipe-image-box1">
            <div class="recipe-image" style="background-image: url('/studentzone/user-images/{$recipe.recipe_image}');">
                
            </div>
        </div>
        </div>                  
          
              
           

        <div class="col-md-3">     
        <ul class="recipe-features">
            <li><i class="fas fa-star-half-alt"></i> Recipe Rating: {$recipe_rating} Stars</li>
            <li><i class="far fa-clock"></i> Time to make: {$recipe.recipe_time}</li>
            <li><i class="fas fa-users"></i> Servings: {$recipe.recipe_servings}</li>
            <li><i class="fas fa-dollar-sign"></i> Budget: {$recipe.recipe_budget}</li>
        </ul>



            
        </div>
        <div class="col-md-3">
        {if $user_data}
            {if $is_fav}
                <button id="removeFav" type="button" class="btn btn-primary mb-3" data-recipeid="{$recipe.recipe_id}"><i class="fa-solid fa-heart-crack"></i> Remove from favourites</button>
            {else}
                <button id="addFav" type="button" class="btn btn-primary mb-3" data-recipeid="{$recipe.recipe_id}"><i class="fa-solid fa-heart-circle-plus"></i> Add to favourites</button>
            {/if}
        {/if}
        </div>
    </div>  
    
    

    <div class=container> 
    <hr />
        <div class="col-md-12">
            <div class="row">

                <h1><i class="fa-solid fa-basket-shopping"></i> Ingredients:</h1>
                <p>{$recipe.recipe_ingredients|nl2br}</p>  
                
                <h1><i class="fa-solid fa-list-ol"></i> Instructions:</h1>
                <p>{$recipe.recipe_instructions|nl2br}</p>
                    
            </div>
        </div>
    </div>
    


    <div class=container>     
    <div class="row">
    
    <hr />
        <div class="col-md-6">

        <h1>Rate this recipe:</h1>
        {if $user_data}
            <form action="" method="post">
            <div class="form-group">
                <label for="rating">Your Rating:</label>
                <select class="form-control" id="rating" name="rating">
                    <option value="1">1 Star (Very bad)</option>
                    <option value="2">2 Star (Bad)</option>
                    <option value="3">3 Star (Okay)</option>
                    <option value="4">4 Star (Good)</option>
                    <option value="5">5 Star (Very Good)</option>
                </select>
            </div>
            
            <button type="submit" class="btn btn-primary mt-3">Submit</button>
            </form>

        {else}
            <p>Please login to leave a review of this recipe.</p>
        {/if}
                

        
        </div>
    


        <div class="col-md-6">
        <!-- HTML form for leaving comments -->
        <h1>Leave a comment:</h1>
        {if $user_data}
        <form action="" method="post">               
            <input type="hidden" name="recipe_id" value="{$recipe.recipe_id}">
            <div class="form-group">
                <label for="comment">Your Comment:</label>
                <textarea class="form-control" id="comment" name="comment" rows="1" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary mt-3">Submit</button>
        </form>
        {else}
        <p>Please login to leave a comment on this recipe.</p>
        {/if}
    </div>
    
        </div>


    </div>
    
    <div class=container>

   
<!-- Display comments -->
<div class="col-md-12">
    <div class="comments">
        
        {if $comments}
            <ul>
                <h3>Comments:</h3>
                {foreach $comments as $comment}
                    <li class="comment-item">
                        <div class="comment-box">
                            <div class="comment-info">
                                <div class="info-box">
                                    <div class="user-date">
                                        <div class="username-date">
                                            <span class="username/date"><strong>User: </strong> {$comment.user_name1}  <strong> On: </strong> {$comment.created_at}</span> <!-- Display user name -->
                                            
                                        </div>
                                    </div>


                                    <div class="comment-text">
                                        
                                       <span class="comment"> <strong>Comment:</strong> </span>
                                       <i class="fa fa-light fa-comments fa-3x fa-pull-left "></i>
                                      <span class="text"> {$comment.comment_text}</span> <!-- Display comment text -->
                                    </div>

                                </div>
                            </div>
                        </div>
                    </li>
                {/foreach}
            </ul>
        {else}
            <p>No comments yet.</p>
        {/if}
    </div>
</div>


    </div>




{/block}