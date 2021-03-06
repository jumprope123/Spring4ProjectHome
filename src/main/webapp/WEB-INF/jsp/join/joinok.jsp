<%@ page pageEncoding="UTF-8" %>
<div id="main">
    <div class="margin30">
        <h3><img src="/img/glyphicons_043_group.png" style="position: relative; top: -5px">회원가입</h3>
        <hr>
    </div>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><button type="button" class="btn btn-success btn-sm disabled">이용약관</button><i class="bi bi-chevron-right"></i></li>
            <li class="breadcrumb-item"><button type="button" class="btn btn-success btn-sm disabled">실명확인</button><i class="bi bi-chevron-right"></i></li>
            <li class="breadcrumb-item"><button type="button" class="btn btn-success btn-sm disabled">정보입력</button><i class="bi bi-chevron-right"></i></li>
            <li class="breadcrumb-item active"><button type="button" class="btn btn-success btn-sm disabled">가입완료</button></li>
        </ol>
    </nav>

    <div class="margin100">
        <h2 class="font-weight-bold">회원가입 완료</h2>
        <small class="text-muted">
            안전하고 편리한 홈페이지 이용을 위해 회원님의 아이디와
            비밀번호 관리에 주의해 주시기 바랍니다.
        </small>
        <hr>
    </div>
    <div class="jumbotron margin1050">
        <h1>회원 가입을 축하합니다!!</h1>
        <p class="margin30">게시판 글작성, 쇼핑몰 이용등의 일부 서비스는
            실명확인 후 이용하실 수 있습니다.<br>
            실명확인 후에도 가입하신 아이디는 변경할 수 없습니다.</p>
        <hr>
        <p>회원가입 이후 아이디와 비밀번호로 일반회원으로
            로그인 하셔서 추가 인적사항등을 등록해주시기 바랍니다.<br>
            Lorem Ipsum과 함께 즐거운 시간 되십시오</p>

        <p>이름 : ${mvo.name}</p>
        <p>아이디 : ${mvo.userid}</p>
        <p>가입일시 : ${mvo.regdate}</p>
    </div>
    <div class="text-center">
        <button type="button" id="go2index" class="btn btn-success"><i class="bi bi-house-fill" style="position: relative; top: -3px;"></i>&nbsp;메인으로 이동</button>
    </div>

</div><!--main-->