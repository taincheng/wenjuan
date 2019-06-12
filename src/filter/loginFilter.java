package filter;

import bean.User;
import org.apache.commons.lang.StringUtils;

import javax.security.auth.Subject;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class loginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        String contextPath = request.getServletContext().getContextPath();
        User user = (User) request.getSession().getAttribute("user");

        String uri = request.getRequestURI();
        uri = StringUtils.remove(uri, contextPath);
        /*
        展示通过jQuery对登录提示
         */
        filterChain.doFilter(request, response);
    }

    @Override
    public void destroy() {

    }
}
