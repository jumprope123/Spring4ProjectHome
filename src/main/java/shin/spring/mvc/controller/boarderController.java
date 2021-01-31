package shin.spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import shin.spring.mvc.service.BoardService;
import shin.spring.mvc.util.GoogleCaptchaUtil;
import shin.spring.mvc.vo.BoardVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class boarderController {

    @Autowired
    private GoogleCaptchaUtil gcutil;
    @Autowired
    private BoardService bsrv;


    @GetMapping("/board/list")
    public ModelAndView list(String cp, ModelAndView mv){
        mv.setViewName("board/list.tiles");
        mv.addObject("bds", bsrv.readBoard(cp));
        mv.addObject("bdcnt",bsrv.countBoard());
        return mv;
    }

    @GetMapping("/board/update")
    public ModelAndView update(ModelAndView mv, String bno, HttpSession sess){
        String userid = bsrv.checkUserid(bno);
        if (bno == null || sess.getAttribute("UID") == null){
            mv.setViewName("redirect:/index");
        }else if (!sess.getAttribute("UID").equals(userid)) {
            mv.setViewName("redirect:/index");
        } else {
            mv.setViewName("board/update.tiles");
            mv.addObject("bd", bsrv.readOneBoard(bno));
        }
        return mv;
    }


    @GetMapping("/board/view")
    public ModelAndView view(String bno, ModelAndView mv, String cp){

        mv.setViewName("board/view.tiles");
        bsrv.viewCount(bno); // 뷰 증가
        mv.addObject("bd", bsrv.readOneBoard(bno));
        mv.addObject("cp",cp); //list페이지에서 view페이지 호출시 cp정보를 담아서 넘김
        return mv;
    }

    @GetMapping("/board/write")
    public String write(HttpSession sess){
        if (sess.getAttribute("UID") != null){
            return "board/write.tiles";
        }else {
            return "redirect:/board/list?cp=1";
        }
    }


    @GetMapping("/board/delete")
    public String delete(String bno, String cp, HttpSession sess){
        String userid = bsrv.checkUserid(bno);

        if (bno == null || sess.getAttribute("UID") == null){
            return "redirect:/index";
        }else if (!sess.getAttribute("UID").equals(userid)) {
            return "redirect:/index";
        } else {
            bsrv.removeBoard(bno);
            return "redirect:/board/list?cp=" + cp;
        }
    }

    @PostMapping("/board/update")
    public String update(BoardVO bvo, String bno, String cp, HttpSession sess){
        String param = "?bno="+bno;
        param += "&cp" + cp;
        String returnPage = "redirect:/board/update"+param;

        //이게 실행되는건 못누르는 hidden으로 감춰진 수정하기를 억지로 뚫고 들어왔을때, userid랑 UID가 같은지 확인하는것.
        if (sess.getAttribute("UID").equals(bvo.getUserid()) && bsrv.modifyBoard(bvo)){
            returnPage = "redirect:/board/view" + param;
        }
        return returnPage;
    }

    @PostMapping("board/write")
    public ModelAndView write(BoardVO bvo, HttpServletRequest req, RedirectAttributes rds,ModelAndView mv){
        mv.setViewName("redirect:/board/write");
        String gCaptcha = req.getParameter("g-recaptcha");

        if(gcutil.checkCaptcha(gCaptcha)){
            bsrv.newBoard(bvo);
            mv.setViewName("redirect:/board/list?cp=1");
        }else {
            rds.addFlashAttribute("title",req.getParameter("title"));
            rds.addFlashAttribute("contents",req.getParameter("contents"));
            rds.addFlashAttribute("checkCaptcha","자동가입방지 확인이 실패했어요");
        }

        return mv;
    }


}
