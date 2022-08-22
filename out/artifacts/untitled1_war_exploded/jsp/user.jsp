<%--
  Created by IntelliJ IDEA.
  User: iot29
  Date: 2022-08-19
  Time: 오후 4:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%
  String send_id = request.getParameter("send_id");
  System.out.println(send_id + "<- send_id");

  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;

  String dbid = null;
  String dbpw = null;
  String dblevel = null;
  String dbname = null;
  String dbemail = null;
  String dbphone = null;
  String dbaddr = null;



  Class.forName("com.mysql.jdbc.Driver");

  String jdbcDriver = "jdbc:mysql://localhost:3306/db07pcu?" +
          "useUnicode=true&characterEncoding=euckr";
  String dbUser = "dbid07pcu";
  String dbPass = "dbpw07pcu";
  conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);


  pstmt = conn.prepareStatement("select * from tb_user where u_id=?");

  pstmt.setString(1, send_id);
  out.println(pstmt+ "<-pstmt");

  rs = pstmt.executeQuery();

  if(rs.next()){


    dbid = rs.getString("u_id");
    dbpw = rs.getString("u_pw");
    dblevel = rs.getString("u_level");
    dbname = rs.getString("u_name");
    dbemail = rs.getString("u_email");
    dbphone = rs.getString("u_phone");
    dbaddr = rs.getString("u_addr");

  }
  rs.close();
  pstmt.close();
  conn.close();
%>
수정화면 시작 <br><br>

<form action="<%= request.getContextPath() %>/userupdate/user_update_pro.jsp" method="post">
  <table border="1">
    <tr>
      <td>아이디</td>
      <td><input type="text" name="u_id" size="20" value="<%= dbid %>" readonly></td>
    <tr>
    <tr>
      <td>암호</td>
      <td><input type="text" name="u_pw" size="20" value="<%= dbpw %>"></td>
    <tr>
    <tr>
      <td>권한</td>
      <td><input type="text" name="u_level" size="20" value="<%= dblevel %>"></td>
    <tr>
    <tr>
      <td>이름</td>
      <td><input type="text" name="u_name" size="20" value="<%= dbname %>"></td>
    <tr>
    <tr>
      <td>이메일</td>
      <td><input type="text" name="u_email" size="20" value="<%= dbemail %>"></td>
    <tr>
    <tr>
      <td>이메일</td>
      <td><input type="text" name="u_phone" size="20" value="<%= dbphone %>"></td>
    <tr>
    <tr>
      <td>이메일</td>
      <td><input type="text" name="u_addr" size="20" value="<%= dbaddr %>"></td>
    <tr>
    <tr>
      <td colspan="4"><input type="submit" value="회원수정버튼"></td>
    </tr>
  </table>
</form>