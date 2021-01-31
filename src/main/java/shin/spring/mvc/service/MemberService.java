package shin.spring.mvc.service;

import shin.spring.mvc.vo.MemberVO;

import javax.servlet.http.HttpSession;

public interface MemberService {
    String newMember(MemberVO mvo);

    String checkUserid(String uid);

    String findZipcode(String dong);

    boolean checkLogin(MemberVO mvo, HttpSession sess);
}
