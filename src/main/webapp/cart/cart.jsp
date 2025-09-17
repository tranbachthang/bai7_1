<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c"   uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your cart</title>
<style>
  body{font-family:system-ui,Arial;margin:24px}
  .wrap{max-width:900px}
  h1{color:#0b8a7d}
  table{width:100%;border-collapse:collapse}
  th,td{border:1px solid #e5e7eb;padding:10px}
  th{background:#eefbff;text-align:left}
  .btn{padding:6px 10px;border:1px solid #0b8a7d;border-radius:6px;background:#0b8a7d;color:#fff;cursor:pointer}
  .btn-outline{background:#fff;color:#0b8a7d}
</style>
</head>
<body>
<div class="wrap">
  <h1>Your cart</h1>

  <c:set var="cart" value="${sessionScope.cart}"/>
  <c:choose>
    <c:when test="${empty cart or empty cart.items}">
      Cart is empty.
    </c:when>
    <c:otherwise>
      <table>
        <thead>
          <tr>
            <th style="width:120px">Quantity</th>
            <th>Description</th>
            <th style="width:120px">Price</th>
            <th style="width:120px">Amount</th>
            <th style="width:140px"></th>
          </tr>
        </thead>
        <tbody>
        <c:forEach var="li" items="${cart.items}">
          <tr>
            <td>
              <form action="<c:url value='/cart'/>" method="post" style="display:flex;gap:6px">
                <input type="hidden" name="action" value="update"/>
                <input type="hidden" name="productCode" value="${li.product.code}"/>
                <input type="number" name="quantity" value="${li.quantity}" min="0" style="width:60px"/>
                <button class="btn btn-outline" type="submit">Update</button>
              </form>
            </td>
            <td>${li.product.description}</td>
            <td><fmt:formatNumber value="${li.product.price}" type="currency"/></td>
            <td><fmt:formatNumber value="${li.total}" type="currency"/></td>
            <td>
              <form action="<c:url value='/cart'/>" method="post">
                <input type="hidden" name="action" value="remove"/>
                <input type="hidden" name="productCode" value="${li.product.code}"/>
                <button class="btn btn-outline" type="submit">Remove Item</button>
              </form>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </c:otherwise>
  </c:choose>

  <div style="margin-top:16px;display:flex;gap:10px">
    <a class="btn btn-outline" href="<c:url value='/loadProducts'/>">Continue Shopping</a>
    <a class="btn" href="#">Checkout</a>
  </div>
</div>
</body>
</html>
