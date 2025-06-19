package com.util;
import java.sql.*;


public class DbConnection {
	public static Connection connect() {
		String url = "jdbc:mysql://localhost:3306/online_shopping";
		String name="root";
		String pass="Priyanka@143";
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");

		Connection c=DriverManager.getConnection(url,name,pass);
		return c;
		
	}
		catch(Exception e) {
			System.out.print(e);
			return null;
			
		}

}
}
