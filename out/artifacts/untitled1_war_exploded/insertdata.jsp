<%--
  Created by IntelliJ IDEA.
  User: iot29
  Date: 2022-08-19
  Time: 오후 4:18
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>학생 정보 저장 완료</title>
</head>
<body>
<h1>학생 정보 저장 완료</h1>
<%
  // 작성한 값 받아오기
  int number = Integer.parseInt(request.getParameter("number"));
  String name = request.getParameter("name");
  String major = request.getParameter("major");

  // mariaDB 준비
  Class.forName("org.mariadb.jdbc.Driver");
  System.out.println("mariadb 사용가능");

  // mariaDB 연결
  Connection conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306 /test","root","1234");
  System.out.println(conn + "<-- conn");

  // 쿼리
  PreparedStatement stmt = conn.prepareStatement("insert into 테이블명(컬럼, 컬럼, 컬럼) values(?,?,?)"); // ?표현식 : 변수자리
  stmt.setInt(1, number);
  stmt.setString(2, name);
  stmt.setString(3, major);
  System.out.println(stmt + "<-- stmt");

  // 쿼리 실행
  stmt.executeUpdate();
  conn.close(); // DB 종료
%>
</body>
</html>