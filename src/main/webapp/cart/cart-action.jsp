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

<%
    String action = request.getParameter("action");
    ArrayList<String> cartItemRemove = (ArrayList<String>) session.getAttribute("cartItems");

    if (action != null && cartItemRemove != null) {
        if (action.equals("removeSelected")) {
            String[] selectedItems = request.getParameterValues("selectedItems");
            if (selectedItems != null) {
                for (String selectedItem : selectedItems) {
                    cartItemRemove.remove(selectedItem);
                }
                session.setAttribute("cartItemRemove", cartItemRemove);
            }
        } else if (action.equals("removeAll")) {
            session.removeAttribute("cartItemRemove");
        }
    }
%>
<script>
    alert("장바구니를 업데이트했습니다.");
    history.back();
</script>