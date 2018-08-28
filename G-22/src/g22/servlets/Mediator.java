package g22.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;

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

 public class Mediator extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public Mediator() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String button=request.getParameter("button");
		System.out.println(button);
		if (button.equals("search")) 
		{
			search(request,response);
		}
		else 
		{
			update(request,response);
		}
	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	public void search(HttpServletRequest request, HttpServletResponse response)
	{
		try {
			PrintWriter out=response.getWriter();
			out.println("Inside search function");
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
			Query query=hiberSession.createQuery("Select emp.employeeId,emp.firstName,emp.lastName,emp.technology from Employee emp where employeeId=:id");
			query.setString("id", request.getParameter("empId"));
			Iterator<Object[]> iter=(Iterator<Object[]>)query.iterate();
			out.println(iter.hasNext());
			if(iter.hasNext())
			{
				response.sendRedirect("EditExpert.jsp");
				Object[] data=iter.next();
				context.setAttribute("employeeId", data[0]);
				context.setAttribute("firstName", data[1]);
				context.setAttribute("lastName", data[2]);
				context.setAttribute("technology", data[3]);
				
				
			}
			else
			{
				
				out.println("not found...");
			}
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	private void update(HttpServletRequest request, HttpServletResponse response) 
	{
		try {
			PrintWriter out=response.getWriter();
			out.println("Inside update function");
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
			Query query=hiberSession.createQuery("Update Employee emp set emp.technology=:tech where employeeId=:id");
			
			query.setString("id", request.getParameter("empId"));
			query.setString("tech", request.getParameter("techn"));

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
}
