package shin.spring.mvc.service;

import shin.spring.mvc.vo.BoardVO;

import java.util.List;

public interface BoardService {
    List<BoardVO> readBoard(String cp);

    BoardVO readOneBoard(String bno);

    int countBoard();

    boolean removeBoard(String bno);

    boolean modifyBoard(BoardVO bvo);

    boolean viewCount(String bno);

    boolean newBoard(BoardVO bvo);

    String checkUserid(String bno);
}
