package pl.sdacademy;

import pl.sdacademy.articles.Article;
import pl.sdacademy.articles.ArticleServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collection;
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
        long quantity = Long.parseLong(request.getParameter("quantity"));
        long articleId = Long.parseLong(request.getParameter("articleId"));
        String productName = new ArticleServices().getAvailableArticles().stream()
                .filter(article -> article.getId() == articleId)
                .findFirst()
                .orElseGet(() -> ArticleServices.noArticle)
                .getName();
        System.out.println(productName + " x " + quantity);
    }
}
