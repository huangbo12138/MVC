package org.csu.mypetstore.web.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import org.csu.mypetstore.service.AccountService;

@WebServlet(name = "usernameIsExistServlet")
public class usernameIsExitServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            response.setContentType("text/xml");
            PrintWriter printWriter =response.getWriter();
            AccountService accountService=new AccountService();

            String username=request.getParameter("username");
          if(accountService.usernameIsExist(username)){
                printWriter.println("<info><result>Exist</result></info>");
            }
            else{
                printWriter.println("<info><result>NotExist</result></info>");
            }
            printWriter.flush();
            printWriter.close();
        }

}
