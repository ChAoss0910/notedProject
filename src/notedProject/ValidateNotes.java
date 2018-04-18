package notedProject;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;



/**
 * Servlet implementation class ValidateNotes
 */
@MultipartConfig
@WebServlet("/ValidateNotes")
public class ValidateNotes extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private boolean isMultipart;
	    private int maxFileSize = 1024 * 1024 * 10;
	    private int maxMemSize = 100 * 1024;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	
	
//	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		String title = request.getParameter("notesTitle");
//		String course= request.getParameter("selectClass");
//		String date=request.getParameter("date");
//		String file=request.getParameter("uploadfile");
//		String tag=request.getParameter("tags");
//		PrintWriter out =  response.getWriter();
//		System.out.println(title);
//		System.out.println(course);
//		System.out.println(date);
//		System.out.println(file);
//		System.out.println(tag);
//		
//		if(title.equals("")||course.equals("Class")||date.equals("")||tag.equals("")) {
//			
//			out.print("none");
//			out.flush();
//			
//		}
////		if(file.equals(""))
////			out.println("none");
//		
//		out.close();
////		String forward="/homepage.jsp";
//		
////		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(forward);
////		dispatch.forward(request,response);
//		
//	}
	   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
        request.setCharacterEncoding("utf-8");  
        response.setCharacterEncoding("utf-8");  
        response.setContentType("text/html;charset=utf-8");//更改响应字符流使用的编码，还能告知浏览器用什么编码进行显示  
          
        
//        String title = request.getParameter("notesTitle");
//		String course= request.getParameter("selectClass");
//		String date=request.getParameter("date");
////		String file=request.getParameter("uploadfile");
//		String tag=request.getParameter("tags");
//		PrintWriter out =  response.getWriter();
//		System.out.println(title);
//		System.out.println(course);
//		System.out.println(date);
////		System.out.println(file);
//		System.out.println(tag);
         //ystem.out.println("Success!!!");
        // 检查是否有一个文件上传请求
        isMultipart = ServletFileUpload.isMultipartContent(request);
        String result = "";
        response.setContentType("text/html;charset=utf-8");
        if (!isMultipart) {
            result = "未获取到文件";
            response.getWriter().println(result);
            return;
        }
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // 文件大小的最大值将被存储在内存中
        factory.setSizeThreshold(maxMemSize);
        // Location to save data that is larger than maxMemSize.
        String path = "/Users/chenchaoyang/Desktop/file/result";
        factory.setRepository(new File(path));
        // System.out.println(path);
        // 创建一个新的文件上传处理程序
        ServletFileUpload upload = new ServletFileUpload(factory);
        // 允许上传的文件大小的最大值
        upload.setSizeMax(maxFileSize);
//        System.out.println("wtf?");
        try {
            // 解析请求，获取文件项
            List fileItems = upload.parseRequest(request);
            System.out.println(fileItems.size());
            // 处理上传的文件项
            Iterator i = fileItems.iterator();
            if(!i.hasNext())
            		System.out.println("bieba");
            while (i.hasNext()) {
            		System.out.println("in loop");
                FileItem fi = (FileItem) i.next();
                if (!fi.isFormField()) {
                    // 获取上传文件的参数
                		System.out.println("get Para");
                    String fieldName = fi.getFieldName();
                    String fileName = fi.getName();
                    String contentType = fi.getContentType();
                    boolean isInMemory = fi.isInMemory();
                    long sizeInBytes = fi.getSize();
                    // 写入文件
                    File file = new File(path + System.currentTimeMillis() / 1000 + ".txt");
                    fi.write(file);
                }
            }
            result = "上传成功";
            System.out.println("Success");
        } catch (Exception ex) {
            System.out.println("ex:" + ex.getMessage());
            System.out.println("No");
        }
 
        response.getWriter().println(result);
        
//        String title = request.getParameter("notesTitle");
//		String course= request.getParameter("selectClass");
//		String date=request.getParameter("date");
//		String file=request.getParameter("uploadfile");
//		String tag=request.getParameter("tags");
//		PrintWriter out =  response.getWriter();
//		System.out.println(title);
//		System.out.println(course);
//		System.out.println(date);
//		System.out.println(file);
//		System.out.println(tag);
         System.out.println("Success!!!");
//        request.setAttribute("result", "文件上传成功");  
        
    }  

}
