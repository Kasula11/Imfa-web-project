package dear;

import java.io.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*; 
@WebServlet("/Signin")
public class Signin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String l=request.getParameter("name");
		String p=request.getParameter("pass");
		String dbUsername,dbPassword,dbacno;
		try{
		Class.forName("com.mysql.jdbc.Driver");    
	    Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/imfa","root","");
	    String query ="SELECT * FROM members where username='"+l+"' and password='"+p+"';";
        PreparedStatement ps=conn.prepareStatement(query);
        ResultSet rs = ps.executeQuery(query); 
        rs.next();
        dbUsername = rs.getString("username");
        dbPassword = rs.getString("password");
        dbacno=rs.getString("acno");
        	if(dbUsername.equals(l) && dbPassword.equals(p))
        	{
        		out.print(dbUsername);
        		HttpSession d=request.getSession(true);
        
        		String query1 ="SELECT *FROM infomembers where acno='"+dbacno+"';";
        		PreparedStatement pse=conn.prepareStatement(query1);
                ResultSet rse = pse.executeQuery(query1); 
                rse.next();
                String tablename=rse.getString("tablename");
                String membername= rse.getString("membername");
           
                d.setAttribute("membername",membername);
                d.setAttribute("acno", dbacno);
                d.setAttribute("tablename",tablename);
                
                
                
                pse.close();
        		request.getRequestDispatcher("userdata.jsp").forward(request,response);
        		
        		
        	}
        	else
        	{
        		out.print("login failed");
        	}
      }
		
        
		catch (ClassNotFoundException | SQLException e){
			
        out.print("wrong username or password");
		}
	
}
}

