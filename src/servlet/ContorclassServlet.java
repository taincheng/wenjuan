package servlet;

import DAO.ClassesDAO;
import bean.Classes;
import bean.User;
import util.DateUtil;
import util.Page;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

public class ContorclassServlet extends BaseBackServlet {
    /*
    添加新的课题
     */
    public String addNewclass(HttpServletRequest request, HttpServletResponse response, Page page){
        String dckt = request.getParameter("dckt");
        int dcsj = Integer.parseInt(request.getParameter("dcsj"));
        String dcjj = request.getParameter("dcjj");

        classes.setClassname(dckt);
        classes.setClasstime(dcsj);
        classes.setIntroduction(dcjj);
        classes.setAddtime(new Date());
        classes.setIsuse(0);
        classesDAO.add(classes);
        return "addNewclass.jsp";
    }
    /*
    查看classes
     */
    public String diaoca(HttpServletRequest request, HttpServletResponse response, Page page){
        ArrayList<Classes> items = classesDAO.getList(page.getStart(),page.getCount());
        int Total = classesDAO.getTotal();
        page.setTotal(Total);
        request.setAttribute("items",items);
        request.setAttribute("page",page);
        return "dioaca.jsp";
    }
    /*
    删除class
     */
    public String delete(HttpServletRequest request, HttpServletResponse response,Page page){
        int id = Integer.parseInt(request.getParameter("classid"));
        classesDAO.delete(id);
        int page_start = Integer.parseInt(request.getParameter("page.start"));
        System.out.println(page_start);
        int Total = classesDAO.getTotal();
        if(Total <= page_start) page_start -= 5;
        ArrayList<Classes> items = classesDAO.getList(page_start,5);
        page.setTotal(Total);
        request.setAttribute("items",items);
        request.setAttribute("page",page);
        return "dioaca.jsp";
    }
    /*
    停用或启用
     */
    public String isuse(HttpServletRequest request, HttpServletResponse response,Page page){
        int id = Integer.parseInt(request.getParameter("classid"));
        int isuse = Integer.parseInt(request.getParameter("isuse"));
        isuse = classesDAO.isuse(id,isuse);
        return diaoca(request,response,page);
    }
    /*
    编辑class
     */
    public String edit(HttpServletRequest request, HttpServletResponse response, Page page){
        int id = Integer.parseInt(request.getParameter("id"));
        String classname = request.getParameter("kcmc");
        int classtime = Integer.parseInt(request.getParameter("kcsj"));
        String introduction = request.getParameter("kcjj");
        classesDAO.edit(id,classname,classtime,introduction);
        diaoca(request,response,page);
        return "%success";
    }
    /*
    查看class
     */

}
