package com.student.persistance;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.student.models.User;

public class UserRepository {
	public static Connection con=null;
	static {
		 con=MyConnection.getConnection();
	}

	public int addUser(User user) {
		int result=0;
		String sql="INSERT INTO students(id,username,password,role) VALUES (?,?,?,?)";

		try {
			PreparedStatement preSet=con.prepareStatement(sql);
			preSet.setString(1, user.getId());
			preSet.setString(2, user.getUsername());
			preSet.setString(3, user.getPassword());
			preSet.setString(4, user.getRole());
			result=preSet.executeUpdate();
		} catch (SQLException e) {
			result =0;
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
		
	}
	
	public User getByUsername(String username,String password) {
		User usr=null;
		String sql="SELECT * FROM users where username=? and password=?";
		try {
			PreparedStatement preSet=con.prepareStatement(sql);
			preSet.setString(1,username);
			preSet.setString(2,password);
			//to fix
			ResultSet result =preSet.executeQuery();
			System.out.println("result: "+result);
			while(result.next()) {
			usr=new User();
			usr.setUsername(result.getString("username"));
			usr.setId(result.getString("id"));
			usr.setRole(result.getString("role"));
			usr.setPassword(password);
			System.out.println("check");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return usr;
		
	}

}
