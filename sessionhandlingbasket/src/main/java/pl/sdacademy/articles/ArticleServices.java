package pl.sdacademy.articles;

import java.util.Arrays;
import java.util.Collection;

public class ArticleServices {
    public static Article noArticle = new Article(0L, "no product");
    private Collection<Article> availableArticles = Arrays.asList(
            new Article(1L, "Piwo"),
            new Article(2L, "Chleb"),
            new Article(3L, "Mleko"),
            new Article(4L, "Sok pomarańczowy"));

    public Collection<Article> getAvailableArticles() {
        return availableArticles;
    }
}
