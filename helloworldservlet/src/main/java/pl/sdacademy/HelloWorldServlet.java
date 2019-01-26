package pl.sdacademy;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;

@WebServlet(name = "HelloWorldServlet", value = "/helloWorld")
public class HelloWorldServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter writer = response.getWriter();
        writer.println("<html>" +
                "<head>" +
                "<title>Dynamiczna strona WWW</title>" +
                "</head>" +
                "<body>" +
                "<p>Dzisiaj jest " + LocalDateTime.now() + "</p>" +
                "</body>" +
                "</html>");
    }
}
