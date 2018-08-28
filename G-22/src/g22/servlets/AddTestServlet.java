package g22.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddTest
 */
public class AddTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out=response.getWriter();
		
		String testName=request.getParameter("testName");
		String noofquestion=request.getParameter("noofquestion");
		String duration=request.getParameter("duration");
		String date=request.getParameter("date");
		
		Connection connection=null;
		PreparedStatement psInsert=null;
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection=DriverManager.getConnection("jdbc:oracle:thin:@172.25.12.1:1521:oracle", "user68", "user68");
			psInsert=connection.prepareStatement("insert into test values(seq_testid.nextval,?,?,?,?)");
			psInsert.setString(1, testName);
			psInsert.setInt(2, Integer.parseInt(noofquestion));
			psInsert.setString(3,date);
			psInsert.setInt(4, Integer.parseInt(duration));
			
			psInsert.executeUpdate();
			
			out.println("Inserted into DataBase.");
		}
		catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
