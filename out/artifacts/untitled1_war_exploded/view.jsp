<%--
  Created by IntelliJ IDEA.
  User: iot29
  Date: 2022-08-19
  Time: 오후 4:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
</head>
<body>

<%
  //mariaDB 준비
  Class.forName("org.mariadb.jdbc.Driver");
  System.out.println("mariadb 사용가능");

  // mariaDB 연결
  Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.1.216:3306/shop_db", "shopManager","1234");
  System.out.println(conn + "<-- conn");

  // 쿼리
  PreparedStatement stmt = conn.prepareStatement("select * from user");
  System.out.println(stmt + "<-- stmt");

  // 쿼리 실행
  ResultSet rs = stmt.executeQuery();

%>
<table border="1">
  <tr>
    <td>아이디</td>
    <td>비밀번호</td>
    <td>이름</td>
  </tr>

  <%
    while(rs.next()){
  %>
  <tr>
    <td><%=rs.getString("u_id") %></td>
    <td><%=rs.getString("u_pw") %></td>
    <td><%=rs.getString("u_name") %></td>
  </tr>

  <%
    }
  %>
</table>

</body>
</html>