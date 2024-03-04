<%@page import="mvjsp.board.model.Board"%>
<%@page import="mvjsp.board.dao.BoardDao"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="mvjsp.jdbc.connection.ConnectionProvider" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<%
    // 세션에서 사용자 아이디를 가져옴
    String memberId = (String) session.getAttribute("MEMBERID");

    // 로그인되어 있지 않은 경우 로그인 페이지로 이동
    if (memberId == null) {
        response.sendRedirect("sessionLoginForm.jsp");
        return;
    }

    // 데이터베이스 연결
    Connection conn = ConnectionProvider.getConnection();

    // 글 번호 값 얻기, 주어지지 않았으면 0으로 설정
    String tmp = request.getParameter("num");
    int num = (tmp != null && tmp.length() > 0) ? Integer.parseInt(tmp) : 0;

    // 새 글쓰기 모드를 가정하고 변수 초기값 설정
    String writer = "";
    String title = "";
    String content = "";
    String action = "insert.jsp";

    // 글 번호가 주어졌으면, 글 수정 모드
    if (num > 0) {
        BoardDao dao = BoardDao.getInstance();
        Board board = dao.selectOne(conn, num, false);

        // 글 작성자와 현재 로그인한 사용자가 같은지 확인
        if (!board.getWriter().equals(memberId)) {
            // 접근 권한이 없는 경우 윈도우 팝업을 통해 경고 메시지 표시
%>
            <script>
                alert('글을 수정할 권한이 없습니다.');
                history.back();
            </script>
<%
            return;
        }

        // 글 데이터를 변수에 저장
        writer = board.getWriter();
        title = board.getTitle();
        content = board.getContent();

        // 글 수정 모드일 때는 저장 버튼을 누르면 UPDATE 실행
        action = "update.jsp?num=" + num;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        table { width:680px; text-align:center; }
        th    { width:100px; background-color:cyan; }
        input[type=text], textarea { width:100%; }
    </style>
</head>
<body>

<form method="post" action="<%=action%>">
    <table>
        <tr>
            <th>제목</th>
            <td><input type="text" name="title"  maxlength="80"
                       value="<%=title%>"></td>
        </tr>
        <tr>
            <th>작성자</th>
            <td><input type="text" name="writer" maxlength="20"
                       value="<%=writer%>"></td>
        </tr>
        <tr>
            <th>내용</th>
            <td><textarea name="content" rows="10"><%=content%></textarea></td>
        </tr>
    </table>

    <br>
    <input type="submit" value="저장">
    <input type="button" value="취소" onclick="history.back()">
</form>

</body>
</html>
