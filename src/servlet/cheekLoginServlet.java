package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.JdbcUtils;

public class cheekLoginServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String name=request.getParameter("name");;
		String password=request.getParameter("password");
		Connection co=null;
		PreparedStatement ps=null;
		try{
		co=JdbcUtils.getConnection();
		String sql="select `password`,`type` from user where username=?";
		ps=co.prepareStatement(sql);
		ps.setString(1,name);
		ResultSet rs=ps.executeQuery();
		if(rs.next()){
			String Upassword =rs.getString("password");	
			int type=rs.getInt("type");
			System.out.println("password"+Upassword);
			System.out.println("psw"+password);
			System.out.println("type"+type);
			if(password.equals(Upassword)){
				//用户存在且用户名密码都正确
				if(type==1){
					request.setAttribute("name",name);
					response.sendRedirect("/notice/page/foreground/foreground.jsp");
				}else{
					HttpSession session=request.getSession();
					session.setAttribute("name",name);
					response.sendRedirect("/notice/page/background/addNotice.jsp");
				}
			}else{
				//用户存在但用户名密码错误
				request.getRequestDispatcher("/page/errors/error.jsp").forward(request, response);//转发不写项目名
			}
		}else{
			//用户不存在
			request.getRequestDispatcher("/page/errors/error.jsp").forward(request, response);
		}
	    }catch (Exception e) {
			throw new RuntimeException(e);
	    }
	}
}
