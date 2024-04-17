{extends file="layouts/main.tpl"}
{block name="body"}
    
    <h1 class="mb-4 mb-3">Search results for "{$query}"</h1>

                        <div class="row">
                        {foreach from=$posts item=post}
                            <div class="col-md-3">
                                <div class="post-card">
                                    <div class="post-card-image" style="background-image: url('./user-images/{$post.post_image}');">
                                        <a href="/studentzone/post&id={$post.post_id}"></a>
                                    </div>
                                    <a href="/studentzone/post&id={$post.post_id}"><h3>{$post.post_name}</h3></a>                             
                                </div>                         
                            </div>
                        {/foreach}
                            
                        </div> 
                        
                        
                    </div>
{/block}