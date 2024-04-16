{extends file="layouts/main.tpl"}

{block name="body"}
    
    

    <div class="container">
        <div class="row">
            <div class="col-md-12"> 
                <h2>Login or Register:</h2>
            </div>
        </div>
    </div>


    {if $error}
        <div class="alert alert-danger" role="alert">
        {$error}
        </div>
    {/if}
    {if $success}
        <div class="alert alert-success" role="alert">
        {$success}
        </div>
    {/if}
    <div class="container">
        <div class="row align-items-start">
            
            <div class="col">
                <form id="login-form" method="post" action="">
                    <div class="mb-3">
                        <label class="form-label" for="login_email">Email address</label>
                        <input type="email" class="form-control" id="login_email" name="email">
                    </div>
                    <div class="mb-3">
                        <label class="form-label" for="login_password">Password</label>
                        <input type="password" class="form-control" id="login_password" name="password">
                    </div>
                    <button type="submit" name="login" value="1" class="btn btn-primary">Login</button>                                
                </form> 
                

            </div>

    
            <div class="col">
                <form id="registration-form" method="post" action="">

                    <div class="mb-3">
                        <label class="form-label" for="reg_name">User Name</label>
                        <input type="name" class="form-control" id="reg_name" name="name">
                    </div>


                    <div class="mb-3">
                        <label class="form-label" for="reg_email">Email Address</label>
                        <input type="email" class="form-control" id="reg_email" name="email">
                    </div>
                    <div class="mb-3">
                        <label class="form-label" for="reg_password">Password</label>
                        <input type="password" class="form-control" id="reg_password" name="password">
                    </div>
                    <div class="mb-3">
                        <label class="form-label" for="reg_password_confirm">Confirm Password</label>
                        <input type="password" class="form-control" id="reg_password_confirm" name="password_confirm">
                    </div>
                    <button type="submit" name="register" value="1" class="btn btn-primary">Register</button>                                    
                </form> 
                

            </div>
            </div>
            
            <div class="w-100"></div>
        
        </div>                 
    </div>

{/block}