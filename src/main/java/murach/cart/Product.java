package murach.cart;
import java.util.Objects;

public class Product {
    private String code;
    private String description;
    private double price;

    public Product() {}

    public Product(String code, String description, double price) {
        this.code = code;
        this.description = description;
        this.price = price;
    }

    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    // Đồng nhất theo code (không phân biệt hoa/thường)
    @Override public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Product)) return false;
        Product p = (Product) o;
        return code != null && p.code != null
                && code.equalsIgnoreCase(p.code);
    }
    @Override public int hashCode() {
        return Objects.hash(code == null ? null : code.toLowerCase());
    }
    @Override public String toString() {
        return code + " - " + description + " ($" + price + ")";
    }
}
