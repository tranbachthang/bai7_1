package murach.cart;

import jakarta.servlet.ServletContext;
import java.io.*;
import java.nio.charset.StandardCharsets;

public class ProductDB {
    public static Product findByCode(String code, ServletContext ctx) {
        try (InputStream in = ctx.getResourceAsStream("/WEB-INF/cart/products.txt");
             BufferedReader br = new BufferedReader(new InputStreamReader(in, StandardCharsets.UTF_8))) {
            for (String line; (line = br.readLine()) != null; ) {
                String[] a = line.split("\\|");
                if (a.length >= 3 && a[0].trim().equalsIgnoreCase(code)) {
                    return new Product(a[0].trim(), a[1].trim(), Double.parseDouble(a[2].trim()));
                }
            }
        } catch (Exception ignored) {}
        return null;
    }
}
