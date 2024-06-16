<%@ page import ="java.sql.*"%>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<title> connect_login</title>
<style>
body{
     display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    background-image: url(hill2.jpg);
    background-size: cover;
    background-position: center ;
}
h1{
    position: absolute;
   top: 10%;
   left: 5%;
   font-size:36px;
   color: purple;
}
</style>
</head>
<body>


<%
try
	{
	Class.forName("com.mysql.jdbc.Driver");
	System.out.println("Driver Loaded successfully");
	Connection cn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/java","root","sumit1021");
	System.out.println("Connection established successfully");
    String userID = request.getParameter("userID");
    String pass= request.getParameter("pass");
    
    PreparedStatement pst=cn.prepareStatement("select * from login where userID=? and pass=?");
    pst.setString(1,userID);
    pst.setString(2,pass);
    ResultSet rs = pst.executeQuery();
    if(rs.next())
    {
      // window.location.href("index.html");
      // include page="index.html";
     
      
     
            response.sendRedirect("index.html");
                                
    }
    else{
        %>
            <h1> Sorry! Account is not exist</h1> 
      <%

    }
}catch(ClassNotFoundException e)
{
out.println("Driver Not Avilable"+e.getMessage());
}
catch(SQLException e)
{
out.println("<p> Account is already exit </p>");
  
}
%>

</body>
</html>