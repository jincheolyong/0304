<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>기업형 웹 페이지</title>
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <script src="https://kit.fontawesome.com/c47106c6a7.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/style.css">
    <script src="js/ie.js"></script>
    <script>
    function toggleLoginButton() {
        var loginButton = document.getElementById('loginButton');
        var joinButton = document.getElementById('joinButton');
        
        <% if (session.getAttribute("MEMBERID") != null && !session.getAttribute("MEMBERID").equals("")) { %>
            // 세션에 사용자 정보가 있는 경우
            // 로그아웃으로 버튼 텍스트 변경 및 링크 수정
            loginButton.innerHTML = 'Logout';
            loginButton.onclick = logout; // onclick 속성에 logout 함수 할당
            joinButton.style.display = 'none'; // join 버튼 숨기기
        <% } else { %>
            // 세션에 사용자 정보가 없는 경우
            // 로그인으로 버튼 텍스트 변경 및 링크 수정
            loginButton.innerHTML = 'Login';
            loginButton.href = 'sessionLoginForm.jsp'; // 로그인 페이지로 이동
        <% } %>
    }

    // 페이지 로드 시 toggleLoginButton 함수 호출하여 초기 버튼 설정
    window.onload = toggleLoginButton;

    function logout() {
        // 서버에 로그아웃 요청을 보내는 코드
        // 여기서는 세션 정보를 삭제하는 방식으로 구현
        fetch('sessionLogout.jsp') // 로그아웃 처리를 하는 서버의 URL을 넣어주세요
            .then(response => {
                if (response.ok) {
                    // 성공적으로 로그아웃되면 페이지를 새로고침
                    window.location.reload();
                } else {
                    console.error('로그아웃 실패');
                }
            })
            .catch(error => console.error('오류 발생:', error));
    }
</script>

</head>

<body>

    <header>
        <div class="inner">
            <h1><a href="index.jsp">DCODLAB</a></h1>

            <ul id="gnb">
                <li><a href="#">DEPARTMENT</a></li>
                <li><a href="#">GALLERY</a></li>
                <li><a href="#">YOUTUBE</a></li>
                <li><a href="#">COMMUNITY</a></li>
                <li><a href="blist.jsp">게시판</a></li>
            </ul>

            <ul class="util">
                <li><a href="#">Contact</a></li>
                <li><a href="#">Help</a></li>
                <li><a id="loginButton" href="javascript:logout();">Login</a></li>
                <li><a id="joinButton" href="memberForm.jsp">Join</a></li>
                <li><a href="list.jsp">Admin</a></li>
            </ul>
        </div>
    </header>



    <figure>
        <video src="img/visual.mp4" autoplay muted loop></video>
        <div class="inner">
            <h1>INNOVATION</h1>
            <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. <br>
                Id praesentium molestias similique quaerat magni facere in a? Adipisci, possimus reprehenderit!</p>
            <a href="#">view detail</a>
        </div>
    </figure>

    <section>
        <div class="inner">
            <h1>RECENT NEWS</h1>
            <div class="wrap">
                <article>
                    <div class="pic">
                        <img src="img/news1.jpg" alt="1번째 콘텐츠 이미지">
                    </div>
                    <h2><a href="#">Lorem ipsum dolor sit.</a></h2>
                    <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Vitae minus, eaque corrupti vero ad
                        maiores!</p>
                </article>

                <article>
                    <div class="pic">
                        <img src="img/news2.jpg" alt="2번째 콘텐츠 이미지">
                    </div>
                    <h2><a href="#">Lorem ipsum dolor sit.</a></h2>
                    <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Vitae minus, eaque corrupti vero ad
                        maiores!</p>
                </article>

                <article>
                    <div class="pic">
                        <img src="img/news3.jpg" alt="3번째 콘텐츠 이미지">
                    </div>
                    <h2><a href="#">Lorem ipsum dolor sit.</a></h2>
                    <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Vitae minus, eaque corrupti vero ad
                        maiores!</p>
                </article>

                <article>
                    <div class="pic">
                        <img src="img/news4.jpg" alt="4번째 콘텐츠 이미지">
                    </div>
                    <h2><a href="#">Lorem ipsum dolor sit.</a></h2>
                    <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Vitae minus, eaque corrupti vero ad
                        maiores!</p>
                </article>
            </div>
        </div>
    </section>

    <footer>
        <div class="inner">
            <div class="upper">
                <h1>DCODELAB</h1>
                <ul>
                    <li><a href="#">Policy</a></li>
                    <li><a href="#">Terms</a></li>
                    <li><a href="#">Family Site</a></li>
                    <li><a href="#">Sitemap</a></li>
                </ul>
            </div>

            <div class="lower">
                <address>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Quas, facere.<br>
                    TEL : 031-111-1234 C.P : 010-1234-5678
                </address>
                <p>
                    2020 DOCDELAB &copy; copyright all right reserved.
                </p>
            </div>
        </div>
    </footer>

</body>
</html>
