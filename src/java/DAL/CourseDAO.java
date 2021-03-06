/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Course;
import model.Doctor;

/**
 *
 * @author ADMIN
 */
public class CourseDAO extends BaseDAO<Course> {

    public ArrayList<Course> getCourses() {
        ArrayList<Course> courses = new ArrayList<>();
        try {
            String sql = "SELECT c.[courseID]\n"
                    + "      ,d.doctorName\n"
                    + "      ,c.[courseName]\n"
                    + "      ,c.[courseTimeWorking]\n"
                    + "      ,c.[coursePrice]\n"
                    + "      ,c.[courseImg]\n"
                    + "      ,c.[courseInfo]\n"
                    + "  FROM [ass_prj].[dbo].[Course] c inner join [ass_prj].[dbo].[Doctor] d\n"
                    + "  on c.doctorID = d.doctorID";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Course s = new Course();
                s.setCourseID(rs.getString("courseID"));
                s.setD(new Doctor(rs.getString("doctorName")));
                s.setCourseName(rs.getString("courseName"));
                s.setCourseTime(rs.getString("courseTimeWorking"));
                s.setCoursePrice(rs.getString("coursePrice"));
                s.setCourseImg(rs.getString("courseImg"));
                s.setCourseInfo(rs.getString("courseInfo"));
                courses.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return courses;
    }

    public ArrayList<Course> getCoursesbyDoctorID() {
        ArrayList<Course> courses = new ArrayList<>();
        try {
            String sql = "select * from Course";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Course s = new Course();
                s.setCourseID(rs.getString("courseID"));
                s.setD(new Doctor(rs.getString("doctorID")));
                s.setCourseName(rs.getString("courseName"));
                s.setCourseTime(rs.getString("courseTimeWorking"));
                s.setCoursePrice(rs.getString("coursePrice"));
                s.setCourseImg(rs.getString("courseImg"));
                s.setCourseInfo(rs.getString("courseInfo"));
                courses.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return courses;
    }

    public int getCount() {
        try {
            String sql = "SELECT COUNT(*) AS TOTAL FROM Course";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt("TOTAL");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
//pageindex - phan trang

    public ArrayList<Course> getPageCourses(int pageindex, int pagesize) {
        ArrayList<Course> course = new ArrayList<>();
        try {
            String sql = "Select * from\n"
                    + "(SELECT ROW_NUMBER() OVER (ORDER BY [courseID] ASC) AS [Row], courseID, d.doctorName, courseName, courseTimeWorking,coursePrice,courseImg,courseInfo \n"
                    + "FROM Course c inner join Doctor d on c.doctorID = d.doctorID) as T\n"
                    + "\n"
                    + "WHERE [Row] >= (?-1)*? +1 AND [Row] <= ?*?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, pageindex);
            statement.setInt(2, pagesize);
            statement.setInt(3, pageindex);
            statement.setInt(4, pagesize);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Course c = new Course();
                c.setCourseID(rs.getString("courseID"));
                c.setD(new Doctor(rs.getString("doctorName")));
                c.setCourseName(rs.getString("courseName"));
                c.setCourseTime(rs.getString("courseTimeWorking"));
                c.setCoursePrice(rs.getString("coursePrice"));
                c.setCourseImg(rs.getString("courseImg"));
                c.setCourseInfo(rs.getString("courseInfo"));
                course.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return course;

    }

//    enroll course
    public void getEnroll(String patientId, String courseId) {
        try {
            String sql = "INSERT INTO [dbo].[Patient_Course]\n"
                    + "           ([patientID]\n"
                    + "           ,[courseID])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, patientId);
            statement.setString(2, courseId);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

//    check enroll 
    public boolean checkEnroll(String patinetID, String courseID) {
        try {
            String sql = "SELECT [patientID]\n"
                    + "      ,[courseID]\n"
                    + "  FROM [ass_prj].[dbo].[Patient_Course]\n"
                    + "  where patientID = ? and courseID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, patinetID);
            statement.setString(2, courseID);

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    public void unEnroll(String patinetID, String courseID) {
        try {
            String sql = "DELETE FROM Patient_Course WHERE patientID = ? and courseID = ?;";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, patinetID);
            statement.setString(2, courseID);
            statement.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

//    admin course
    public void insertCourse(Course c) {
        try {
            String sql = "INSERT INTO [dbo].[Course]\n"
                    + "           ([courseID]\n"
                    + "           ,[doctorID]\n"
                    + "           ,[courseName]\n"
                    + "           ,[courseTimeWorking]\n"
                    + "           ,[coursePrice]\n"
                    + "           ,[courseImg]\n"
                    + "           ,[courseInfo])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, c.getCourseID());
            statement.setString(2, c.getD().getDoctorID());
            statement.setString(3, c.getCourseName());
            statement.setString(4, c.getCourseTime());
            statement.setString(5, c.getCoursePrice());//------------
            statement.setString(6, c.getCourseImg());
            statement.setString(7, c.getCourseInfo());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DoctorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteCourse(String courseID) {
        try {
            String sql = "DELETE FROM [dbo].[Course]\n"
                    + "      WHERE courseID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, courseID);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DoctorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Course getCourse(String courseID) {
        ArrayList<Doctor> courses = new ArrayList<>();
        try {
            String sql = "SELECT [courseID]\n"
                    + "      ,c.[doctorID]\n"
                    + "	  ,d.doctorName\n"
                    + "      ,[courseName]\n"
                    + "      ,[courseTimeWorking]\n"
                    + "      ,[coursePrice]\n"
                    + "      ,[courseImg]\n"
                    + "      ,[courseInfo]\n"
                    + "  FROM [ass_prj].[dbo].[Course] c inner join Doctor d\n"
                    + "  on c.doctorID = d.doctorID\n"
                    + "  where [courseID] = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, courseID);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Course s = new Course();
                s.setCourseID(rs.getString("courseID"));
                s.setD(new Doctor(rs.getString("doctorID"), rs.getString("doctorName")));
                s.setCourseName(rs.getString("courseName"));
                s.setCourseTime(rs.getString("courseTimeWorking"));
                s.setCoursePrice(rs.getString("coursePrice"));
                s.setCourseImg(rs.getString("courseImg"));
                s.setCourseInfo(rs.getString("courseInfo"));
                return s;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updateCourse(Course d) {
        try {
            String sql = "UPDATE [dbo].[Course]\n"
                    + "   SET [courseID] = ?\n"
                    + "      ,[doctorID] = ?\n"
                    + "      ,[courseName] = ?\n"
                    + "      ,[courseTimeWorking] = ?\n"
                    + "      ,[coursePrice] = ?\n"
                    + "      ,[courseImg] = ?\n"
                    + "      ,[courseInfo] =?\n"
                    + " WHERE [courseID] = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, d.getCourseID());
            statement.setString(2, d.getD().getDoctorID());
            statement.setString(3, d.getCourseName());
            statement.setString(4, d.getCourseTime());
            statement.setString(5, d.getCoursePrice());
            statement.setString(6, d.getCourseImg());
            statement.setString(7, d.getCourseInfo());
            statement.setString(8, d.getCourseID());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DoctorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        CourseDAO db = new CourseDAO();
//        ArrayList<Course> c = new ArrayList<>();
//        c = db.getPageCourses(1, 4);
//        for (Course a : c) {
//            System.out.println(a);
//        }
//        db.getEnroll("6", "A01");

    }
}
