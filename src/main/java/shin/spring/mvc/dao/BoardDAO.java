package shin.spring.mvc.dao;

import shin.spring.mvc.vo.BoardVO;

import java.util.List;

public interface BoardDAO {
    List<BoardVO> selectBoard(int snum);

    BoardVO selectOneBoard(String bno);

    int selectCountBoard();

    int deleteBoard(String bno);

    int updateBoard(BoardVO bvo);

    int updateViewCount(String bno);

    int insertBoard(BoardVO bvo);

    String checkUid(String bno);
}
