<%@page import="mvjsp.board.dao.BoardDao"%>
<%@page import="mvjsp.jdbc.connection.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<%
Connection conn = ConnectionProvider.getConnection();
// 지정된 글 번호 얻기
int num = Integer.parseInt(request.getParameter("num"));

String memberId = (String) session.getAttribute("MEMBERID");
if (memberId == null) {
	response.sendRedirect("sessionLoginForm.jsp");
}
BoardDao dao = BoardDao.getInstance();
dao.delete(conn, num);
%>

         <script>
             alert('삭제되었습니다.');
             location.href="blist.jsp";
         </script>
         
<%
// 목록보기 화면으로 돌아감
//response.sendRedirect("list.jsp");
%>