<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>学校通知公告发布系统--后台</title>
<link href="../../css/ncss_style.css" rel="stylesheet" type="text/css" />

<%String uri =  request.getContextPath();%>
</head> 
<body>
<div id="ncss_banner_wrapper">
	<div id="ncss_banner">    
    	<div id="ncss_banner_image">
        	<div id="ncss_banner_image_wrapper">
            	
            </div>
        </div>
        <div id="ncss_banner_content">
        	<div class="header_01">通知公告发布系统 --后台</div>  
		</div>
    </div> <!-- end of banner -->
</div> <!-- end of banner wrapper -->

<div id="ncss_content_wrapper">
	
	<div id="ncss_content">    
    	<div id="column_w530">        	
            <div class="header_02">欢迎<%=(String)session.getAttribute("name") %>访问通知公告发布系统--后台</div>
            <div class="content_section_01">
            	<div>
            	<h2>添加通知通告</h2>
            		<form method="post" name="form1" action="/notice/addNoticeServlet">	
					<table>
					<tr><td>标题:</td><td> <input type="text" name="title" size="35" value=""/></td></tr>
					<tr><td>作者:</td><td><input type="text" name="editor" size="35" value=""/></td></tr>
					<tr><td>内容:</td><td><textarea name="content" rows="10" cols="30" ></textarea></td></tr>
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
			<option value="1">安全通知</option>
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
					<tr><td>
							
							<input type="submit" value="添加" name="submit" /></td>
						<td> <input type="reset" value="重置" name="reset"/>	
							</td></tr>
					</table> 
					</form>
            	</div>
            </div>
            <div class="cleaner"></div>
        </div>
           <div id="column_w300">        
        	<div class="header_03">通知公告及类别管理</div>            
            <div class="column_w300_section_01">
            	<div class="notice_image_wrapper">
                	<img src="../../images/ncss_image_02.jpg" alt="image" />
                </div>                
                <div class="notice_content">
                	<a href=<%=uri+"/page/background/addNotice.jsp"%> target="_self" >添加通知公告</a>
             	</div>                                
                <div class="cleaner"></div>
            </div>
            
                    
             <div class="column_w300_section_01 even_color">
            	<div class="notice_image_wrapper">
                	<img src="../../images/ncss_image_04.jpg" alt="image" />
                </div>
                
                 <div class="notice_content">
               	<a href=<%=uri+"/page/background/listNotice.jsp"%> target="_self">通知公告列表</a>              	
				</div>         
                <div class="cleaner"></div>
            </div>
   
            
            <div class="column_w300_section_01">
            	<div class="notice_image_wrapper">
                	<img src="../../images/ncss_image_02.jpg" alt="image" />
                </div>                
                <div class="notice_content">
                	<a href=<%=uri+"/page/background/addNoticeType.jsp"%> target="_self" >添加公告类别</a>
             	</div>                                
                <div class="cleaner"></div>
            </div>
            
            <div class="cleaner"></div>
            
             <div class="column_w300_section_01 even_color">
            	<div class="notice_image_wrapper">
                	<img src="../../images/ncss_image_04.jpg" alt="image" />
                </div>
                
                 <div class="notice_content">
               	<a href=<%=uri+"/page/background/listNoticeType.jsp"%> target="_self">公告类别列表</a>              	
				</div>         
                <div class="cleaner"></div>
            </div>
        </div>
    	<div class="cleaner"></div>
    </div> <!-- end of content wrapper -->
</div> <!-- end of content wrapper -->

<div id="ncss_footer_wrapper"> 
        <div class="margin_bottom_20"></div>
              Copyright © 2016 <a href="#">Neusoft</a> | Designed by <a href="#" target="_parent">LMY</a>|该网站的访问量为：23<div class="cleaner"></div>
</div> <!-- end of footer -->	

</body>
</html>