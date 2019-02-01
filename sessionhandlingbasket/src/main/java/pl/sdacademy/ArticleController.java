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
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

@WebServlet(name = "ArticleController", value = "/")
public class ArticleController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Collection<Article> availableProducts = new ArticleServices().getAvailableArticles();

        response.getWriter().println("<!DOCTYPE html>\n" +
                "<html lang=\"en\">\n" +
                "<head>\n" +
                "    <meta charset=\"UTF-8\">\n" +
                "    <title>Shop</title>\n" +
                "</head>\n" +
                "<body>\n" +
                "<form method=\"post\">\n" +
                "    <label for=\"articleId\">Article:</label>\n" +
                "    <select id=\"articleId\" name=\"articleId\">\n" +
                availableProducts.stream()
                        .map(product -> "<option value=\"" + product.getId() + "\">" + product.getName() + "</option>")
                        .collect(Collectors.joining()) +
                "    </select>\n" +
                "    <br>\n" +
                "    <label for=\"quantity\">Quantity:</label>\n" +
                "    <input id=\"quantity\" max=\"10\" min=\"1\" name=\"quantity\" type=\"number\">\n" +
                "    <br>\n" +
                "    <input type=\"submit\" value=\"Add\">\n" +
                "    </form>\n" +
                "<br>\n" +
                "<a href=\"basket\">Go to koszyk</a>\n" +
                "</body>\n" +
                "</html>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long articleId = Long.parseLong(request.getParameter("quantity"));
        BigDecimal quantity = new BigDecimal(request.getParameter("articleId"));

        String productName = new ArticleServices().getAvailableArticles().stream()
                .filter(article -> article.getId() == articleId)
                .findFirst()
                .orElseGet(() -> ArticleServices.noArticle)
                .getName();
//        System.out.println(productName + " x " + quantity);

        Map<Long, BigDecimal> basket = (Map<Long, BigDecimal>) request.getSession().getAttribute("selectedArticles");
        if (basket == null) {
            basket = new HashMap<>();
            request.getSession().setAttribute("selectedArticles", basket);
        }
        basket.compute(articleId, (k, v) -> (v == null) ? quantity : v.add(quantity));

        response.getWriter().println("<html><body" +
                "<p>Article " + productName + " added to the basket</p>" +
                "<a href=\"/shop\">Add another...</a>" +
                "</body></html>");

        System.out.println("--- basket:");
        System.out.printf("    current product being added: %s/artId: %s%n", productName, articleId);
        basket.forEach((k, v) -> System.out.println("k (artId): " + k + " / v (ile): " + v));
//        System.out.println(basket);
    }
}
