<%@ page language="java" contentType="text/html; charset=utf-8" 
     import="java.util.*,java.text.* ,java.sql.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="../../css/ncss_style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%!
 String formatDate(java.util.Date d){
 java.text.SimpleDateFormat formater=new SimpleDateFormat("yyyy年MM月dd日");
 return formater.format(d); 
 }
 %>

<div id="ncss_banner_wrapper">
	
    	<div id="ncss_banner_image">        	
            	<img src="../../images/b.gif" alt="image" />
        </div>
        
        <div id="ncss_banner_content">
        	<div class="header_01">通知公告发布系统 </div>          	      
		</div>
		
</div><!-- end of banner -->


<div id="ncss_content_wrapper">
	<div id="ncss_content">        
        <div id="column_w300">        
        	<div class="header_03">通知公告类别</div>            
            <div class="column_w300_section_01">
            	<div class="notice_image_wrapper">
                	<img src="../../images/ncss_image_03.jpg" alt="image" />
                </div>                
                <div class="notice_content">
              		<%
              		int typeId=Integer.parseInt(request.getParameter("typeId"));
              		System.out.println(typeId);
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
						<a href="listAllNotices.jsp?typeId=<%=rs.getInt(1)%>">节日通知</a><br>		
								<%}	
	    if(rs.getInt(1)==1){%>
	                    <a href="listAllNotices.jsp?typeId=<%=rs.getInt(1)%>">安全通知</a><br>		
								<%}	
	    if(rs.getInt(1)==2){%>
        <a href="listAllNotices.jsp?typeId=<%=rs.getInt(1)%>">比赛通知</a><br>		
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
        
        <div id="column_w530">        
	        
				
        	
            <div class="header_02">欢迎访问通知公告发布系统 <%=formatDate(new java.util.Date()) %>  </div>
            <table  align="center" border=1>
<tr>
<th>ID</th><th>标题</th><th>内容</th>
<th>编辑人</th><th>类型</th><th>发布时间</th>
</tr>
				<%
try {
	Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost:3306/notice";
	con=DriverManager.getConnection(url,"root","123");
				stm =con.createStatement();
	String sql="SELECT*FROM notice_info WHERE TYPE="+typeId+"";
	rs=stm.executeQuery(sql);
	while(rs.next()){%>	
								<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
<%
if(rs.getInt(6)==0){
%>
<td>节日通知</td>
<%}
if(rs.getInt(6)==1){
%>
<td>安全通知</td>
<%}
if(rs.getInt(6)==2){
%>
<td>比赛通知</td>
<%}%>
<td><%=rs.getString(5) %></td>
</tr>
<%}					 
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
	</table> 
            <div class="content_section_01">
            	<div>
            		<iframe name="showNotice" frameborder=0 width=400 height=300 marginheight=0 marginwidth=0 scrolling=no ></iframe>
            	</div>
            </div>            
            <div class="cleaner"></div>
        </div>  <!-- end of column_w530 --> 
    	<div class="cleaner"></div>
    </div> <!-- end of ncss_content -->
</div> <!-- end of content wrapper -->
<div id="ncss_footer_wrapper">
		
		 

        <div class="margin_bottom_15"></div>
        Copyright © 2016 <a href="#">Neusoft</a> | Designed by <a href="#" target="_parent">LMY</a>|该网站的访问量为：23
        <div class="cleaner"></div>
   </div> <!-- end of footer -->
</body>
</html>