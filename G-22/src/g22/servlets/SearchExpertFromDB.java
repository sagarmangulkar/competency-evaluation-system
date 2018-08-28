package g22.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;


public class SearchExpertFromDB extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
    
    public SearchExpertFromDB() 
    {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		PrintWriter out=response.getWriter();
	
		String button= request.getParameter("remove");
		out.println(button);
		if (button.equals("Remove")) 
		{
			remove(request,response);
		} 
		else 
		{
			search(request,response);
		}
		

		
	}

	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	private void search(HttpServletRequest request, HttpServletResponse response) {
		try {
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
			Query query=hiberSession.createQuery("Update Employee emp set emp.selectRoll='expert' where employeeId=:id");
			
			query.setString("id", request.getParameter("empId"));

			int result=query.executeUpdate();
			tx.commit();
			if(result!=0)
			{
				out.println("Successfully updated");
			}
			else
			{
				out.println("record not found");
			}
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	private void remove(HttpServletRequest request, HttpServletResponse response) {
		try {
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
				out.println("remove : record not found");
			}
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}


}
