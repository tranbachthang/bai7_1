package murach.cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        Cart cart = getOrCreateCart(req.getSession());
        req.setAttribute("cart", cart);
        req.getRequestDispatcher("/cart/cart.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession();
        Cart cart = getOrCreateCart(session);
        String action = req.getParameter("action");

        if (action == null) action = "view";

        switch (action) {
            case "add" -> {
                String code = req.getParameter("productCode");
                Product p = ProductDB.findByCode(code, getServletContext());
                if (p != null) cart.addItem(p);            // <- dùng Product
                req.getRequestDispatcher("/cart/cart.jsp").forward(req, resp);
            }
            case "update" -> {
                String code = req.getParameter("productCode");
                int qty = parseInt(req.getParameter("quantity"), 1);
                cart.updateItem(code, qty);
                req.getRequestDispatcher("/cart/cart.jsp").forward(req, resp);
            }
            case "remove" -> {
                String code = req.getParameter("productCode");
                cart.removeItem(code);
                req.getRequestDispatcher("/cart/cart.jsp").forward(req, resp);
            }
            default -> doGet(req, resp);
        }
    }

    private Cart getOrCreateCart(HttpSession session) {
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
        return cart;
    }

    private int parseInt(String s, int def) {
        try { return Integer.parseInt(s); } catch (Exception e) { return def; }
    }
}
