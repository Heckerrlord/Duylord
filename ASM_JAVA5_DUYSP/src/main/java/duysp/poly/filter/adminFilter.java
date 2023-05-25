package duysp.poly.filter;

import java.io.IOException;

import duysp.poly.constant.SessionLG;
import duysp.poly.model.Users;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebFilter("/admin/*")
public class adminFilter implements Filter{

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) arg0;
        HttpServletResponse res = (HttpServletResponse) arg1;
        HttpSession session = req.getSession();
        Users admin = (Users) session.getAttribute(SessionLG.CURRENT_USER);

        if (admin == null) {
            session.setAttribute("mes", "Vui lòng đăng nhập");
            res.sendRedirect("http://localhost:8080/login");
        }else  if (admin.getRole() == false) {
            session.setAttribute("mes", "Vui lòng đăng nhập với tài khoản admin");
            res.sendRedirect("http://localhost:8080/login");
        } else {
        	arg2.doFilter(req, res);
        }
		
	}

}
