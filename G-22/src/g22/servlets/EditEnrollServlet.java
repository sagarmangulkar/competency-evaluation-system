package g22.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EditEnrollServlet
 */
public class EditEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditEnrollServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

		System.out.println("Hello");
		String testName=request.getParameter("testname");
		String date=request.getParameter("date");
		System.out.println(testName);
		System.out.println(date);
		Connection connection=null;
		PreparedStatement psInsert=null;
		PreparedStatement psSelect=null;
		ResultSet rs=null;
		
		PrintWriter out=response.getWriter();
		
	         try
	 			{
	 			Class.forName("oracle.jdbc.driver.OracleDriver");
	 			connection=DriverManager.getConnection("jdbc:oracle:thin:@172.25.12.1:1521:oracle", "user68", "user68");
	 			psInsert=connection.prepareStatement("update test_detail set dateoftest=? where testid=(select testid from test where testname=?)");
	 			
	 			psInsert.setString(1,date);
	 			psInsert.setString(2,testName);
	 			int result=psInsert.executeUpdate();
	 			if (result!=0) 
	 			{
	 				out.println("Successfully Rescheduled");
				} 
	 			else 
	 			{
	 				out.println("Can not be re-scheduled");
				}
	 	
	 			}
	 			catch (ClassNotFoundException | SQLException e) {
	 			// TODO Auto-generated catch block
	 			e.printStackTrace();
	 			}
	         	finally
	         	{
	         		try {
	         			if(psInsert!=null)
						 psInsert.close();
	         			if(connection!=null)
						 connection.close();
	         			} 
	         		catch (SQLException e) 
	         			{
	         				// TODO Auto-generated catch block
	         				e.printStackTrace();
	         			}
	         	}
		 

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
