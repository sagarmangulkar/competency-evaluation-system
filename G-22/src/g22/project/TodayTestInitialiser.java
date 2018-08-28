package g22.project;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
@WebListener
public class TodayTestInitialiser implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub

	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) 
	{
		arg0.getServletContext().setAttribute("count", 0);
		arg0.getServletContext().setAttribute("noOfQuestions", 1);
	}

}
