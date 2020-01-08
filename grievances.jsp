<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.*" %>
<%
		String ministry=(request.getParameter("ministry")==null || request.getParameter("ministry").length()==0)?null:request.getParameter("ministry");
		Connection con=DriverManager.getConnection(  
		"jdbc:mysql://localhost:3306/darpa","root","");  
   
		Statement stmt=con.createStatement();  
		ResultSet rs=stmt.executeQuery("select distinct ministry from grievance order by ministry");
		if(ministry==null)ministry="Ministry of Ayush";

		Statement stmt1=con.createStatement();  
		ResultSet rs1=stmt1.executeQuery("select * from grievance where ministry='" + ministry + "'"); 


%>
<html>
<head>
<style>
#grievance {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 80%;
}

#grievance td, #grievance th {
  border: 1px solid #ddd;
  padding: 8px;
  text-align: center;
}

#grievance tr:nth-child(even){background-color: #f2f2f2;}

#grievance tr:hover {background-color: #ddd;}

#grievance th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: #0000aa;
  color: white;
}


/* The sidebar menu */
.sidenav {
  height: 100%; /* Full-height: remove this if you want "auto" height */
  width: 200px; /* Set the width of the sidebar */
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

    <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {
           // Define the chart to be drawn.
      }
    </script>

</head>
<%
if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
	You are not logged in<br/>
	<a href="index.jsp">Please Login</a>
<%} else {
%>
<body>
<!-- Side navigation -->
<div class="sidenav">
<a href='https://b24-g1skro.bitrix24.site/'><center><img src='icon.png' /></center></a><br/><br/>
  <a href="grievances.jsp">Grievance</a>
  <a href="grievances_flow.jsp">Grievance(Flow)</a>
  <a href="grievances_metrics.jsp">Grievance(Metrics)</a>
  <a href="disposal.jsp">Disposal(Metrics)</a>
  <a href="pending_total.jsp">Pending(Metrics)</a>
  <a href="pending_split.jsp">Pending(Split)</a>
  <a href="trend.jsp">Trend</a>
  <a href="officer.jsp">Officer</a>
  <a href="users.jsp">Users</a>
  <a href="logout.jsp">Logout</a>
</div>

<!-- Page content -->
<div class="main">
<right><a href="javascript:window.open('grievances_help.html','Grievances Help');"><img src='help.png' width=20px height=20px align=right /></a></right>
<center><a href=''><img src='logo.png'/></a></center><br/><br/>
<center>
<form method='get' action='grievances.jsp' id='frmGrievances'>
<tr><td  align=center  >   

    <label for="ministry">Ministry:</label>
	<select name=ministry value='' onchange='submit()'>Select Ministry
	<%
		if(rs !=null){
			while(rs.next()){  
			   String ministryname=rs.getString(1);
			   out.print("<option value='" + ministryname + "' "); 
			   if(ministryname.equals(ministry))out.print(" selected ");   
			   out.println(">" + ministryname + "</option>");
			}
			rs.close();
		}   
	%>
	</select>
</form>
</center>
<center>

<center><H2> Grievance List </H2></center>
<br/><br/>
<center>
<table id="grievance">
  <tr>
    <th>RegistrationNo</th>
	<th>Ministry</th>
    <th>Country</th>
	<th>State</th>
    <th>District</th>
    <th>Text</th>
    <th>DiaryDate</th>
    <th>ClosingDate</th>
	<th>Source</th>
    <th>Rating</th>
    <th>Comments</th>
    <th>RatingDate</th>
  </tr>
<%

		if(rs1 !=null){
			while(rs1.next()){  
               out.println("<tr>");
			   out.println("<td width='15%'>" + rs1.getString(1) + "</td>");
			   out.println("<td width='15%'>" + rs1.getString(2) + "</td>");
			   out.println("<td width='15%'>" + rs1.getString(3) + "</td>");
			   out.println("<td width='15%'>" + rs1.getString(4) + "</td>");
			   out.println("<td width='15%'>" + rs1.getString(5) + "</td>");
			   out.println("<td width='15%'>" + rs1.getString(6) + "</td>");
			   out.println("<td width='15%'>" + rs1.getString(7) + "</td>");
			   out.println("<td width='15%'>" + rs1.getString(8) + "</td>");
			   out.println("<td width='15%'>" + rs1.getString(9) + "</td>");
			   out.println("<td width='15%'>" + rs1.getString(10) + "</td>");
			   out.println("<td width='15%'>" + rs1.getString(11) + "</td>");
			   out.println("<td width='15%'>" + rs1.getString(12) + "</td>");
               out.println("</tr>");
			}
			rs1.close();
		}
		
%>

 </table>
 </center>

 </center>
 </div>
 </body>
 </html>
 <%
		stmt.close();
		stmt1.close();
		con.close();
 %>
<%}
%>
