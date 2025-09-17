<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c"   uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn"  uri="jakarta.tags.functions" %>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Shopping Cart</title>
  <style>
    :root{
      --bg:#f5f7fb; --card:#ffffff; --brand:#0e938a; --brand-2:#12b3a8;
      --text:#0f172a; --muted:#6b7280; --ring:rgba(14,147,138,.25)
    }
    *{box-sizing:border-box}
    html,body{height:100%}
    body{
      margin:0; font-family:Inter,system-ui,Segoe UI,Roboto,Arial,sans-serif;
      color:var(--text); background:linear-gradient(180deg,#f7fbff, #eef5ff 30%, var(--bg) 100%);
      display:grid; place-items:center;
    }
    .shell{width:min(900px,90vw)}
    .card{
      background:var(--card); border-radius:20px; padding:34px 28px;
      box-shadow:0 10px 30px rgba(2,8,23,.06), 0 2px 10px rgba(2,8,23,.04);
      border:1px solid #eef2f7;
    }
    .title{
      font-weight:800; font-size:clamp(28px,4vw,38px); margin:0 0 10px;
      letter-spacing:.2px; background:linear-gradient(90deg,var(--brand),var(--brand-2));
      -webkit-background-clip:text; background-clip:text; color:transparent;
    }
    .subtitle{margin:0; color:var(--muted)}
    .actions{display:flex; gap:12px; margin-top:26px; flex-wrap:wrap}
    .btn{
      appearance:none; border:none; cursor:pointer; text-decoration:none; user-select:none;
      background:linear-gradient(135deg,var(--brand),var(--brand-2)); color:#fff;
      padding:12px 18px; border-radius:12px; font-weight:700; font-size:15px;
      box-shadow:0 6px 18px var(--ring); transition:transform .05s ease, box-shadow .2s ease;
    }
    .btn:hover{transform:translateY(-1px); box-shadow:0 10px 22px var(--ring)}
    .btn:active{transform:translateY(0)}
    .btn.outline{
      background:#fff; color:var(--brand); border:1px solid rgba(14,147,138,.35);
      box-shadow:none;
    }
    .meta{
      margin-top:18px; padding:10px 12px; border-radius:12px; background:#f8fafc; color:var(--muted);
      border:1px dashed #e5e7eb; font-size:14px;
    }
    .footer{
      margin-top:22px; color:#94a3b8; font-size:13px
    }
  </style>
</head>
<body>
  <main class="shell">
    <section class="card">
      <h1 class="title">Welcome to the Cart Demo</h1>
      <p class="subtitle">Bài 7 – Danh sách sản phẩm &amp; giỏ hàng.</p>

      <div class="actions">
        <a class="btn" href="${pageContext.request.contextPath}/loadProducts">Bắt đầu mua hàng</a>
        <a class="btn outline" href="${pageContext.request.contextPath}/cart">Xem giỏ hàng</a>
      </div>

      <div class="meta">
        Giỏ hàng hiện có
        <strong>${empty sessionScope.cart ? 0 : sessionScope.cart.items.size()}</strong>
        mặt hàng.
      </div>

      <div class="footer">© ${pageContext.servletContext.contextPath.replace('/','')} · Tomcat 11 · Jakarta EE</div>
    </section>
  </main>
</body>
</html>
    