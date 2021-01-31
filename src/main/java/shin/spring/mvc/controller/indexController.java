package shin.spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import shin.spring.mvc.service.MemberService;
import shin.spring.mvc.vo.MemberVO;

import javax.servlet.http.HttpSession;

@Controller
public class indexController {

    @Autowired
    private MemberService msrv;

    @GetMapping("/index")
    public String index(){
        return "index.tiles";
    }


    @PostMapping("/login/login")
    public String loginok(MemberVO mvo, HttpSession sess){
        String returnPage = "redirect:/login/loginfail";

        if (msrv.checkLogin(mvo,sess)){
            returnPage = "redirect:/index";
        }
        return returnPage;
    }

    @GetMapping("/login/logout")
    public String logout(HttpSession sess){
        sess.removeAttribute("UID");
        return "redirect:/index";
    }

    @GetMapping("/login/loginfail")
    public String fail(){
        return "fail.tiles";
    }

}
