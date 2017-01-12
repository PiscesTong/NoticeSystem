package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpDateNoticeServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		  Integer nno=Integer.parseInt(request.getParameter("id"));
		  System.out.println(nno);
		  Connection con =null;
		  Statement stm =null;
		  ResultSet rs = null;
		  try {
		  	Class.forName("com.mysql.jdbc.Driver");
		    String url="jdbc:mysql://localhost:3306/notice";
		    con=DriverManager.getConnection(url,"root","123");
					stm =con.createStatement();
		    String sql="SELECT * FROM notice_info WHERE nno="+nno+"";
			 rs=stm.executeQuery(sql);
			 String title=null,content=null,editor=null,creattime=null;
			 int type=0;
			 while(rs.next()){
			     title=rs.getString(2);
			     content=rs.getString(3);
			     editor=rs.getString(4);
			     creattime=rs.getString(5);
			     type=rs.getInt(6);
			 }
			request.setAttribute("title",title);
			request.setAttribute("content", content);
			request.setAttribute("editor", editor);
			request.setAttribute("creattime", creattime);
			request.setAttribute("type", type);
			request.setAttribute("nno", nno);
			request.getRequestDispatcher("/page/background/updnotice.jsp").forward(request, response);
			}catch (Exception e) {
					e.printStackTrace();
			}finally{
			  	try {
			  		rs.close();
			  		stm.close();
			  		con.close();
			  	} catch (Exception e2) {
			  		e2.printStackTrace();
			  	}	
			  }
		}

}
