package pl.sdacademy.articles;

import java.math.BigDecimal;

public class Article {
    private Long id;
    private String name;
    private BigDecimal price;

    public Article(Long id, String name) {
        this.id = id;
        this.name = name;

//        Map<String, String> articles = new HashMap<>();
//        articles.keySet().stream()
//                .map(key -> "<option value=\"" + key + "\">" + articles.get(key) + "</option>")
//                .collect(Collectors.joining());
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }
}
