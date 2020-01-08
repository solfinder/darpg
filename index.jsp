<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
<style>

/* Style inputs with type="text", select elements and textareas */
input[type=text],input[type=password], input[type=file], select, textarea {
  width: 100%; /* Full width */
  padding: 12px; /* Some padding */  
  border: 1px solid #ccc; /* Gray border */
  border-radius: 4px; /* Rounded borders */
  box-sizing: border-box; /* Make sure that padding and width stays in place */
  margin-top: 6px; /* Add a top margin */
  margin-bottom: 16px; /* Bottom margin */
  resize: vertical /* Allow the user to vertically resize the textarea (not horizontally) */
}

/* Style the submit button with a specific background color etc */
input[type=submit] {
  background-color: #000080;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

/* When moving the mouse over the submit button, add a darker green color */
input[type=submit]:hover {
  background-color: #0000ff;
}

/* Add a background color and some padding around the form */
.container {
  border-radius: 5px;
  background-color: #afeeff;
  padding: 20px;
}

/* The sidebar menu */
.sidenav {
  height: 100%; /* Full-height: remove this if you want "auto" height */
  width: 160px; /* Set the width of the sidebar */
  position: fixed; /* Fixed Sidebar (stay in place on scroll) */
  z-index: 1; /* Stay on top */
  top: 0; /* Stay at the top */
  left: 0;
  text-align: center;
  background-color: #000080; /* Black */
  overflow-x: hidden; /* Disable horizontal scroll */
  padding-top: 20px;
}

/* The navigation menu links */
.sidenav a {
  padding: 6px 6px 6px 6px;
  text-decoration: none;
  font-size: 25px;
  color: #bbbbbb;
  display: block;
}

/* When you mouse over the navigation links, change their color */
.sidenav a:hover {
  color: #f1f1f1;
}

/* Style page content */
.main {
  margin-left: 160px; /* Same as the width of the sidebar */
  padding: 0px 10px;
}

/* On smaller screens, where height is less than 450px, change the style of the sidebar (less padding and a smaller font size) */
@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}

</style>
</head>
    <body>
	<div class="main">
	<right><a href="javascript:window.open('index_help.html','Index Help');"><img src='help.png' width=20px height=20px align=right /></a></right>


	<center><a href=''><img src='logo.png'/></a></center><br/>

	
	<div class="container" width='50%'>
	<left><H4><u>DARPG Login:</u></H4></left>
        <form method="post" action="login.jsp">
    <label for="username">Username</label>
    <input type="text" id="uname" name="uname" placeholder="Username"/>

    <label for="pass">Password</label>
    <input type="password" id="pass" name="pass" placeholder="password"/>

    <input type="submit" value="Login">
        </form>
		</div>
    </body>
</html>
</div>
</center>
</form>
</div>
<br/><br/>
</body>
</html>
 