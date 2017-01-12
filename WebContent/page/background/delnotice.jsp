<%@ page language="java" import="java.util.*,java.sql.*,utils.JdbcUtils" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'delnotice.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
      <%
    Integer id=Integer.parseInt(request.getParameter("id"));
    System.out.println(id);
	Connection co=null;
	PreparedStatement ps=null;
	try{
	co=JdbcUtils.getConnection();
	String sql="DELETE FROM notice_info WHERE nno=?";
	ps=co.prepareStatement(sql);
	ps.setInt(1,id);
	ps.executeUpdate();
	}catch(Exception e){
		throw new RuntimeException(e);
	}
  %>
  删除成功，点击<a href="/notice/page/background/listNotice.jsp">这里</a>返回到上级目录
  </body>
</html>
