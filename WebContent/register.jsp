<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.regex.*, java.sql.*" %>

<%!
	static final String DB_URL = "jdbc:mysql://localhost/login";
	static final String USER = "root";
	static final String PASSWORD = "xieshuai";
	static String pattern_phonenum = "^'1[3|4|5|7|8][0-9]\\d{8}'$";
	static String pattern_mail = "^'[0-9a-zA-Z][0-9a-zA-Z_]+@[0-9a-zA-Z_-]+(\\.[0-9a-zA-Z_-]+)+'$";
	static String pattern_name = "^'[a-zA-Z][0-9a-zA-Z_-]+'$";
	static String pattern_pwd = "^'[0-9a-zA-Z\\.]{6,10}'$";
%>

<%
	try{
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection connect = DriverManager.getConnection(DB_URL, USER, PASSWORD);
		Statement statement = connect.createStatement();
		
		String id = "";
		id = "'" + request.getParameter("phonenumber") + "'";
		
		String name = "";
		name = "'" + request.getParameter("name") + "'";
		
		String pwd = "";
		pwd = "'" + request.getParameter("password") + "'";
		
		String sqlSelct = "SELECT id FROM accant WHERE id = " + id;
		ResultSet rst = statement.executeQuery(sqlSelct);
		if (!name.matches(pattern_name)){
			out.print("<p>昵称格式不正确</p>");
		}else if (!id.matches(pattern_phonenum) && !id.matches(pattern_mail)){
			out.println("<p>账户名格式不正确</p>");	
		} else if (!pwd.matches(pattern_pwd)){
			out.print("<p>密码格式不正确</p>");
		}else if (rst.next()){
		out.print("<p>账户已注册！</p>");
		} else {
		String sqlInsert = "INSERT INTO accant (id, name, password) VALUE("
						+ id + "," + name + "," + pwd + ")";
		statement.executeUpdate(sqlInsert); 
		out.println("<p>注册成功</p>");
		}
		
		statement.close();
		connect.close();
	} catch(Exception e){
		out.println(e.toString());
	} 
%>
