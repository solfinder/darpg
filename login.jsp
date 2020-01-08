<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hackathon",
            "root", "");
    Statement st = con.createStatement();
    ResultSet rs;
	out.println("select * from user where uname='" + userid + "' and pass='" + pwd + "'");
    rs = st.executeQuery("select * from user where uname='" + userid + "' and pass='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("userid", userid);
        response.sendRedirect("grievances.jsp");
    } else {
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    }
%>