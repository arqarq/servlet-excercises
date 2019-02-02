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
        response.getWriter().println("<html>" +
                "<style>\n" +
                "    table, td, th {\n" +
                "        padding: 3px;\n" +
                "    }\n" +
                "</style>" +
                "<body>" +
                "<table border=\"1\" style=\"border-collapse: collapse\">" +
                "<caption>Basket content</caption>" +
                "<tbody><tr>" +
                "<th align=\"left\">product</th>" +
                "<th align=\"left\">qty</th>" +
//                "<th style=\"border: none\" border=\"0\"></th>" +
                showBoughtProductsAsHtmlRows(basket) +
                "</tr></tbody>" +
                "</table>" +
                "<br>" +
                "<a href=\"/shop\">Add another...</a>" +
                "</body></html>");
    }

    private String showBoughtProductsAsHtmlRows(Map<Long, BigDecimal> basket) {
        return basket.entrySet().stream()
                .map(entry -> {
                    BigDecimal quantityBought = entry.getValue();
                    return "<tr><td align=\"left\">" +
                            availableProducts.stream()
                                    .filter(article -> article.getId().equals(entry.getKey()))
                                    .findFirst()
                                    .orElseGet(() -> ArticleServices.noArticle)
                                    .getName() +
                            "</td><td align=\"left\">" +
                            quantityBought +
                            "</td><td align=\"left\">" +
                            (quantityBought.compareTo(BigDecimal.ONE) == 0 ? "pc." : "pcs.") +
                            "</td></tr>";
                })
                .collect(Collectors.joining());
    }
}
