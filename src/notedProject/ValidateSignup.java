package notedProject;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.descriptor.web.LoginConfig;

/**
 * Servlet implementation class ValidateSignup
 */
@WebServlet("/ValidateSignup")
public class ValidateSignup extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String firstName= request.getParameter("fname");
		String lastName= request.getParameter("lname");
		String username = request.getParameter("signupUsername");
		String email = request.getParameter("signupEmail");
		String pw = request.getParameter("signupPassword");
	}

}
