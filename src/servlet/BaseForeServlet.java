package servlet;

import DAO.UserDAO;
import bean.User;
import util.Page;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Method;

public class BaseForeServlet extends HttpServlet {
    protected User user = new User();
    protected UserDAO userDAO = new UserDAO();

    public void service(HttpServletRequest request, HttpServletResponse response) {
        try {

            int start = 0;
            int count = 10;
            try {
                start = Integer.parseInt(request.getParameter("page.start"));
            } catch (Exception e) {

            }

            try {
                count = Integer.parseInt(request.getParameter("page.count"));
            } catch (Exception e) {
            }

            Page page = new Page(start, count);

            String method = (String) request.getAttribute("method");

            Method m = null;
            String redirect = null;
//            int personid = userDAO.getPersonID(request.getParameter("username"));
//            //判断是否为管理员
            m = this.getClass().getMethod(method, javax.servlet.http.HttpServletRequest.class,
                    javax.servlet.http.HttpServletResponse.class,Page.class);
            redirect = m.invoke(this, request, response,page).toString();

            if (redirect.startsWith("@"))
                response.sendRedirect(redirect.substring(1));
            else if (redirect.startsWith("%"))
                response.getWriter().print(redirect.substring(1));
            else
                request.getRequestDispatcher(redirect).forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}
