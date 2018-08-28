package g22.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;


public class Authentication extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Authentication() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out= response.getWriter();
		String userName= request.getParameter("userName");
		String password= request.getParameter("password");
		String selectRoll= request.getParameter("selectRoll");
		
		HttpSession userSession=request.getSession();
		
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
		
		Query query=hiberSession.createQuery("Select emp.firstName,emp.password,emp.selectRoll from Employee emp where emp.firstName=:name and emp.password=:pwd");
		query.setString("name",userName);
		query.setString("pwd",password);
		
		Iterator<Object[]> iter=(Iterator<Object[]>)query.iterate();
		if(iter.hasNext())
		{
			Object[] data=iter.next();
			if(data[2].equals("admin"))
			{
				userSession.setAttribute("userName", data[0]);
				response.sendRedirect("AdminConsole.jsp");
			}
			else if(data[2].equals("expert"))
			{
				userSession.setAttribute("userName", data[0]);
				response.sendRedirect("expert.jsp");
			}
			else
			{
				userSession.setAttribute("userName", data[0]);
				response.sendRedirect("employeeConsole.jsp");
			}
			System.out.println("succesfull");
		}
		else
		{
			out.println("Invalid username/password");
			out.println("<html><body><br/><br/><a href='index.html'>Click here to Log in again</a>");
			out.println("</body></html>");
		}
	
	}

}
