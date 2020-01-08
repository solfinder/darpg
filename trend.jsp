<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.*" %>
<%
		String org=(request.getParameter("org")==null || request.getParameter("org").length()==0)?null:request.getParameter("org");
		Connection con=DriverManager.getConnection(  
		"jdbc:mysql://localhost:3306/darpa","root","");  
   
		Statement stmt=con.createStatement();  
		ResultSet rs=stmt.executeQuery("select distinct org_name from monthlydata");
		if(org==null)org="Central Board of Direct Taxes (Income Tax)";

		Statement stmt1=con.createStatement();  
		ResultSet rs1=stmt1.executeQuery("select concat(month,'-',year),receipts,disposal from monthlydata where org_name='" + org + "'"); 


%>
<html>
<head>
<style>

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
            var data = google.visualization.arrayToDataTable([
               ['Month-Year', 'Receipts', 'Disposals'],
			   <%
					if(rs1 !=null){
						while(rs1.next()){
						   out.print("[");
						   out.print("'" + rs1.getString(1) + "',");
						   out.print(rs1.getInt(2) + ",");
						   out.print(rs1.getInt(3) + "],");
						   out.println();
						}
						rs1.close();
					}   
			   %>
               ]);

            var lineoptions = {title: '<%=org%>',  width: 1800,
        height: 2400,
		position: 'top',
        legend: { position: 'top', maxLines: 3 },
        bar: { groupWidth: '75%' },
		explorer: { 
			actions: ['dragToZoom', 'rightClickToReset'],
			axis: 'horizontal',
			keepInBounds: true,
			maxZoomIn: 4.0
		}
			}

            // Instantiate and draw the chart.
            var linechart = new google.visualization.LineChart(document.getElementById('linecontainer'));
            linechart.draw(data, lineoptions);

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
  <a href="grievances.jsp">Grievances</a>
  <a href="disposal.jsp">Disposal(Total)</a>
  <a href="pending_total.jsp">Pending(Total)</a>
  <a href="pending_split.jsp">Pending(Split)</a>
  <a href="trend.jsp">Trend</a>
  <a href="users.jsp">Users</a>
  <a href="logout.jsp">Logout</a>
</div>

<!-- Page content -->
<div class="main">
<right><a href="javascript:window.open('trend_help.html','Trend Help');"><img src='help.png' width=20px height=20px align=right /></a></right>
<center><a href=''><img src='logo.png'/></a></center><br/><br/>
<center>
<form method='get' action='trend.jsp' id='frmTrend'>
<tr><td  align=center  >   

    <label for="org">Org Name:</label>
	<select name=org value='' onchange='submit()'>Select Org
	<%
		if(rs !=null){
			while(rs.next()){  
			   String orgname=rs.getString(1);
			   out.print("<option value='" + orgname + "' "); 
			   if(orgname.equals(org))out.print(" selected ");   
			   out.println(">" + orgname + "</option>");
			}
			rs.close();
		}   
	%>
	</select>
</form>
</center>
<center>
 <div id="linecontainer"></div>
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
