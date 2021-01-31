<%@ page pageEncoding="UTF-8" %>
<div id="main">
    <div class="margin30">
        <h3><i class="bi bi-chat-dots-fill bidragup"></i>&nbsp;게시판</h3>
        <hr>
    </div>
    <form id="updbdfrm">
        <div class="row margin1050">
            <div class="col-6">
                <h4><i class="bi bi-pencil-square bidragup"></i>&nbsp;수정하기</h4>
            </div>
            <div class="col-6 text-right">
                <button type="button" id="listbdbtn" class="btn btn-light">
                    <i class="bi bi-card-list bidragup"></i>&nbsp;목록으로
                </button>
            </div>
        </div>

        <div class="card card-body bg-light margin1050">
            <div class="form-group row">
                <label for="title" class="col-form-label col-2 text-right">제목</label>
                <input type="text" id="title" name="title" class="form-control col-9" value="${bd.title}">
            </div>
            <div class="form-group row">
                <label for="uid" class="col-form-label col-2 text-right">작성자</label>
                <input type="text" id="uid" name="userid" class="form-control col-9" readonly value="${bd.userid}">
            </div>
            <div class="form-group row">
                <label for="contents" class="col-form-label col-2 text-right">본문내용</label>
                <textarea type="text" id="contents" name="contents" class="form-control col-9" rows="15">${bd.contents}</textarea>
            </div>
            <div class="row">
                <label class="col-2 text-right">자동입력방지</label>
                <img src="/img/google_recaptcha.gif" width="40%" height="40%" style="margin-left: -5px">
            </div>
        </div> <!--새글쓰기 폼-->
        <input type="hidden" name="bno" value="${param.bno}">
        <input type="hidden" name="cp" id="cp" value="${param.cp}">


        <div class="row">
            <div class="col-12 text-center">
                <button type="button" id="upbdokbtn" class="btn btn-primary"><i class="bi bi-check"></i>수정완료</button>
                <button type="button" id="ccupbdbtn" class="btn btn-danger"><i class="bi bi-x"></i>취소하기</button>
            </div><!--버튼들-->
        </div>
    </form>


</div>