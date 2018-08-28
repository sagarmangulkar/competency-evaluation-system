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
 * Servlet implementation class ViewQuestionServlet
 */
public class ViewQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewQuestionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out= response.getWriter();
		
		String testName=request.getParameter("testName");
		String competencyId=request.getParameter("competency");

		Connection connection=null;
		PreparedStatement psSelect=null;
		ResultSet result=null;
		
		try 
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection=DriverManager.getConnection("jdbc:oracle:thin:@172.25.12.1:1521:oracle", "user68", "user68");
			psSelect=connection.prepareStatement("select questiondesc,option1,option2,option3,option4,answer from question where testid=? and competencyid=?");
			
			psSelect.setInt(1, Integer.parseInt(testName));
			psSelect.setInt(2, Integer.parseInt(competencyId));
			
			result=psSelect.executeQuery();
			out.println("<html>");
			out.println("<body>");
			out.println("<table border='1'>");
			out.println("<tr>");
			out.println("<td>"+"Questions"+"</td><td>"+"Option A"+"</td><td>"+"Option B"+"</td><td>"+"Option C"+"</td><td>"+"Option D"+"</td>");
			out.println("<tr>");
			while(result.next())
			{
				out.println("<tr>");
				out.println("<td>"+result.getString(1)+"</td><td>"+result.getString(2)+"</td><td>"+result.getString(3)+"</td><td>"+result.getString(3)+"</td><td>"+result.getString(4)+"</td>");
				out.println("<tr>");
				out.println("");
			}
			out.println("</table>");
			out.println("</body>");
			out.println("</html>");
		} 
		catch (ClassNotFoundException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
}
