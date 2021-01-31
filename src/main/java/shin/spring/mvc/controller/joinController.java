package shin.spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import shin.spring.mvc.service.MemberService;
import shin.spring.mvc.util.GoogleCaptchaUtil;
import shin.spring.mvc.vo.MemberVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class joinController {

    @Autowired
    private MemberService msrv;

    @Autowired
    private GoogleCaptchaUtil gcutil;

    @GetMapping("/join/agree")
    public String agree(){
        return "join/agree.tiles";
    }


    @GetMapping("/join/checkme")
    public String checkme(){
        return "join/checkme.tiles";
    }


    @GetMapping("/join/joinme") // 회원가입 폼
    public String joinme(){
        return "join/joinme.tiles";
    }

// 회원가입 처리
    @PostMapping("/join/joinme")
    public String joinme(MemberVO mvo, HttpServletRequest req , RedirectAttributes rds) throws UnsupportedEncodingException {

        String param = "?name=" + URLEncoder.encode(mvo.getName(),"UTF-8");
        param = param + "&jumin1=" + mvo.getJumin().split("-")[0];
        param = param + "&jumin2=" + mvo.getJumin().split("-")[1];

        String returnPage = "redirect:/join/joinme" + param;

        //클라이언트에서 생성한 captcha코드를 가져옴
        String gCaptcha = req.getParameter("g-recaptcha");

        if (gcutil.checkCaptcha(gCaptcha)){
            msrv.newMember(mvo);
            returnPage = "redirect:/join/joinok";
            //현재시간 구하기
            SimpleDateFormat format2 = new SimpleDateFormat ( "yyyy년 MM월dd일 HH시mm분ss초");
            Date time = new Date();
            String time2 = format2.format(time);
            //현재시간 보내기
            mvo.setRegdate(time2);
            rds.addFlashAttribute("mvo",mvo);
        }else {
            rds.addFlashAttribute("checkCaptcha","자동가입방지 확인 실패");
            rds.addFlashAttribute("mvo",mvo);
        }


        return returnPage;
    }

    @GetMapping("/join/joinok")
    public String joinok(){
        return "join/joinok.tiles";
    }

    //우편번호 검색
    @ResponseBody
    @GetMapping("/join/zipcode")
    public void zipcode(String dong, HttpServletResponse res){
        res.setContentType("application/json; charset=UTF-8");
        try {
            res.getWriter().print(msrv.findZipcode(dong));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }



    // 아이디 중복체크
    // 데이터베이스와 대조하여 uid가 있으면 1, 없으면 0을 반납한다.
    @ResponseBody
    @GetMapping("/join/checkuid")
    public void checkuid(String uid, HttpServletResponse res) {
        try {
            res.getWriter().print(msrv.checkUserid(uid));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
