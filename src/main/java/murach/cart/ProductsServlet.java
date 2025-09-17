package murach.cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.*;

@WebServlet({"/", "/loadProducts"})
public class ProductsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<Product> list = readProducts("/WEB-INF/cart/products.txt");
        req.setAttribute("products", list);
        req.getRequestDispatcher("/cart/index.jsp").forward(req, resp);
    }

    private List<Product> readProducts(String path) throws IOException {
        List<Product> list = new ArrayList<>();
        try (InputStream in = getServletContext().getResourceAsStream(path);
             BufferedReader br = new BufferedReader(new InputStreamReader(in, StandardCharsets.UTF_8))) {
            String line;
            while ((line = br.readLine()) != null) {
                // code|description|price
                String[] a = line.split("\\|");
                if (a.length < 3) continue;
                Product p = new Product(a[0].trim(), a[1].trim(), Double.parseDouble(a[2].trim()));
                list.add(p);
            }
        }
        return list;
    }
}
