<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
  
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Philosopher:700i|Oleo+Script|Raleway|Vidaloka">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
        <title>user data</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<style>

body {
	height: 100%;
}

body {
	margin: 0;
	background: linear-gradient(45deg, #49a09d, #5f2c82);
	font-family: sans-serif;
	font-weight: 100;
}

.container {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

table {
	width: 800px;
	border-collapse: collapse;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0,0,0,0.1);
}

th,
td {
	padding: 15px;
	background-color: rgba(255,255,255,0.2);
	color: #fff;
}

th {
	text-align: left;
}

	th {
		background-color: #55608f;
	}



	tr {
		&:hover {
			background-color: rgba(255,255,255,0.3);
		}
	
	td {
		position: relative;
		&:hover {
			&:before {
				content: "";
				position: absolute;
				left: 0;
				right: 0;
				top: -9999px;
				bottom: -9999px;
				background-color: rgba(255,255,255,0.2);
				z-index: -1;
			}
		}
	}
}

#customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#customers td, #customers th {
    border: 1px solid #ddd;
    padding: 8px;
}




#customers th {
    padding-top: 80px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #4CAF50;
    color: white;
	
	
}




body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
body, html {
    height: 100%;
    line-height: 1.8;
}


.w3-bar .w3-button {
    padding: 16px;
}


.demo-2{
	padding-top:4%;
}
</style>
</head>
<body>


 <% String tablename=session.getAttribute("tablename").toString(); 
       String acno=session.getAttribute("acno").toString();
       String membername=session.getAttribute("membername").toString();
       try{
    	  
   		Class.forName("com.mysql.jdbc.Driver");
   	    Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/imfa","root","");
   	    String query1 ="SELECT * FROM "+tablename+"";
           PreparedStatement ps=conn.prepareStatement(query1);
           out.print(query1);
           ResultSet rs = ps.executeQuery(query1);   
    %>


	<div class="w3-top">
  <div class="w3-bar w3-white w3-card-2" id="myNavbar">
    <a href="home.html" class="w3-bar-item w3-button w3-wide">IMFA</a>
    <!-- Right-sided navbar links -->
    <div class="w3-right w3-hide-small">
      <a href="#about" class="w3-bar-item w3-button">ABOUT US</a>
      <a href="user.html" class="w3-bar-item w3-button"><i class="fa fa-user"></i>HOME</a>
      <a href="profile.html" class="w3-bar-item w3-button"><i class="fa fa-th"></i>PROFILE</a>
      <a href="logout.html" class="w3-bar-item w3-button"><i class="fa fa-envelope"></i>LOG OUT</a>
    </div>
    <!-- Hide right-floated links on small screens and replace them with a menu icon -->

    <a href="javascript:void(0)" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="w3_open()">
      <i class="fa fa-bars"></i>
    </a>
  </div>
</div>

<!-- Sidebar on small screens when clicking the menu icon -->
<nav class="w3-sidebar w3-bar-block w3-black w3-card-2 w3-animate-left w3-hide-medium w3-hide-large" style="display:none" id="mySidebar">
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-bar-item w3-button w3-large w3-padding-16">Close ×</a>
  <a href="#about" onclick="w3_close()" class="w3-bar-item w3-button">ABOUT US</a>
  <a href="#sol" onclick="w3_close()" class="w3-bar-item w3-button">HOME</a>
  <a href="#techno" onclick="w3_close()" class="w3-bar-item w3-button">PROFILE</a>
  <a href="logout.html" onclick="w3_close()" class="w3-bar-item w3-button">LOG OUT</a>
</nav>




<table id="customers">

  <tr>
    <th>Year</th>
    <th>Month</th>
    <th>share</th>
	<th>Ordinary Installments</th>
	<th>Installment number</th>
	<th>Ordinary Interest</th>
	<th>Spl.Loan</th>
	<th>Spl.Interest</th>
	<th>Total</th>
	<th>Addl.Payment</th>
	<th>Fine</th>
	<th>Total</th>
	<th>Loan at Members</th>
	<th>Ordinary sanctioned</th>
	<th>Spl.Sanctioned</th>
	<th>Ord.Loan due</th>
  </tr>

  <%
while (rs.next()) {
%>
<tr>
<td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>
<td><%=rs.getString(5)%></td>
<td><%=rs.getString(6)%></td>
<td><%=rs.getString(7)%></td>
<td><%=rs.getString(8)%></td>
<td><%=rs.getString(9)%></td>
<td><%=rs.getString(10)%></td>
<td><%=rs.getString(11)%></td>
<td><%=rs.getString(12)%></td>
<td><%=rs.getString(13)%></td>
<td><%=rs.getString(14)%></td>
<td><%=rs.getString(15)%></td>
<td><%=rs.getString(16)%></td>
</tr>
<% } %>


</table>

   <%
// close all the connections.
rs.close();
   ps.close();
} catch (Exception ex) {
%>


<%
out.println("Unable to connect to database.");
}
%>


<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
		<script type="text/javascript" src="js/jquery.ba-cond.min.js"></script>
		<script type="text/javascript" src="js/jquery.slitslider.js"></script>

</body>
</html>
