import java.sql.*;

public class Test{
	static final String DB_URL = "jdbc:mysql://localhost/emp";
	
	static final String USR = "root";
	static final String PASSWORD = "xieshuai";
	
	public static void main(String[] args) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Connect...");
			Connection connect = DriverManager.getConnection(DB_URL, USR, PASSWORD);
			System.out.println("Create Statement");
			Statement statement = connect.createStatement();
			ResultSet rst = statement.executeQuery("SELECT * FROM employee;");
			
			while (rst.next()) {
				int id = rst.getInt("id");
				int age = rst.getInt("age");
				String first = rst.getString("first");
				String last = rst.getString("last");
				
				System.out.print("id: " + id);
				System.out.print(" |age: " + age);
				System.out.println(" |name: " + first + " " + last);
			}
			
			rst.close();
			statement.close();
			connect.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}