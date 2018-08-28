package g22.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddQuestionServlet
 */
public class AddQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddQuestionServlet() {
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
		String question=request.getParameter("txtquestion");
		String competencyId=request.getParameter("competency");
		String option1=request.getParameter("txtoption1");
		String option2=request.getParameter("txtoption2");
		String option3=request.getParameter("txtoption3");
		String option4=request.getParameter("txtoption4");
		String answer=request.getParameter("option");
		
		Connection connection=null;
		PreparedStatement psInsert=null;
		
		try 
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection=DriverManager.getConnection("jdbc:oracle:thin:@172.25.12.1:1521:oracle", "user68", "user68");
			psInsert=connection.prepareStatement("insert into question values(seq_questionid.nextval,?,?,?,?,?,?,?,?)");
				
				psInsert.setString(1,question);
				psInsert.setInt(2,Integer.parseInt(testName));
				psInsert.setInt(3,Integer.parseInt(competencyId));
				psInsert.setString(4,option1);
				psInsert.setString(5,option2);
				psInsert.setString(6,option3);
				psInsert.setString(7,option4);
				psInsert.setString(8,answer);
				
				
				int result=psInsert.executeUpdate();
				if(result!=0)
					out.println("Inserted into DataBase.");
				else
					out.println("Something goes wrong with Insertion");
			
		} 
		catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
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
