$('#agreebtn').on('click', function () {
    if (!$('#agree1').is(':checked')){
        alert('사이트이용약관에 동의하세요');
    }else if (!$('#agree2').is(':checked')){
        alert('개인정보 활용에 동의하세요');
    }else {
        location.href = '/join/checkme';
    }
})

$('#disagreebtn').on('click',function () {
    location.href = '/index';
})

$('#check2btn').on('click',function () {
    if ($('#name2').val() == ''){
        alert('이름을 입력하세요');
    }else if ($('#jumin1').val() == '' || $('#jumin2').val() == ''){
        alert('주민등록번호를 입력하세요');
    } else if (!$('#usejm').is(':checked')){
        alert('주민등록번호 처리에 동의하세요');
    }else {
        location.href = '/join/joinme?name=' + $('#name2').val() + '&jumin1=' + $('#jumin1').val() + '&jumin2=' + $('#jumin2').val();
    }
})

//회원가입하기
    $('#joinbtn').on('click',function () {
        if ($('#newuid').val() == '') {
            alert('아이디를 입력해주세요');
        } else if ($('#newpwd').val() == '') {
            alert('비밀번호를 입력해주세요');
        } else if ($('#repwd').val() == '') {
            alert('비밀번호 확인란을 입력해주세요');
        } else if ($('#newpwd').val() != $('#repwd').val()) {
            alert('비밀번호가 일치하지 않습니다.');
            // }else if ($('#zip1').val() == ''||$('#zip2').val() == ''||$('#add1').val() == ''){
            //     alert('우편번호를 검색해주세요');
        } else if ($('#add2').val() == '') {
            alert('나머지 주소를 입력해주세요');
            // }else if ($('#email1').val() == ''||$('#email2').val() == ''){
            //     alert('이메일주소를 입력해주세요');
        } else if ($('#hp2').val() == '' || $('#hp3').val() == '') {
            alert('전화번호를 입력해주세요');
        } else if (grecaptcha.getResponse() == ""){
            alert('자동 가입 방지 확인해주세요.')
        } else {

            $('#jumin').val($('#jumin1').val() + '-' + $('#jumin2').val());
            $('#zipcode').val($('#zip1').val() + '-' + $('#zip2').val());
            $('#email').val($('#email1').val() + '@' + $('#email2').val());
            $('#phone').val($('#hp1').val() + '-' + $('#hp2').val() + '-' + $('#hp3').val());

            // hidden 타입의 g-recaptcha에 grecaptcha.getResponse의 값이 들어감.
            $('#g-recaptcha').val(grecaptcha.getResponse());

            $('#joinfrm').attr('action', '/join/joinme');
            $('#joinfrm').attr('method', 'post');
            $('#joinfrm').submit();
        }
    })


// 아이디 중복체크
$('#newuid').on('blur', function () {
    checkuid();
})

function checkuid(){
    $.ajax({
        url: '/join/checkuid',
        type: 'GET',
        data: {uid: $('#newuid').val()}
    }).done(function (data) {
        let msg = '중복아이디입니다.';
        if (data.trim()==0){
            msg = '사용가능 아이디입니다.';
        }
        $('#uidmsg').text(msg);
    }).fail(function (xhr, status,error) {
        alert('에러')
    })
}

//우편번호 처리
$('#findbtn').on('click',function () {
    $.ajax({
        url: '/join/zipcode',
        type: 'GET',
        data: {dong: $('#dong').val()}
    })
        .done(function (data) {
            let opts = "";
            $.each(data, function () {
                let zip = "";
                $.each(this, function (k,v) {
                    if (v !== null){
                        zip += v +" ";
                    }
                })
                opts += '<option>' + zip + '</option>';
            })
            $('#addrlist').find('option').remove();
            $('#addrlist').append(opts);
        })
        .fail( function (xhr,status,error){
            alert(xhr,status,error);
        })
})

// 우편번호 보내기
$('#sendbtn').on('click',function () {
    let addr = $('#addrlist option:selected').val();

    if (addr == undefined){
        alert('주소를 선택하세요');
        return;
    }

    let addrs = addr.split(' ');
    $('#zip1').val(addrs[0].split('-')[0]);
    $('#zip2').val(addrs[0].split('-')[1]);
    $('#addr1').val(addrs[1]+" "+addrs[2]+" "+addrs[3]);

    //우편번호 검색창 닫음
    $('#zipmodal').modal('hide');

    //기존 검색 결과를 제거
    $('#addrlist').find("option").remove();
    $('#dong').val('');
})


//우편번호 모달창 x클릭시 닫기
$('#modalx').on('click',function () {
    $('#addrlist').find("option").remove();
    $('#dong').val('');
    $('#zipmodal').modal('hide');
})

// 이메일처리
$('#email3').on('change',function () {
    let val = $('#email3 option:selected').val();
    if (val=='직접 입력하기'){
        $('#email2').attr('readonly',false);
        $('#email2').val('');
    }else {
        $('#email2').attr('readonly',true);
        $('#email2').val(val);
    }

})

//메인으로 이동
$('#go2index').on('click',function (){
    location.href = "/index";
})

