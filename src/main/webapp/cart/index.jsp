<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c"   uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"  %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>CD list</title>
  <style>
    body{font-family:system-ui,Arial;margin:24px}
    .wrap{max-width:900px}
    h1{color:#0b8a7d}
    table{width:100%;border-collapse:collapse}
    th,td{border:1px solid #e5e7eb;padding:10px}
    th{background:#eefbff;text-align:left}
    .btn{padding:6px 10px;border:1px solid #0b8a7d;border-radius:6px;background:#0b8a7d;color:#fff;cursor:pointer}
    .btn:hover{opacity:.9}
  </style>
</head>
<body>
<div class="wrap">
  <h1>CD list</h1>

  <table>
    <thead>
      <tr>
        <th>Description</th>
        <th style="width:120px">Price</th>
        <th style="width:130px"></th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="p" items="${products}">
      <tr>
        <td>${p.description}</td>
        <td><fmt:formatNumber value="${p.price}" type="currency"/></td>
        <td>
          <form action="<c:url value='/cart'/>" method="post">
            <input type="hidden" name="action" value="add"/>
            <input type="hidden" name="productCode" value="${p.code}"/>
            <button class="btn" type="submit">Add To Cart</button>
          </form>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
</body>
</html>
