package murach.cart;

import java.io.Serializable;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

public class Cart implements Serializable {
    private final Map<String, LineItem> items = new LinkedHashMap<>();

    /** Thêm 1 sản phẩm vào giỏ (nếu đã có thì +1) */
    public void addItem(Product p) {
        if (p == null) return;
        String code = p.getCode();
        LineItem li = items.get(code);
        if (li == null) {
            items.put(code, new LineItem(p, 1));
        } else {
            li.increaseBy(1);
        }
    }

    /** Cập nhật số lượng; qty <= 0 thì xoá */
    public void updateItem(String code, int qty) {
        LineItem li = items.get(code);
        if (li == null) return;
        if (qty <= 0) items.remove(code);
        else li.setQuantity(qty);
    }

    public void removeItem(String code) { items.remove(code); }

    public Collection<LineItem> getItems() { return items.values(); }

    public boolean isEmpty() { return items.isEmpty(); }

    public double getTotal() {
        return items.values().stream().mapToDouble(LineItem::getTotal).sum();
    }
}
