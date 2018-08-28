package g22.project;

import javax.servlet.jsp.PageContext;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

public class Employee 
{
	int employeeId;
	String firstName;
	String lastName;
	String password;
	String cPassword;
	String technology;
	int contactNo;
	String emailId;
	String sQuestion;
	String sAnswer;
	String selectRoll;
	
	public String getSelectRoll() {
		return selectRoll;
	}
	public void setSelectRoll(String selectRoll) {
		this.selectRoll = selectRoll;
	}
	public int getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getcPassword() {
		return cPassword;
	}
	public void setcPassword(String cPassword) {
		this.cPassword = cPassword;
	}
	public String getTechnology() {
		return technology;
	}
	public void setTechnology(String technology) {
		this.technology = technology;
	}
	public int getContactNo() {
		return contactNo;
	}
	public void setContactNo(int contactNo) {
		this.contactNo = contactNo;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getsQuestion() {
		return sQuestion;
	}
	public void setsQuestion(String sQuestion) {
		this.sQuestion = sQuestion;
	}
	public String getsAnswer() {
		return sAnswer;
	}
	public void setsAnswer(String sAnswer) {
		this.sAnswer = sAnswer;
	}
	public Employee() {
		super();
	}
	public Employee(int employeeId, String firstName, String lastName,
			String password, String cPassword, String technology,
			int contactNo, String emailId, String sQuestion, String sAnswer) {
		super();
		this.employeeId = employeeId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.password = password;
		this.cPassword = cPassword;
		this.technology = technology;
		this.contactNo = contactNo;
		this.emailId = emailId;
		this.sQuestion = sQuestion;
		this.sAnswer = sAnswer;
	}
	
	public void save()
	{
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
				objEmp.setEmployeeId(employeeId);
				objEmp.setFirstName(firstName);
				objEmp.setLastName(lastName);
				objEmp.setPassword(password);
				objEmp.setcPassword(cPassword);
				objEmp.setTechnology(technology);
				objEmp.setContactNo(contactNo);
				objEmp.setEmailId(emailId);
				objEmp.setsQuestion(sQuestion);
				objEmp.setsAnswer(sAnswer);
				
				Transaction tx=hiberSession.beginTransaction();
				hiberSession.save(objEmp);
				tx.commit();
		}
		catch (HibernateException e) 
		{
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
}
