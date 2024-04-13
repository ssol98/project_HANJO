<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>

<%
    String item = request.getParameter("item");
//    String size = request.getParameter("size");

    ArrayList<String> cartItems = (ArrayList<String>) session.getAttribute("cartItems");

    if (cartItems == null) {
        cartItems = new ArrayList<>();
    }
    cartItems.add(item);
//    cartItems.add(size);
    session.setAttribute("cartItems", cartItems);
%>

<script>
    alert("장바구니에 상품이 추가되었습니다.");
    history.back();
</script>
