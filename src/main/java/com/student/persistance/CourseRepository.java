package com.student.persistance; 

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.student.models.Course;

public class CourseRepository {
	
	public static Connection con=null;
	static {
		con=MyConnection.getConnection();
		}
	
	public int addCourse(Course course) {
		int result =0;
		String sql="INSERT INTO course(id,course) VALUES (?,?)";
		try {
			PreparedStatement preSet=con.prepareStatement(sql);
			preSet.setString(1, course.getId());
			preSet.setString(2, course.getCourse_name());
			result=preSet.executeUpdate();
			System.out.println(result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("insert error:"+e);;
			result=0;
			
		}
		return result;
		
	}
	
	public List<Course> getAll() {
		List<Course> courses=new ArrayList<>();
		String sql="SELECT * FROM course";
		try {
			PreparedStatement preSet=con.prepareStatement(sql);
			ResultSet result=preSet.executeQuery();
			while(result.next()) {
				Course course=new Course();
				course.setId(result.getString("id"));
				course.setCourse_name(result.getString("course"));
				courses.add(course);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return courses;
	}
	
}
