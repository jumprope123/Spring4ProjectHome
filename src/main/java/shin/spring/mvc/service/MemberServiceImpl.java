package shin.spring.mvc.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import shin.spring.mvc.dao.MemberDAO;
import shin.spring.mvc.vo.MemberVO;

import javax.servlet.http.HttpSession;

@Service("msrv")
public class MemberServiceImpl implements MemberService{

    @Autowired
    private MemberDAO mdao;

    @Override
    public String newMember(MemberVO mvo) {
        String result = "회원가입 실패";
        int cnt = mdao.insertMember(mvo);
        if (cnt > 0) {
            result = "회원가입 성공";
        }
        return result;
    }

    @Override
    public String checkUserid(String uid) {
        String result = "0";
        int cnt = mdao.selectOneUserid(uid);
        if (cnt>0) result = "1";
        return result;
    }

    @Override
    public String findZipcode(String dong) {
        ObjectMapper mapper = new ObjectMapper();
        String json = "";
        dong = dong + "%";
        try {
            json = mapper.writeValueAsString(mdao.selectZipcode(dong));
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return json;
    }

    @Override
    public boolean checkLogin(MemberVO mvo, HttpSession sess) {
        boolean isLogin = false;

        if (mdao.selectLogin(mvo) > 0){
            sess.setAttribute("UID" , mvo.getUserid());
            isLogin = true;
        }
        return isLogin;
    }
}
