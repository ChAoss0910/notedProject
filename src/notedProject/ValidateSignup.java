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
		String username = request.getParameter("susername");
		String email = request.getParameter("email");
		String password = request.getParameter("spassword");
		String forward = "";
		
		InputStream jsonPath = (InputStream) getServletContext().getResourceAsStream("/database.json");
		String path = getServletContext().getRealPath("/database.json");
		LoadDatabase loadDatabase = new LoadDatabase(jsonPath, path);
		loadDatabase.writeData();
		HttpSession session = request.getSession();
		session.setAttribute("database", loadDatabase);
		
		LoadDatabase database = (LoadDatabase) request.getSession(false).getAttribute("database");
		// Sign up check
		boolean check = true;
		boolean logincheck = database.CheckLogin(username, password);
//		HttpSession session = request.getSession(false);
//		LoadDatabase database = (LoadDatabase) request.getSession(false).getAttribute("database");
		
//		boolean check = true;
		
		if (username == "") {
			request.setAttribute("name_err", "Please enter Username");
			forward = "/signup.jsp";
			check = false;
		} else if (database.CheckUserExist(username)) {
			request.setAttribute("name_err", "Username taken");
			forward = "/signup.jsp";
			check = false;
		}
		if (password == "") {
			request.setAttribute("password_err", "Please enter Password");
			forward = "/signup.jsp";
			check = false;
		}
					
		if (check) {
			database.AddUser(username, firstName, lastName, password,email);
//			session.setAttribute("currentUser", username.toLowerCase());
						
			// Direct to empty search result page 
			String query = "intitle:";
						
			try {
//				BookResult bResult = new BookResult();
//				Volumes volumes = bResult.getSearchResult(query);
//							
				//output result
				String page = "joinGame.jsp";
//				session.setAttribute("result", volumes);
							
//				System.out.println(volumes.getTotalItems());					
				RequestDispatcher dispatcher = request.getRequestDispatcher(page);
							
				if (dispatcher != null){
					dispatcher.forward(request, response);
				}
				} catch (Exception e) {
					System.err.println(e.getMessage());
				}
			}
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(forward);
		dispatch.forward(request,response);
	}

}
