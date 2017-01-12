<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'new.jsp' starting page</title>
    
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
  <div id="ncss_content_wrapper">
	<div id="ncss_content">        
        <div id="column_w300">        
        	<div class="header_03">通知公告类别</div>            
            <div class="column_w300_section_01">
            	<div class="notice_image_wrapper">
                	<img src="/notice/images/ncss_image_03.jpg" alt="image" />
                </div>                
                <div class="notice_content">
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
						节日通知<br>		
								<%}	
	    if(rs.getInt(1)==1){%>
	                                                     安全通知<br>		
								<%}	
	    if(rs.getInt(1)==2){%>
                                                               比赛通知<br>		
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
				</div>                                
                <div class="cleaner"></div>
            </div>
            <div class="cleaner"></div>
        </div><!-- end of column_w300 -->
        </div>
        </div>
  </body>
</html>
