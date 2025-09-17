package murach.cart;

import java.io.Serializable;

public class LineItem implements Serializable {
    private Product product;
    private int quantity;

    public LineItem() {}

    public LineItem(Product product, int quantity) {
        this.product = product;
        this.quantity = Math.max(0, quantity);
    }

    public Product getProduct() { return product; }
    public void setProduct(Product product) { this.product = product; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = Math.max(0, quantity); }

    /** Tăng thêm n đơn vị (n có thể âm nếu muốn giảm) */
    public void increaseBy(int n) { this.quantity = Math.max(0, this.quantity + n); }

    public String getCode() { return (product == null) ? null : product.getCode(); }

    public double getTotal() {
        if (product == null) return 0.0;
        return product.getPrice() * quantity;
    }
}
