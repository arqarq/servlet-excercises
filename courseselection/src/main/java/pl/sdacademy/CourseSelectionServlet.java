package pl.sdacademy;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

@WebServlet(name = "CourseSelectionServlet", value = "/courseSelection")
public class CourseSelectionServlet extends HttpServlet {
    private Map<String, Collection<String>> courses = new HashMap<>();

    public CourseSelectionServlet() {
        courses.put("PROGRAMMER", Arrays.asList("Java", "C#", "C++"));
        courses.put("TESTER", Arrays.asList("Selenium", "Ranorex"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String courseType = request.getParameter("courseType");

        courses.get(courseType);

        PrintWriter writer = response.getWriter();
        writer.println("<html>" +
                "<body>" +
                "<p>...selected course type: " + courseType + "</p>" +
                "<select>" +
                courses.get(courseType).stream()
                        .map(course -> "<option>" + course + "</option>")
                        .collect(Collectors.joining()) +
                "<select>" +
                "</body>" +
                "</html>");
    }
}
