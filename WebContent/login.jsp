<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*, java.util.regex.*" %>

<%!
	static final String DB_URL = "jdbc:mysql://localhost/login";
	static final String USER = "root";
	static final String PASSWORD = "xieshuai";
	static String pattern_phonenum = "^'1[3|4|5|7|8][0-9]\\d{8}'$";
	static String pattern_mail = "^'[0-9a-zA-Z][0-9a-zA-Z_]+@[0-9a-zA-Z_-]+(\\.[0-9a-zA-Z_-]+)+'$";
%>
<% 
	try{
		Class.forName("com.mysql.jdbc.Driver");

		Connection connect = DriverManager.getConnection(DB_URL, USER, PASSWORD);
		Statement statement = connect.createStatement();

		String id = "";
		String name = "";
		String pwd = "";
		String correntPwd = "";
		
		id = "'" + request.getParameter("accant") + "'";
		pwd = request.getParameter("password");
		
		String sqlSelct = "SELECT password, name FROM accant WHERE id = " + id;
		ResultSet rst = statement.executeQuery(sqlSelct);
		if (!id.matches(pattern_phonenum) && !id.matches(pattern_mail)){
			out.print("<p>账户名格式不正确</p>");
		}
		else if (rst.next()){
			correntPwd = rst.getString("password");
			if (correntPwd.equals(pwd)){
				name = rst.getString("name");
				out.print("<p>登陆成功</p><br />");
				out.print("<p>名字是 " + name + "</p>");
			} else{
				out.print("<p>密码错误</p>");
			}
		} else{
			out.print("<p> 账户未注册</p>");
		}
		out.print("<p>over!</p>");
	} catch(Exception e){
		out.print(e.toString());
	}
%>