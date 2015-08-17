<?php
require_once('includes/header.php');
?>

<h1></h1>
<?php
if (isset($_GET['action'])) {
    switch (strtolower($_GET['action'])) {
        case 'login':
            if (isset($_POST['email']) && isset($_POST['password'])) {
                // We have both variables. Pass them to our validation function 
                if (!validateUser($_POST['email'], $_POST['password'])) {
                    // Well there was an error. Set the message and unset 
                    // the action so the normal form appears. 
                    $_SESSION['error'] = "Bad email or password supplied.";
                    unset($_GET['action']);
                }
            } else {
                $_SESSION['error'] = "email and Password are required to login.";
                unset($_GET['action']);
            }
            break;
        case 'logout':
            // If they are logged in log them out. 
            // If they are not logged in, well nothing needs to be done. 
            if (loggedIn()) {
                logoutUser();
                $sOutput .= '<h1>Logged out!</h1><br/>
            <br/><h4>You have been logged out successfully.  </h4>';
                header("Location: index.php");
            } else {
                // unset the action to display the login form. 
                unset($_GET['action']);
            }
            
            break;
    }
}

if (loggedIn()) {
    if ($_SESSION["username"] == ADMINNAME) {
        header("Location: admin/index.php");
        exit;
    } else {
        //enter home.php
        header("Location: home.php");
    }
    //userProfile($_SESSION["username"]);}
} elseif (!isset($_GET['action'])) {
    // incase there was an error  
    // see if we have a previous email 
    $semail = "";
    if (isset($_POST['email'])) {
        $semail = $_POST['email'];
    }
    
    $sError = "";
    if (isset($_SESSION['error'])) {
        $sError = '<span id="error"><h5>' . $_SESSION['error'] . ' </h5></span>';
    }
    
    $sOutput .= '<div  class="container col-md-3 col-md-offset-4" >
        <br>
        <h2>Login</h2>
        <form method="post" action="login.php?action=login">
             <div class="form-group">
                <input type="text" placeholder="Email or Username" name="email" id="email" value="' . $semail . '"   class="form-control">
             </div>
              <div class="form-group">
                <input type="password" placeholder="Password" name="password" id="password" class="form-control">
             </div>
            <button name="submit" value="submit" class="btn btn-primary btn-large" type="submit">Login!</button>
            <a href="register.php"  class="btn btn-link btn-large">register</button></a> 
            <a href="resetpwd.php"  class="btn btn-link btn-large">retpwd</button></a> 
            <br>' . $sError . '
       </form> ';
}

// lets display our output string. 
echo $sOutput;

?>

<?php
include('includes/footer.html');
?>