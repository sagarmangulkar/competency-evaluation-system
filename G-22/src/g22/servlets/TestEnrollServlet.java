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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class TestEnrollServlet
 */
public class TestEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestEnrollServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		Connection connection=null;
		PreparedStatement psInsert=null;
		PreparedStatement psSelect=null;
		ResultSet rs=null;
		
		PrintWriter out=response.getWriter();
		
		String testName=request.getParameter("testname");
		String technology=request.getParameter("technology");
		String date=request.getParameter("date");
		String empId=request.getParameter("empId");
		
		String data=request.getParameter("empId");
		 for (String retval: data.split(","))
		 {
	         try
	 			{
	 			Class.forName("oracle.jdbc.driver.OracleDriver");
	 			connection=DriverManager.getConnection("jdbc:oracle:thin:@172.25.12.1:1521:oracle", "user68", "user68");
	 			
	 			psSelect=connection.prepareStatement("select testid,duration from test");
	 			rs=psSelect.executeQuery();
	 			if(rs.next())
	 			{
					psInsert=connection.prepareStatement("insert into test_detail values(seq_testdetailid.nextval,?,?,?,?,?)");

					psInsert.setInt(1, Integer.parseInt(retval));
					psInsert.setInt(2, rs.getInt("testid"));
					psInsert.setInt(3,0);
					psInsert.setString(4,date);
					psInsert.setInt(5, rs.getInt("duration"));

					psInsert.executeUpdate();
	 			
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
	         			if(psSelect!=null)
						 psSelect.close();
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

		out.println(testName);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
