package pl.sdacademy.articles;

import java.util.Arrays;
import java.util.Collection;

public class ArticleServices {
    public static Article noArticle = new Article(0L, "no product");
    private Collection<Article> availableArticles = Arrays.asList(
            new Article(1L, "Piwo"),
            new Article(2L, "Piwo2"),
            new Article(3L, "Piwo3"),
            new Article(4L, "Piwo4"));

    public Collection<Article> getAvailableArticles() {
        return availableArticles;
    }
}
