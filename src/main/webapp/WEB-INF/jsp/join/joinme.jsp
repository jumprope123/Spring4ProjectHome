<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script src="https://www.google.com/recaptcha/api.js"></script>


<div id="main">
    <div class="margin30">
        <h3><img src="/img/glyphicons_043_group.png" style="position: relative; top: -5px">회원가입</h3>
        <hr>
    </div>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><button type="button" class="btn btn-success btn-sm disabled">이용약관</button><i class="bi bi-chevron-right"></i></li>
            <li class="breadcrumb-item"><button type="button" class="btn btn-success btn-sm disabled">실명확인</button><i class="bi bi-chevron-right"></i></li>
            <li class="breadcrumb-item"><button type="button" class="btn btn-success btn-sm disabled active">정보입력</button><i class="bi bi-chevron-right"></i></li>
            <li class="breadcrumb-item"><button type="button" class="btn btn-light btn-sm disabled">가입완료</button></li>
        </ol>
    </nav>

    <div class="margin100">
        <h2 class="font-weight-bold">회원정보 입력</h2>
        <p><small class="text-muted">회원정보는 개인정보 취급방침에 따라 안전하게 보호되며, 회원님의 명백한 동의없이 공개 또는 제3자에게 제공되지 않습니다.</small></p>
        <hr>
    </div> <!-- 제목 -->
    <div class="bg-light card card-body margin1050">
        <div><h3 class="font-weight-bold margin30">일반회원</h3></div>
        <form name="joinfrm" id="joinfrm">
            <div class="row">
                <div class="col-11 offset-1">
                    <div class="form-group row">
                        <label for="name" class="col-form-label col-sm-2 text-right text-danger">이 름</label>
                        <input type="text" class="form-control border-danger col-sm-2" id="name" name="name" readonly value="${param.name}">
                    </div><!--이름-->
                    <div class="form-group row">
                        <label for="jumin1" class="col-form-label col-sm-2 text-right text-danger">주민등록번호</label>
                        <input type="text" class="form-control col-sm-2 border-danger" id="jumin1" name="jumin1" readonly value="${param.jumin1}">
                        <label class="col-form-label border-danger">&nbsp;&ndash;&nbsp;</label>
                        <input type="password" class="form-control col-sm-2 border-danger" id="jumin2" name="jumin2" readonly value="${param.jumin2}">
                    </div><!--주민번호-->
                    <div class="form-group row">
                        <label for="newuid" class="col-form-label col-sm-2 text-right text-danger">아이디</label>
                        <input type="text" class="form-control col-sm-4 border-danger" name="userid" id="newuid" required value="${mvo.userid}">
                        <span class="text-danger col-sm-6 " id="uidmsg">&nbsp;&nbsp;6~16 자의 영문 소문자, 숫자와 특수기호(_)만 사용할 수 있습니다.</span>
                    </div>
                    <div class="form-group row">
                        <label for="newpwd" class="col-form-label col-sm-2 text-right text-danger">비밀번호</label>
                        <input type="password" class="form-control col-sm-4 border-danger" id="newpwd" name="passwd" required>
                        <span class="text-danger col-sm-6 ">6~16 자의 영문 대소문자, 숫자 및 특수문자를 사용할 수 있습니다.</span>
                    </div>
                    <div class="form-group row">
                        <label for="repwd" class="col-form-label col-sm-2 text-right text-danger">비밀번호 확인</label>
                        <input type="password" class="form-control col-sm-4 border-danger" id="repwd" name="repwd" required>
                        <span class="text-danger col-sm-6 ">이전 항목에서 입력했던 비밀번호를 한번 더 입력하세요.</span>
                    </div><!--비밀번호 확인-->
                    <div class="form-group row">
                        <label for="zip1" class="col-form-label col-sm-2 text-right text-danger">우편번호</label>
                        <input type="text" class="form-control col-sm-1 border-danger" id="zip1" name="zip1" readonly value="${fn:split(mvo.zipcode,'-')[0]}">
                        <label class="col-form-label">&nbsp;-&nbsp;</label>
                        <input type="text" class="form-control col-sm-1 border-danger" id="zip2" name="zip2" readonly value="${fn:split(mvo.zipcode,'-')[1]}">
                        <span>&nbsp;&nbsp;</span>
                        <button type="button" class="btn btn-dark" data-toggle="modal" data-target="#zipmodal"><i class="bi bi-exclamation-circle-fill"></i> 우편번호 찾기</button>
                    </div><!--우편번호-->
                    <div class="form-group row">
                        <label for="addr1" class="col-form-label col-sm-2 text-right text-danger">주소</label>
                        <input type="text" class="form-control col-sm-3 border-danger" id="addr1" name="addr1" readonly  value="${mvo.addr1}">
                        <span>&nbsp;</span>
                        <input type="text" class="form-control col-sm-3 border-danger" id="addr2" name="addr2" required value="${mvo.addr2}">
                    </div><!--주소-->
                    <div class="form-group row">
                        <label for="email1" class="col-form-label col-2 text-right text-danger">전자우편 주소</label>
                        <input type="email" class="form-control col-sm-3 border-danger igborder" id="email1" name="email1" required value="${fn:split(mvo.email,'@')[0]}">
                        <div class="input-group-append">
                            <span class="input-group-text igborder">@</span>
                        </div>
                        <input type="text" class="form-control col-sm-2 border-danger igborder" id="email2" name="email2" readonly value="${fn:split(mvo.email,'@')[1]}">
                        <span>&nbsp;</span>
                        <select id="email3" class="form-control col-sm-2 border-danger" >
                            <option selected>선택하세요</option>
                            <option>naver.com</option>
                            <option>gmail.com</option>
                            <option>daum.net</option>
                            <option>hotmail.com</option>
                            <option>직접 입력하기</option>
                        </select>
                    </div><!--이메일-->
                    <div class="form-group row">
                        <label for="hp1" class="col-form-label col-2 text-right text-danger">개인연락처</label>
                        <select id="hp1" name="hp1" class="form-control border-danger" style="width: 90px;">
                            <option selected>국번</option>
                            <option>02</option>
                            <option>051</option>
                            <option>010</option>
                            <option>011</option>
                        </select>
                        <span>&nbsp;&mdash;&nbsp;</span>
                        <input class="form-control col-sm-1 border-danger" id="hp2" name="hp2" value="${fn:split(mvo.phone,'-')[1]}">
                        <span>&nbsp;&mdash;&nbsp;</span>
                        <input class="form-control col-sm-1 border-danger" id="hp3" name="hp3" value="${fn:split(mvo.phone,'-')[2]}">
                    </div><!--전화번호-->
                    <div class="form-group row">
                        <label class="col-form-label col-2 text-right text-danger">자동 가입방지</label>
                        <div class="g-recaptcha" data-sitekey="6LfA1joaAAAAAOU9f2VaZdKu9Z4C_tWErqdpFnqf"></div>
                        <input type="hidden" name="g-recaptcha" id="g-recaptcha">
                        <span style="color: red">${checkCaptcha}</span>
                    </div><!--자동가입방지-->
                    <hr>
                </div>
            </div>
            <div class="row margin30">
                <div class="col-12 text-center">
                    <button type="button" id="joinbtn" class="btn btn-primary"><i class="bi bi-check"></i>입력완료</button>
                    <button type="button" id="cancelbtn" class="btn btn-danger"><i class="bi bi-x"></i>취소하기</button>
                </div><!--버튼들-->
            </div>

            <input type="hidden" name="jumin" id="jumin">
            <input type="hidden" name="zipcode" id="zipcode">
            <input type="hidden" name="email" id="email">
            <input type="hidden" name="phone" id="phone">


        </form>
    </div> <!-- 정보입력 -->

