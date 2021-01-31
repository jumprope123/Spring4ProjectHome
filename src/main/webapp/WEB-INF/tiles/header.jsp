<%@ page pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<header class="row">
    <div class="col-6">
        <h1><a href="/index" class="colblack">Lorem Ipsum</a></h1>
    </div>
    <div class="col-6 text-right">
        <h1>
            <c:if test="${empty UID}">
            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#loginmodal">로그인</button>
                <button type="button" class="btn btn-primary" id="join2btn">회원가입</button>
            </c:if>
            <c:if test="${not empty UID}">
            <button type="button" class="btn btn-dark" id="logoutbtn">로그아웃</button>
            </c:if>
        </h1>
    </div>
</header>
<nav class="nav navbar-expand navbar-dark bg-dark">
    <ul class="nav navbar-nav nav-fill w-100">
        <li class="nav-item"><a class="nav-link" href="/intro">프로젝트 소개</a></li>
        <%--로그인이 안되었을때는 회원가입 클릭가능, 로그인이 되었을땐 비활성화--%>
        <c:if test="${empty UID}">
        <li class="nav-item"><a class="nav-link" href="/join/agree">회원가입</a></li>
        </c:if>
        <c:if test="${not empty UID}">
            <li class="nav-item"><a class="nav-link disabled" href="/join/agree">회원가입</a></li>
        </c:if>

        <li class="nav-item"><a class="nav-link" href="/board/list?cp=1">게시판</a></li>
        <li class="nav-item"><a class="nav-link" href="/pds/list">자료실</a></li>
        <li class="nav-item"><a class="nav-link" href="/gallery/list">갤러리</a></li>
        <li class="nav-item"><a class="nav-link" href="/admin">관리자</a></li>
    </ul>
</nav>