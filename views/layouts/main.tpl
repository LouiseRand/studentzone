<!DOCTYPE html>
<html>

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1"> 
        <title> StudentZone</title>
        <script src="https://kit.fontawesome.com/7b3bb89727.js" crossorigin="anonymous"></script>
        


        <link href="./node_modules/@glidejs/glide/dist/css/glide.core.min.css" rel="stylesheet">
        <link href="./node_modules/@glidejs/glide/dist/css/glide.theme.min.css" rel="stylesheet">
        <link rel="stylesheet" href="/studentzone/css/styles.css"> <!--css/styles.css--><!--css/styles-light.css-->
        <link rel="icon" type="image/x-icon" href="./studentzone-images/favicon.png">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>

    <body id="page-{$view_name}">
        <header>

         
            <nav class="navbar navbar-expand-lg ">
                <div class="container">
                
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <a href="index.php"><img src="/studentzone/images/logo.png" alt="studentzone" width="250" height="55"  /></a>
                    <div class="collapse navbar-collapse" id="navbar">
                        
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link" href="/studentzone/home">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/studentzone/categories">Categories</a>
                            </li>  
                            
                            <li class="nav-item">
                                <a class="nav-link" href="http://louisevrand.uosweb.co.uk/forum/">Forum</a>
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

                        
                        <form action="/studentzone/search" method="post" class="d-flex" role="search">
                            <input class="form-control me-2" type="search" placeholder="Dinner..." name="query" aria-label="Search">
                            <button class="btn btn-outline-dark" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button> 
                        </form>


                    </div>
                </div>     
            </nav>
        </header>

        
        {block name="body"}{/block}
        
        
       <!-- Footer -->
        <footer class="bg-dark text-white text-center p-4 mt-4">
        &copy; 2024 My Forum
        </footer>
            
            <script src="./js/scripts-vendor.min.js"></script>
            <script src="./js/scripts.min.js"></script>
            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
            <script>
                home.init();
            </script>
            
    </body>

</html>