</div><!--main-->


<!--우편번호 찾기 모달-->
<div id="zipmodal" class="modal" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">우편번호 찾기</h3>
                <button type="button" class="close" aria-label="Close" id="modalx"><span aria-hidden="true"><i class="bi bi-x"></i></span></button>
            </div>
            <div class="modal-body">
                <form id="zipfrm">
                    <div class="row form-group pushzip justify-content-center">
                        <label class="text-danger text-right" for="dong" style="margin-top: -5px;">검색하실 주소의<br>동 이름을 입력하세요</label>&nbsp;&nbsp;
                        <input type="text" id="dong" name="dong" class="form-control border-info col-4">&nbsp;&nbsp;
                        <span>
                            <button type="button" id="findbtn" class="btn btn-primary"><i class="bi bi-search"></i> 검색하기</button>
                        </span>
                    </div>
                    <div class="row form-group justify-content-center">
                        <div class="text-center">
                            <hr>
                            <p class="text-warning">지역의 읍/면/동의 이름을 공백없이 입력하신 후, [검색] 버튼을 클릭하세요</p>
                            <select id="addrlist" name="addrlist" class="form-control" size="10" style="margin :0 auto;">
                                <option>123-456 서울 종로구 창신동</option>
                                <option>123-456 서울 종로구 창신동</option>
                                <option>123-456 서울 종로구 창신동</option>
                                <option>123-456 서울 종로구 창신동</option>
                                <option>123-456 서울 종로구 창신동</option>
                                <option>123-456 서울 종로구 창신동</option>
                                <option>123-456 서울 종로구 창신동</option>
                                <option>123-456 서울 종로구 창신동</option>
                                <option>123-456 서울 종로구 창신동</option>
                                <option>123-456 서울 종로구 창신동</option>
                                <option>123-456 서울 종로구 창신동</option>
                                <option>123-456 서울 종로구 창신동</option>
                                <option>123-456 서울 종로구 창신동</option>
                                <option>123-456 서울 종로구 창신동</option>
                                <option>123-456 서울 종로구 창신동</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer justify-content-end">
                <button id="sendbtn" type="button" class="btn btn-danger"><i class="bi bi-check2-circle"></i> 선택하고 닫기</button>
            </div>
        </div>
    </div>
</div>