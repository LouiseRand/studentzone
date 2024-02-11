{extends file="layouts/main.tpl"}

{block name="body"}
    
  <h1 class="mt-4 mb-4">recipes</h1> <!--padding added to h1-->
  <p>Browse our range of lunch recipes below.</p>

  <div class="row"><!--search bar-->
    <form id="search-form" method="post" action="">
  
      <div class="col-md-3">

      </div> 
      
      <div class="col-md-6">
        <form action="search.html" method="post" class="d-flex" role="search">
          <input class="form-control me-2" type="search" placeholder="Pizza..." name="query" aria-label="Search">
          <button class="btn btn-outline-dark" type="submit">Search</button>
        </form>  
      </div>

      <div class="col-md-3">

      </div>                      
    </form> 
  </div><!--search bar end-->



  <div class="row">  <!--recipe category elements-->

    <div class="col-md-3">                                       <!--CHECK ISSUES FOR IMAGES-->
      <div class="recipe-card">
        <div class="recipe-card-image">
          <a href="index.php?p=recipe"></a>
        </div>
        <a href="index.php?p=recipe"><h3>Lunch Recipes</h3></a> 
      
      </div>      
    </div>

    <div class="col-md-3">
      <div class="recipe-card">
        <div class="recipe-card-image" style="background-image: url(./images/lunch.jpg);"></div>
          <a href="index.php?p=recipe"></a>
        </div>
        <a href="index.php?p=recipe"><h3>Dinner Recipes</h3></a> 
      
      </div>      
    </div>
    

    <div class="col-md-3">
      <div class="recipe-card">
        <div class="recipe-card-image">
          <a href="index.php?p=recipe"></a>
        </div>
        <a href="index.php?p=recipe"><h3>Breakfast Recipes</h3></a> 
      
      </div>      
    </div>
    

    <div class="col-md-3">
      <div class="recipe-card">
        <div class="recipe-card-image">
          <a href="index.php?p=recipe"></a>
        </div>
        <a href="index.php?p=recipe"><h3>Lunch Recipes</h3></a> 
      
      </div>      
    </div>
    
  </div> 









    
{/block}