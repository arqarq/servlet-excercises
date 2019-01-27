package pl.sdacademy;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

@WebServlet(name = "DownloadApp", value = "/download")
public class DownloadApp extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter writer = response.getWriter();
        writer.println("<!DOCTYPE html>\n" +
                "<html lang=\"en\">\n" +
                "<head>\n" +
                "    <meta charset=\"UTF-8\">\n" +
                "    <title>SDA - Download servlet</title>\n" +
                "</head>\n" +
                "<body>\n" +
                "<p>File name to download:</p>\n" +
                "<form method=\"post\" action=\"download\">\n" +
                "    <label>\n" +
                "        <input name=\"what\" type=\"text\">\n" +
                "    </label>\n" +
                "    <input type=\"submit\" value=\"Download\">\n" +
                "</form>\n" +
                "</body>\n" +
                "</html>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String what = request.getParameter("what");

        if (StringUtils.isBlank(what)) {
            response.getWriter().println("<html>" +
                    "<body>" +
                    "<p>Nothing given thus no results</p>" +
                    "<a href=\"download\">Back</a>" +
                    "</body>" +
                    "</html>");
            return;
        }

        ServletContext servletContext = getServletContext();
        InputStream inputStream = servletContext.getResourceAsStream("/" + what);
        if (inputStream == null) {
            response.getWriter().println("<html>" +
                    "<body>" +
                    "<p>File not available to download: " + what + "</p>" +
                    "<a href=\"download\">Back</a>" +
                    "</body>" +
                    "</html>");
            return;
        }

        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + what + "\"");

/*        ServletOutputStream responseOutputStream = response.getOutputStream();
        byte[] buffer = new byte[8 * 1024];
        int bytesRead;
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            responseOutputStream.write(buffer, 0, bytesRead);
        }
        responseOutputStream.flush();
        responseOutputStream.close();*/
        try (ServletOutputStream responseOutputStream = response.getOutputStream()) {
            IOUtils.copy(inputStream, responseOutputStream);
        }
    }
}
