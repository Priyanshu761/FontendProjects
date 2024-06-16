
<%@ page import ="java.sql.*"%>
<%@ page import="java.io.*" %>

<!DOCTYPE html>
<html>
<head>
<title> connect </title>
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
String userID = request.getParameter("userID");
String pass= request.getParameter("pass");
String name= request.getParameter("name");
String course= request.getParameter("course");



try
	{
	Class.forName("com.mysql.jdbc.Driver");
	System.out.println("Driver Loaded successfully");
	Connection cn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/java","root","sumit1021");
	System.out.println("Connection established successfully");

    PreparedStatement pst=cn.prepareStatement("insert into login values(?,?,?,?)");
    pst.setString(1,userID);
    pst.setString(2,pass);
    pst.setString(3,name);
    pst.setString(4,course);
    int x= pst.executeUpdate();
    if(x!=0)
    {   %>
             <h1> Your Registration is Successfully Completed </h1>
        <%
    }
    else{
        out.println("Failed");
    }


}catch(ClassNotFoundException e)
{
out.println("Driver Not Avilable"+e.getMessage());
}
catch(SQLException e)
{
  %>  
        <h1> Account is already exit  </h2>
  <%
}
%>

</body>
</html>
