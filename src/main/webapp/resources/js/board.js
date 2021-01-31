
$('#newbd').on('click',function () {
    location.href = "/board/write";
})


$('#listbdbtn').on('click',function () {
    let param = '?cp=' + $('#cp').val();
    location.href = '/board/list' + param;
})

$('#thumbbtn').on('click',function () {
//추천하기 버튼이 눌리면 해야할일 ?
})

$('#upbdbtn').on('click',function () {
    let param = '?bno=' + $('#bno').val();
    param += '&cp=' + $('#cp').val();
    if (confirm('정말로 수정하시겠습니까?')) {
        location.href = '/board/update' + param;
    }
})

$('#rmbdbtn').on('click',function () {
    let param = '?bno=' + $('#bno').val();
    param += '&cp=' + $('#cp').val();
    if (confirm('정말로  삭제하시겠습니까?')) {
        location.href = '/board/delete' + param;
    }
})

$('#upbdokbtn').on('click',function () {
    if ($('#title').val() == ""){
        alert('제목을 작성해주세요');
    }else if ($('#contents').val() == ""){
        alert('내용을 작성해주세요');
    }else {
        if (confirm('정말로 수정 하시겠습니까?')){
            $('#updbdfrm').attr('method', 'POST');
            $('#updbdfrm').attr('action', '/board/update');
            $('#updbdfrm').submit();
        }
    }



})

$('#ccupbdbtn').on('click',function () {
    if (confirm('취소하시겠습니까?')){
        history.back();
    }

})


$('#newbdbtn').on('click',function () {
    if ($('#uid') == null) {
        alert('로그인되어있지 않습니다. 메인화면으로 이동합니다.')
        location.href = "/index";
    }
    else if ($('#title').val() == '') alert('제목을 작성하세요!');
    else if ($('#contents').val() == '') alert('본문을 작성하세요!');
    else if (grecaptcha.getResponse() == "") alert("자동가입 방지 확인 필요!");
    else {
        $('#g-recaptcha').val(grecaptcha.getResponse());
        $('#newbdfrm').attr('method','post');
        $('#newbdfrm').attr('action','/board/write');
        $('#newbdfrm').submit();
    }
})


$('#cancelbtn').on('click',function () {
    if (confirm('취소하시겠습니까?')){
        location.href = "/board/list?cp=1";
    }
})
