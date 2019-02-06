package pl.sdacademy.registration.util;

import javax.servlet.*;
import java.io.IOException;

//@WebFilter(filterName = "WebFilterUTF8", value = "/*")
//public class WebFilterUTF8 extends HttpFilter {
//    @Override
//    protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
//            throws IOException, ServletException {
////        req.setCharacterEncoding("utf-8");
////        resp.setContentType("text/html;charset=utf-8");
//        chain.doFilter(request, response);
//    }
public class WebFilterUTF8 implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
//        req.setCharacterEncoding("utf-8");
//        resp.setContentType("text/html;charset=utf-8");
        chain.doFilter(request, response);
    }
}
