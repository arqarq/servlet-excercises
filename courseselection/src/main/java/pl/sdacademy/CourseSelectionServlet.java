package pl.sdacademy;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CourseSelectionServlet", value = "/courseSelection")
public class CourseSelectionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String courseType = request.getParameter("courseType");
        PrintWriter writer = response.getWriter();
        writer.println("<html>" +
                "<body>" +
                "<p>Selected course type: " + courseType + "</p>" +
                "</body>" +
                "</html>");
    }
}
