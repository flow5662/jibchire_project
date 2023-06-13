package svc;

public class Bachi_categoryService {
    public String getCategory(String category) throws Exception {
        String viewName;
        if ("aircon-sigong".equals(category)) {
            viewName = "/bachi/bachi_match_cate.jsp?category=aircon-sigong";
        } else {
            viewName = "/bachi/bachi_match.jsp";
        }
        return viewName;
    }
}
