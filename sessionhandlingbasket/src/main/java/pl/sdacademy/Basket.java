package pl.sdacademy;

import pl.sdacademy.articles.Article;
import pl.sdacademy.articles.ArticleServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.Map;
import java.util.stream.Collectors;

@WebServlet(name = "Basket", value = "/basket")
public class Basket extends HttpServlet {
    private Collection<Article> availableProducts = new ArticleServices().getAvailableArticles();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<Long, BigDecimal> basket = (Map<Long, BigDecimal>) request.getSession().getAttribute("selectedArticles");
        if (basket == null) {
            response.getWriter().println("<html><body>" +
                    "<p>Basket is empty</p>" +
                    "<br>" +
                    "<a href=\"/shop\">Add something...</a>" +
                    "</body></html>");
            return;
        }
        response.getWriter().println("<html><body>" +
                "<p>Basket content</p>" +
                "<table border=\"1\"><tbody>" +
                "<tr>" +
                "<th>Product</th>" +
                "<th>Quantity</th>" +
                "</tr>" +
                getShowProductsAsHtmlRows() +
                "</tbody></table>" +
                "<br>" +
                "<a href=\"/shop\">Add another...</a>" +
                "</body></html>");
    }

    private String getShowProductsAsHtmlRows() {
        return availableProducts.stream()
                .map(article -> "<tr><th>" + article.getName() + "</th><th>0</th></tr>")
                .collect(Collectors.joining());
    }
}
