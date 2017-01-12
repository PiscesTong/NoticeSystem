<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updnotice.jsp' starting page</title>
    
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
  <form action="/notice/updServlet" method="post">
  <input type="hidden" name="nno" value="${nno}"/>
  <table border="0" align="center" width="40%" style="margin-left: 100px;">
	<tr>
		<td width="100px">标题</td>
		<td width="40%">
			<input type="text" name="title" value="${title}"/>
		</td>
		<td align="left">
			<label id="cnameError" class="error">&nbsp;</label>
		</td>
	</tr>
	<tr>
		<td>内容</td>
		<td>
			<textarea rows="5" cols="30" name="content">${content}</textarea>
		</td>
		<td>
			<label id="descriptionError" class="error">&nbsp;</label>
		</td>
	</tr>
	<tr>
		<td>编辑人</td>
		<td>
			<input type="text" name="editor" id="editor" value="${editor}" />
		</td>
		<td>
			<label id="birthdayError" class="error">&nbsp;</label>
		</td>
	</tr>
	<tr>
		<td>类型</td>
		<tr><td> 类型:</td><td><select name="type">
					<%
Connection con =null;
Statement stm =null;
ResultSet rs = null;
try {
	Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost:3306/notice";
	con=DriverManager.getConnection(url,"root","123");
				stm =con.createStatement();
	String sql="SELECT DISTINCT `type` FROM notice_info;";
	rs=stm.executeQuery(sql);
	while(rs.next()){
		if(rs.getInt(1)==0){%>	
								<option value="0">节日通知</option>
								<%}	
		if(rs.getInt(1)==1){%>
			<option value="1" >安全通知</option>
								<%}	
		if(rs.getInt(1)==2){%>
		<option value="2">比赛通知</option>
							<%}	
	}
	
} catch (Exception e) {
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
%>
								</select></td></tr>
	<tr>
		<td>发布时间</td>
		<td>
			<input type="text" name="creattime" value="${creattime}" />
		</td>
		<td>
			<label id="cellphoneError" class="error">&nbsp;</label>
		</td>		
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<input type="submit" value="修改"/>
			<input type="reset" value="恢复为原来的通知内容"/>
		</td>
		<td>&nbsp;</td>
	</tr>
</table>
</form>
  </body>
</html>
