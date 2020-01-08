<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.*" %>
<%

		Connection con=DriverManager.getConnection(  
		"jdbc:mysql://localhost:3306/darpa","root","");  
   
		Statement stmt=con.createStatement();  
		ResultSet rs=stmt.executeQuery("select * from deptdata"); 

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
               ['dept_name', 'Pending12plus', 'pending6to12', 'pending2to6', 'pending0to2'],

		    <% 

			   if(rs !=null){
				while(rs.next()){
					
						   out.print("[");
						   out.print("'" + rs.getString(1) + "',");
						   out.print(rs.getInt(5) + ",");
						   out.print(rs.getInt(6) + ",");
						   out.print(rs.getInt(7) + ",");
						   out.print(rs.getInt(8) + "],");
						   out.println();
						}
						rs.close();
					}   
			   %>

            ]);

            var datapie1 = google.visualization.arrayToDataTable([
               ['dept_name', 'Pending12plus'],

		    <% 
			   rs=stmt.executeQuery("select * from deptdata"); 
			   if(rs !=null){
				while(rs.next()){					
						   out.print("[");
						   out.print("'" + rs.getString(1) + "',");
						   out.print(rs.getInt(5) + "],");
						   out.println();
						}
						rs.close();
					}   
			   %>
            ]);

            var datapie2 = google.visualization.arrayToDataTable([
               ['dept_name', 'Pending6to12'],

		    <% 
			   rs=stmt.executeQuery("select * from deptdata"); 
			   if(rs !=null){
				while(rs.next()){					
						   out.print("[");
						   out.print("'" + rs.getString(1) + "',");
						   out.print(rs.getInt(6) + "],");
						   out.println();
						}
						rs.close();
					}   
			   %>
            ]);

            var datapie3 = google.visualization.arrayToDataTable([
               ['dept_name', 'Pending2to6'],

		    <% 
			   rs=stmt.executeQuery("select * from deptdata"); 
			   if(rs !=null){
				while(rs.next()){					
						   out.print("[");
						   out.print("'" + rs.getString(1) + "',");
						   out.print(rs.getInt(7) + "],");
						   out.println();
						}
						rs.close();
					}   
			   %>
            ]);

            var datapie4 = google.visualization.arrayToDataTable([
               ['dept_name', 'Pending0to2'],

		    <% 
			   rs=stmt.executeQuery("select * from deptdata"); 
			   if(rs !=null){
				while(rs.next()){					
						   out.print("[");
						   out.print("'" + rs.getString(1) + "',");
						   out.print(rs.getInt(8) + "],");
						   out.println();
						}
						rs.close();
					}   
			   %>
            ]);

            var baroptions = {title: 'Pending (by duration)',  width: 3200,
        height: 6400,
        legend: { position: 'top', maxLines: 3 },
        bar: { groupWidth: '75%' },
		explorer: { 
			actions: ['dragToZoom', 'rightClickToReset'],
			axis: 'horizontal',
			keepInBounds: true,
			maxZoomIn: 4.0
		},
        isStacked: true
			}
			
		var pieoptions1 = {title: 'Pending (12+ months)',  width: 1600,
        height: 1200,
        legend: { position: 'top', maxLines: 3 }
		}

		var pieoptions2 = {title: 'Pending (6-12 months)',  width: 1600,
        height: 1200,
        legend: { position: 'top', maxLines: 3 }
		}

		var pieoptions3 = {title: 'Pending (2-6 months)',  width: 1600,
        height: 1200,
        legend: { position: 'top', maxLines: 3 }
		}
		
		var pieoptions4 = {title: 'Pending (0-2 months)',  width: 1600,
        height: 1200,
        legend: { position: 'top', maxLines: 3 }
		}


            // Instantiate and draw the chart.
            var barchart = new google.visualization.BarChart(document.getElementById('barcontainer'));
            barchart.draw(data, baroptions);

            var piechart1 = new google.visualization.PieChart(document.getElementById('piecontainer1'));
            piechart1.draw(datapie1, pieoptions1);

            var piechart2 = new google.visualization.PieChart(document.getElementById('piecontainer2'));
            piechart2.draw(datapie2, pieoptions2);

            var piechart3 = new google.visualization.PieChart(document.getElementById('piecontainer3'));
            piechart3.draw(datapie3, pieoptions3);

            var piechart4 = new google.visualization.PieChart(document.getElementById('piecontainer4'));
            piechart4.draw(datapie4, pieoptions4);

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
  <a href="officer.jsp">Officer</a>
  <a href="users.jsp">Users</a>
  <a href="logout.jsp">Logout</a>
</div>

<!-- Page content -->
<div class="main">
<right><a href="javascript:window.open('pending_help.html','Pending Grievances Help');"><img src='help.png' width=20px height=20px align=right /></a></right>
<center><a href=''><img src='logo.png'/></a></center>
<center>
 <div id="barcontainer"></div>
</center>
<center>
 <div id="piecontainer1"></div>
</center>
<center>
 <div id="piecontainer2"></div>
</center>
<center>
 <div id="piecontainer3"></div>
</center>
<center>
 <div id="piecontainer4"></div>
</center>

 </div>
 </body>
 </html>
 <%
		stmt.close();
		con.close();
 %>
<%}
%>
