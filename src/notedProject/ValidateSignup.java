package notedProject;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		String firstName= request.getParameter("firstname");
		String lastName= request.getParameter("lastname");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String url = request.getParameter("url");
		String forward = "";
		request.setAttribute("firstName",firstName);
		request.setAttribute("lastName", lastName);
		request.setAttribute("username", username);
		request.setAttribute("email", email);
		request.setAttribute("password", password);
		request.setAttribute("url", url);
		
		LoadDatabase loadDatabase = new LoadDatabase();
		HttpSession session = request.getSession();
		session.setAttribute("database", loadDatabase);
		
		LoadDatabase database = (LoadDatabase) request.getSession(false).getAttribute("database");
		// Sign up check
		boolean check = true;
		boolean logincheck = database.CheckLogin(username, password);

		
		if (firstName == "" || lastName == "") {
			request.setAttribute("name_err", "Please enter your first and last name");
			forward = "/signup.jsp";
			check = false;
		}
		if (username == "") {
			request.setAttribute("username_err", "Please enter a username");
			forward = "/signup.jsp";
			check = false;
		} else if (database.CheckUserExist(username)) {
			request.setAttribute("username_err", "Username taken");
			forward = "/signup.jsp";
			check = false;
		}
		if (password == "") {
			request.setAttribute("password_err", "Please enter a password");
			forward = "/signup.jsp";
			check = false;
		}
		if (email == "") {
			request.setAttribute("email_err", "Please enter your email");
			forward = "/signup.jsp";
			check = false;
		} else {
			if (!email.contains("usc")) {
				request.setAttribute("usc_err", "Please use your USC email");
				forward = "/signup.jsp";
				check = false;
			}
		}
		if (url == "") {
			request.setAttribute("url_err", "Please enter a URL for your profile picture");
			forward = "/signup.jsp";
			check = false;
		}
					
		if (check) {
			database.AddUser(username, firstName, lastName, password,email,url);
					
			try {

				User u = database.getUser(username);
				String profilePic = u.getPicURL();
//							
				//output result
				String page = "joinGame.jsp?username="+username+"&url="+profilePic;				
				RequestDispatcher dispatcher = request.getRequestDispatcher(page);
							
				if (dispatcher != null){
					dispatcher.forward(request, response);
				}
				} catch (Exception e) {
					System.err.println(e.getMessage());
				}
		}
		else {
			RequestDispatcher dispatcher = request.getRequestDispatcher(forward);
			dispatcher.forward(request, response);
		}
		
	}

}
