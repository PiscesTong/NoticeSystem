package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.JdbcUtils;

public class addNoticeServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String title=request.getParameter("title");
		String editor=request.getParameter("editor");
		String content=request.getParameter("content");
		String type=request.getParameter("type");
		Date noticeTime=new Date();
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time=format.format(noticeTime);//格式化时间
		System.out.println("type:"+type);
		System.out.println("title:"+title);
		Connection co=null;
		PreparedStatement ps=null;
		try{
		co=JdbcUtils.getConnection();
		String sql="INSERT INTO notice_info(title,editor,content,`type`,creattime) VALUES (?,?,?,?,?)";
		ps=co.prepareStatement(sql);
		ps.setString(1,title);
		ps.setString(2,editor);
		ps.setString(3,content);
		ps.setString(4,type);
		ps.setString(5,time);
		int result=ps.executeUpdate();
		if(result==1){
			System.out.println("添加通知成功");
		}
		response.sendRedirect("/notice/page/background/addNotice_do.jsp");
		}catch(Exception e){
			throw new RuntimeException(e);
		}
	}

}
