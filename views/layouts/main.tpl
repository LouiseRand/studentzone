<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>Student Zone</title>
    <link href="./node_modules/@glidejs/glide/dist/css/glide.core.min.css" rel="stylesheet">             <!--REMOVE IF GLIDE NOT NEEDED AS WELL AS BOTTOM BLOCK-->
    <link href="./node_modules/@glidejs/glide/dist/css/glide.theme.min.css" rel="stylesheet"> 

    <link href="./node_modules/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/studentzone/css/styles.css"> <!--link html to stylesheet-->
    
</head>

                                                                                  
<body id="page-home">
  <header>
    <div class="page-header-top container text-center text-md-start"  <!--center allign logo on mobile (mobile first approach)-->
      <a href="index.html"><img src="./images/logo.png" alt="studentzone" /></a>
    </div>   
    
    <nav class="navbar navbar-expand-lg mb-4">
      <div class="container">
        <a class="navbar-brand" href="index.html"></a>

          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>  <!--burger bar--> 
          


          <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
              <li class="nav-item active">
                <a class="nav-link" href="/studentzone/home">Home</a>
              </li>
              <li class="nav-item">
                  <a class="nav-link" href="/studentzone/forum">Forum</a>
              </li>
              <li class="nav-item">
                  <a class="nav-link" href="/studentzone/map">Local Map</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/studentzone/categories">Easy recipes</a>   <!--cat = category-->
              </li>
              {if $user_data}
                  <li class="nav-item">
                      <a class="nav-link" href="/studentzone/account">Account</a>
                  </li>
            
                  <li class="nav-item">
                      <a class="nav-link" href="/studentzone/logout">Logout</a>
                  </li>
              {else}
                  <li class="nav-item">
                  <a class="nav-link" href="/studentzone/login">Login / Register</a>
                  </li>
              {/if}  
            </ul>



          </div>

      </div>
    </nav>
  </header>


  <div class="container">
    {block name="body"}{/block}
  </div>


    
  <script src="./node_modules/@glidejs/glide/dist/glide.min.js"></script>
  <script src="./js/scripts-vendor.min.js"></script>  
  <script src="./js/scripts.min.js"></script>
  <script>
    home.init();
  </script>

</body>





</html>