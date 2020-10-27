package jdbc.daos;

import jdbc.models.Course;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

public class CourseDao {
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String HOST = "localhost:3306";
    static final String SCHEMA = "database_design";
    static final String CONFIG = "serverTimezone=UTC";
    static final String DB_URL
            = "jdbc:mysql://"+HOST+"/"+SCHEMA+"?"+CONFIG;

    static final String USER = "dbDesign";
    static final String PASS = "dbDesign";

    static Connection connection = null;
    static PreparedStatement statement = null;
    Integer status = -1;

    public static Connection getConnection() {
        //if(connection != null) return connection;
        try {
            Class.forName(JDBC_DRIVER);
            connection = DriverManager
                    .getConnection(DB_URL,USER,PASS);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public static void closeConnection() {
        try {
            if(connection != null) {
                connection.close();
            }
            if(statement != null) {
                statement.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    static final String FIND_ALL_COURSES
            = "SELECT * FROM courses";
    public List<Course> findAllCourses() {
        List<Course> courses = new ArrayList<Course>();
        connection = getConnection();
        try {
            statement = connection
                    .prepareStatement(FIND_ALL_COURSES);
            ResultSet resultSet = statement.executeQuery();
            while(resultSet.next()) {
                Integer id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                Course course = new Course(id, title);
                courses.add(course);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return courses;
    }
    public static void main(String[] args) {
        CourseDao dao = new CourseDao();
        List<Course> courses = dao.findAllCourses();
        for (Course c : courses) {
            System.out.println(c);
        }

        Course course = new Course(123, "CS2222");
        Integer status = dao.updateCourse(123, course);

        courses = dao.findAllCourses();
        for (Course c : courses) {
            System.out.println(c);
        }

        course = dao.findCourseById(123);
        System.out.println(course);

        course = new Course(345, "CS1234");
        status = dao.createCourse(course);
        System.out.println(status);

        course = dao.findCourseById(345);
        System.out.println(course);
    }

    static final String UPDATE_COURSE =
            "UPDATE courses SET title=? WHERE id=?";
    public Integer updateCourse(Integer courseId, Course course) {
        connection = getConnection();
        try {
            statement = connection.prepareStatement(UPDATE_COURSE);
            statement.setString(1, course.getTitle());
            statement.setInt(2, course.getId());
            status = statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return status;
    }
    static final String FIND_COURSE_BY_ID =
            "SELECT * FROM courses WHERE id=?";
    public Course findCourseById(Integer courseId) {
        connection = getConnection();
        try {
            statement = connection.prepareStatement(FIND_COURSE_BY_ID);
            statement.setInt(1, courseId);
            ResultSet resultSet = statement.executeQuery();
            if(resultSet.next()) {
                String title = resultSet.getString("title");
                Course course = new Course(courseId, title);
                return course;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }
    static final String CREATE_COURSE
            = "INSERT INTO courses VALUES (?,?)";
    public Integer createCourse(Course course) {
        status = -1;
        connection = getConnection();
        try {
            statement = connection
                    .prepareStatement(CREATE_COURSE);
            statement.setInt(1, course.getId());
            statement.setString(2, course.getTitle());
            status = statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return status;
    }

}


