package servlet;

import bean.User;
import util.Page;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ForeServlet extends BaseForeServlet {
    public String login(HttpServletRequest request, HttpServletResponse response, Page page) throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = userDAO.get(username,password);
        if(null == user){
            return "%no";
        }
        request.getSession().setAttribute("user",user);
        return "%yes";
    }
    public String register(HttpServletRequest request, HttpServletResponse response,Page page){
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean ishaveUser = userDAO.isExist(username);
        if(!ishaveUser){
            user.setUsername(username);
            user.setPassword(password);
            user.setPersonID(0);
            userDAO.add(user);
            request.setAttribute("msg","注册成功");
            return "@registerSuccess.jsp";
        }else{
            request.setAttribute("msg","用户已经存在");
            return "register.jsp";
        }
    }
    public String logout(HttpServletRequest request,HttpServletResponse response,Page page){
        request.getSession().removeAttribute("user");
        return "@login.jsp";
    }
}
