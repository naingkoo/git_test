package com.student.persistance;

import java.sql.*;
import java.util.List;

import com.student.models.Course;
import com.student.models.Student;

public class StudentRepository {
	public static Connection con=null;
	static {
		 con=MyConnection.getConnection();
	}

	public int addStudent(Student student){
		int result=0;
		try {
		String sql="INSERT INTO students(id,name,DOB,gender,phone_number,education) VALUES (?,?,?,?,?,?)";
		PreparedStatement preSet= con.prepareStatement(sql);
		preSet.setString(1,student.getId());
		preSet.setString(2,student.getName());
		preSet.setString(3,student.getDob());
		preSet.setString(4,student.getGender());
		preSet.setInt(5,student.getPhone());
		preSet.setString(6,student.getEducation());
		result =preSet.executeUpdate();
		
		String sql1="INSERT INTO students_has_course(students_id,course_id) VALUES (?,?)";
		PreparedStatement preSet1= con.prepareStatement(sql1);
		for (String courseString:  student.getCourse()) {
			preSet1.setString(1,student.getId());
			preSet1.setString(2,courseString);
			result =preSet1.executeUpdate();
			}
		
		}catch(SQLException e) {
			result=0;
			System.out.println("insert error"+e);
		}
		return result;
		
	}
	
	
//	public int addCourseStudent(Student student) {
//		int result=0;
//		try {
//			String sql="INSERT INTO students_has_course(students_id,course_id) VALUES (?,?)";
//			PreparedStatement preSet= con.prepareStatement(sql);
//			for (String courseString:  student.getCourse()) {
//				preSet.setString(1,student.getId());
//				preSet.setString(2,courseString);
//	
//		         }
//			
//			result =preSet.executeUpdate();
//			
//			}catch(SQLException e) {
//				result=0;
//				System.out.println("insert error"+e);
//			}
//			return result;
//			
//		
//		
//	}
//	
//	
	
	public Student getAllStudent() {
		
		
		String sql="SELECT * FROM students";
		Student student = new Student();
		try {
		PreparedStatement preSet=con.prepareStatement(sql);
		ResultSet result=preSet.executeQuery();
		
		while(result.next()) {
		student.setId(result.getString("id"));	
		student.setName(result.getString("name"));	
		student.setGender(result.getString("Gender"));
		student.setDob(result.getString("DOB"));
		}
		
		}catch(SQLException e) {
			System.out.println("Select error"+e);
		}
		return null;
		
	}
	
//	public List<String> getbyStudentId(String id){
//		List<String> course=null;
//		
//		
//		
//		return null;
//		
//	}
}
