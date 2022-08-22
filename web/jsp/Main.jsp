<%--
  Created by IntelliJ IDEA.
  User: iot29
  Date: 2022-08-19
  Time: 오후 2:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>

<html>
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

  <!--Google Material Icons-->
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />


  <title>Title</title>
</head>
<body>
<jsp:include page="../header.jsp"/>

<div class="jumbotron">
  <div class="container">
    <h1 class="display-3">상품목록</h1>
  </div>
</div>
<%
  ProductRepository dao = ProductRepository.getInstance();
  ArrayList<Product> listOfProducts = dao.getAllProducts();
%>

<div class="container">
  <div class="row" align="center">
    <%
      for (int i = 0; i < listOfProducts.size(); i++) {
        Product product = listOfProducts.get(i);
    %>
    <div class="col-md-4">
      <h3><%=product.getPname()%></h3>
      <p><%=product.getDescription()%>
      <p><%=product.getUnitPrice()%>원
      <p><a href="./product.jsp?id=<%=product.getProductId()%>" class="btn btn-secondary" role="button"> 상세 정보 &raquo;</a>
    </div>
    <%
      }
    %>
  </div>
  <hr>
</div>
</div>

<jsp:include page="../footer.jsp"/>
</body>
</html>