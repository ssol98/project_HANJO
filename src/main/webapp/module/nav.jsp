<%@ page import="com.ezen.index.service.ItemService" %>
<%@ page import="com.ezen.index.service.ItemServiceImpl" %>
<%@ page import="com.ezen.index.dto.Category" %>
<%@ page import="java.util.List" %><%--

    Nav bar 모듈 ( HOME, ALL, SNEAKERS ... )

--%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    ItemService itemService = new ItemServiceImpl();
    List<Category> categoryList = itemService.categoryList();
    request.setAttribute("categoryList", categoryList);
%>

<nav>
    <a href="/" target="">
        <div class=""> HOME </div>
    </a>
    <a href="/" target="">
        <div class=""> ALL </div>
    </a>
    <a href="/category/sneakers.jsp?categoryId=10">
        <div class=""> SNEAKERS </div>  <!-- cate_num = 10 -->
    </a>
    <a href="/category/derby.jsp?categoryId=20">
        <div class=""> DERBY </div> <!-- cate_num = 20 -->
    </a>
    <a href="/category/loafer.jsp?categoryId=30">
        <div class=""> LOAFER </div> <!-- cate_num = 30 -->
    </a>
    <a href="/board/board.jsp" target="">
        <div class=""> BOARD </div>
    </a>
</nav>