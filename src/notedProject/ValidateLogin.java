package notedProject;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ValidateLogin
 */
@WebServlet("/ValidateLogin")
public class ValidateLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ValidateLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("loginUsername");
		String password =request.getParameter("loginPassword") ;
		String forward = "";
		HttpSession session = request.getSession(false);
		LoadDatabase database = (LoadDatabase) request.getSession(false).getAttribute("database");
		boolean check = true;
		
		boolean logincheck = database.CheckLogin(username, password);
		if (username == "") {
    		request.setAttribute("name_err", "Please enter Username");
    		forward = "/login.jsp";
    		check = false;
    	}
		if (password == "") {
    		request.setAttribute("password_err", "Please enter Password");
    		forward = "/login.jsp";
    		check = false;
    	}
		if (username != "" && password != "" && !logincheck) {
			forward = "/login.jsp";
			request.setAttribute("name_err", "Login failed");
			check = false;
		}
		if (check) {
			session.setAttribute("currentUser", username.toLowerCase());
			
			// Direct to empty search result page 
			String query = "intitle:";
			
			try {
//				BookResult bResult = new BookResult();
//				Volumes volumes = bResult.getSearchResult(query);
				
				//output result
				String page = "joinGame.jsp";
//				session.setAttribute("result", volumes);
				
//				System.out.println(volumes.getTotalItems());					
				RequestDispatcher dispatcher = request.getRequestDispatcher(page);
				
				if (dispatcher != null){
					dispatcher.forward(request, response);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.err.println(e.getMessage());
			}
		}
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(forward);
		dispatch.forward(request,response);
	}

}
