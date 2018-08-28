package g22.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;


public class RemoveExpertFromDB extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public RemoveExpertFromDB() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out=response.getWriter();
		ServletContext context=request.getServletContext();
		SessionFactory factory = null;
		Configuration config = null;
		Session hiberSession = null;
		
			config = new Configuration();
			
			config.configure("EmpReg.cfg.xml");
			
			ServiceRegistryBuilder builder = new ServiceRegistryBuilder();
			
			builder.applySettings(config.getProperties());
			
			ServiceRegistry registry = builder.buildServiceRegistry();
			
			factory = config.buildSessionFactory(registry);
			
			hiberSession = factory.openSession();
			Transaction tx=hiberSession.beginTransaction();
		Query query=hiberSession.createQuery("Update Employee emp set emp.selectRoll='employee' where employeeId=:id");
		
		query.setString("id", request.getParameter("employeeId1"));
	
		int result=query.executeUpdate();
		tx.commit();
		if(result!=0)
		{
			out.println("Expert Successfully Removed");
		}
		else
		{
			out.println("record not found");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
