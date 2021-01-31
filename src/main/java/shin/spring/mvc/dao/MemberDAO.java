package shin.spring.mvc.dao;

import shin.spring.mvc.vo.MemberVO;
import shin.spring.mvc.vo.ZipcodeVO;

import java.util.List;


public interface MemberDAO {
    int insertMember(MemberVO mvo);

    int selectOneUserid(String uid);

    List<ZipcodeVO> selectZipcode(String dong);

    int selectLogin(MemberVO mvo);
}
