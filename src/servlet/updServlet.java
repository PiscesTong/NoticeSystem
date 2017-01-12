package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.JdbcUtils;

public class updServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String editor=request.getParameter("editor");
		String creattime=request.getParameter("creattime");
		Integer type=Integer.parseInt(request.getParameter("type"));
		Integer nno=Integer.parseInt(request.getParameter("nno"));
		
		Connection co=null;
		PreparedStatement ps=null;
		try{
		co=JdbcUtils.getConnection();
		String sql="UPDATE notice_info SET title=?,content=?,editor=?,creattime=?,`type`=? WHERE nno=?";
		ps=co.prepareStatement(sql);
		ps.setString(1,title);
		ps.setString(2,content);
		ps.setString(3,editor);
		ps.setString(4,creattime);
		ps.setInt(5,type);
		ps.setInt(6,nno);
		ps.executeUpdate();
		
		response.sendRedirect("/notice/page/background/updateInfo.jsp");
		}catch(Exception e){
			throw new RuntimeException(e);
		}
	}

}
