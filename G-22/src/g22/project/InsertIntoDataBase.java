package g22.project;

import g22.beans.Employee;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;


public class InsertIntoDataBase extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public InsertIntoDataBase() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out= response.getWriter();
		HttpSession redSession=request.getSession(false);

		SessionFactory factory = null;
		Configuration config = null;
		Session hiberSession = null;
		
		try {
			config = new Configuration();
			
			config.configure("EmpReg.cfg.xml");
			ServiceRegistryBuilder builder = new ServiceRegistryBuilder();
			builder.applySettings(config.getProperties());
			ServiceRegistry registry = builder.buildServiceRegistry();
			factory = config.buildSessionFactory(registry);
			hiberSession = factory.openSession();

			Employee objEmp=new Employee();
			objEmp.setEmployeeId((int) redSession.getAttribute("employyeId"));
			objEmp.setFirstName( (String) redSession.getAttribute("firstName"));
			objEmp.setLastName( (String) redSession.getAttribute("lastName"));
			objEmp.setPassword((String) redSession.getAttribute("password"));
			objEmp.setcPassword( (String) redSession.getAttribute("cPassword"));
			objEmp.setTechnology((String) redSession.getAttribute("technology"));
			objEmp.setContactNo((int) redSession.getAttribute("contactNo"));
			objEmp.setEmailId( (String) redSession.getAttribute("emailId"));
			objEmp.setsQuestion((String) redSession.getAttribute("sQuestion"));
			objEmp.setsAnswer((String) redSession.getAttribute("sAnswer"));
			
			Transaction tx=hiberSession.beginTransaction();
			hiberSession.save(objEmp);
			tx.commit();
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			if(hiberSession!=null)
				hiberSession.close();
			if(factory!=null)
				factory.close();
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out= response.getWriter();
		
		int employeeId=Integer.parseInt(request.getParameter("employeeid"));
		System.out.println(employeeId);
		String firstName=request.getParameter("firstname");
		String lastName=request.getParameter("lastname");
		String password=request.getParameter("password");
		String cPassword=request.getParameter("cpassword");
		String technology=request.getParameter("technology");
		int contactNo=Integer.parseInt( request.getParameter("contactno"));
		String emailId=request.getParameter("emailid");
		String sQuestion=request.getParameter("squestion");
		String sAnswer=request.getParameter("sanswer");
		System.out.println(firstName);

		Connection connection=null;
		PreparedStatement psInsert=null;
		ResultSet result=null;
		
		try 
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection=DriverManager.getConnection("jdbc:oracle:thin:@172.25.12.1:1521:oracle", "user68", "user68");
			psInsert=connection.prepareStatement("insert into registration values(?,?,?,?,?,?,?,?,?,?,'employee')");
			psInsert.setInt(1, employeeId);
			psInsert.setString(2, firstName);
			psInsert.setString(3, lastName);
			psInsert.setString(4, password);
			psInsert.setString(5, cPassword);
			psInsert.setString(6, technology);
			psInsert. setInt(7, contactNo);
			psInsert.setString(8, emailId);
			psInsert.setString(9, sQuestion);
			psInsert.setString(10, sAnswer);
			psInsert.executeUpdate();
			
			out.println("Inserted into DataBase.");
		} 
		catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		HttpSession redSession=request.getSession(false);
	}

}
