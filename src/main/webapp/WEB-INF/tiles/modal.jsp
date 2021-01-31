<%@ page pageEncoding="UTF-8" %>

<div id="loginmodal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title"><strong>로그인</strong></h3>
                <button type="button" class="btn btn-light btn-outline-dark btn-sm" data-dismiss="modal">닫기</button>
            </div>
            <div class="modal-body">
                <form id="loginfrm">
                    <div class="form-group form-inline row text-center">
                        <label for="userid" class="col-form-label col-sm-4">아이디</label>
                        <input type="text" id="userid" class="form-control col-sm-6" name="userid">
                    </div>
                    <div class="form-group form-inline row text-center">
                        <label for="passwd" class="col-sm-4">비밀번호</label>
                        <input type="password" id="passwd" class="form-control col-sm-6" name="passwd">
                    </div>
                    <div class="form-group row">
                        <div class="col-4"></div>
                        <div class="form-check form-group">
                            <input type="checkbox" class="form-check-input" id="checkbox1">
                            <label for="checkbox1" class="form-check-label">로그인 상태 유지</label>
                        </div>

                    </div>
                </form>
            </div>
            <div class="modal-footer bg-light justify-content-center">
                <button type="button" class="btn btn-danger" id="loginbtn">로그인</button>
                <button type="button" class="btn btn-warning ">아이디/비밀번호 찾기</button>
            </div>
        </div>
    </div>
</div>