<%@ page pageEncoding="UTF-8" %>
<div id="main">
    <div class="margin30">
        <h3><img src="/resources/img/glyphicons_043_group.png" style="position: relative; top: -5px">회원가입</h3>
        <hr>
    </div>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><button type="button" class="btn btn-success btn-sm disabled">이용약관</button><i class="bi bi-chevron-right"></i></li>
            <li class="breadcrumb-item active"><button type="button" class="btn btn-success btn-sm disabled">실명확인</button><i class="bi bi-chevron-right"></i></li>
            <li class="breadcrumb-item"><button type="button" class="btn btn-light btn-sm disabled">정보입력</button><i class="bi bi-chevron-right"></i></li>
            <li class="breadcrumb-item"><button type="button" class="btn btn-light btn-sm disabled">가입완료</button></li>
        </ol>
    </nav>

    <div class="margin100">
        <h2 class="font-weight-bold">가입인증</h2>
        <p><small class="text-muted">회원으로 가입하는 방법에는 2가지 방법이 있습니다. 아래에서 원하는 방법을 선택해주세요
            <br>입력하신 정보는 가입완료전까지 본 사이트에 저장되지 않습니다.</small></p>
        <hr>
    </div>

    <div class="margin1050">
        <div class="card card-body bg-light">
            <h3 class="margin30">일반 회원가입</h3>
            <form>
                <div class="row">
                    <div class="col-5 offset-1">
                        <div class="form-group row">
                            <label for="name" class="col-4 col-form-label text-warning">이름</label>
                            <input type="text" id="name" name="name" class="form-control col-6 border-warning">
                        </div>
                        <div class="form-group row"><label for="birth1" class="col-4 col-form-label text-warning">생년월일</label>
                            <select id="birth1" name="birth1" class="form-control col-3 border-warning">
                                <option>- 년도 -</option>
                                <option>2018</option>
                                <option>2019</option>
                            </select>&nbsp;
                            <select id="birth2" name="birth2" class="form-control col-2 border-warning">
                                <option>- 월 -</option>
                                <option>1</option>
                                <option>2</option>
                            </select>&nbsp;
                            <select id="birth3" name="birth3" class="form-control col-2 border-warning">
                                <option>- 일 -</option>
                                <option>1</option>
                                <option>2</option>
                            </select>
                        </div>
                        <div class="form-group row">
                            <label for="male" class="col-4 col-form-label text-warning ">성별</label>
                            <div class="custom-control custom-radio pushgender">
                                <input type="radio" id="male" name="gender" class="custom-control-input " value="m">
                                <label for="male" class="custom-control-label text-warning">남자</label>&nbsp;&nbsp;&nbsp;
                            </div>
                            <div class="custom-control custom-radio pushgender">
                                <input type="radio" id="female" name="gender" class="custom-control-input" value="f">
                                <label for="female" class="custom-control-label text-warning">여자</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-6">
                        <ul class="text-primary font-weight-bold">
                            <li>주민등록번호 입력 없이 전화번호로 회원가입이 가능합니다.</li>
                            <li>이름, 생년월일과 성별은 <span class="text-danger">추후 변경할 수 없습니다.</span></li>
                            <li><span class="text-danger">휴대폰 가입인증</span>을 하셔야 공개 게시판 이용이 가능합니다.</li>
                        </ul>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-12 text-center">
                        <button type="button" id="checkbtn" class="btn btn-primary"><i class="bi bi-check"></i> 확인하기</button>
                        <button type="button" id="cancelbtn" class="btn btn-danger"><i class="bi bi-x"></i> 취소하기</button>
                    </div>
                </div>
            </form>
        </div> <!--회원가입-->
        <div class="card card-body bg-light mt-2">
            <h3 class="margin30">실명확인 회원가입</h3>
            <form>
                <div class="row">
                    <div class="col-5 offset-1">
                        <div class="form-group row">
                            <label class="col-form-label col-4 text-warning" for="name2">이름</label>
                            <input type="text" id="name2" name="name2" class="form-control col-6 border-warning">
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-4 text-warning" for="jumin1">주민번호</label>
                            <input type="text" id="jumin1" name="jumin1" class="form-control col-3 border-warning">
                            <label class="col-form-label">&nbsp;&ndash;&nbsp;</label>
                            <input type="text" id="jumin2" name="jumin2" class="form-control col-3 border-warning">
                        </div>
                        <div class="form-group row">
                            <label class="col-4"></label>
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" id="usejm" class="custom-control-input">
                                <label for="usejm" class="custom-control-label text-warning">주민등록번호 처리에 동의합니다.</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-6">
                        <ul class="font-weight-bold text-primary">
                            <li>실명확인 회원가입시 공개 게시판 이용이 가능합니다.</li>
                            <li>타인의 주민등록번호를 임의로 사용하면 <span class="text-danger">'주민등록법'에 의해 3년 이하의 징역 또는 1천만원 이하의 벌금</span>이 부과될 수 있습니다.</li>
                            <li>입력하신 주민등록번호는 <span class="text-danger">별도 저장되지 않으며, 신용평가기관을 통한 실명확인용</span>으로만 이용됩니다.</li>
                            <li>개인정보보호법에 따라 <span class="text-danger">이용 동의</span>를 받습니다</li>
                        </ul>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-12 text-center">
                        <button type="button" class="btn btn-primary" id="check2btn"><i class="bi bi-check"></i>확인하기</button>
                        <button type="button" class="btn btn-danger" id="cancel2btn"><i class="bi bi-x"></i>취소하기</button>
                    </div>
                </div>
            </form>
        </div> <!--실명확인 회원가입-->
    </div>
</div><!--main-->

