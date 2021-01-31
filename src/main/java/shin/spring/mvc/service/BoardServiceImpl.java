package shin.spring.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import shin.spring.mvc.dao.BoardDAOImpl;
import shin.spring.mvc.vo.BoardVO;

import java.util.List;

@Service("bsrv")
public class BoardServiceImpl implements BoardService{

    @Autowired
    private BoardDAOImpl bdao;

    @Override
    public List<BoardVO> readBoard(String cp) {
        int snum = (Integer.parseInt(cp) -1) * 10;
        return bdao.selectBoard(snum);

    }

    @Override
    public BoardVO readOneBoard(String bno) {
        return bdao.selectOneBoard(bno);
    }

    @Override
    public int countBoard() {
        return bdao.selectCountBoard();
    }

    @Override
    public boolean removeBoard(String bno) {
        Boolean isOk = false;
        int cnt = bdao.deleteBoard(bno);
        if (cnt > 0){
            isOk = true;
        }
        return isOk;
    }

    @Override
    public boolean modifyBoard(BoardVO bvo) {
        Boolean isOk = false;
        int cnt = bdao.updateBoard(bvo);
        if (cnt > 0){
            isOk = true;
        }
        return isOk;
    }

    @Override
    public boolean viewCount(String bno) {
        Boolean isOk = false;
        int cnt = bdao.updateViewCount(bno);
        if (cnt > 0){
            isOk = true;
        }
        return isOk;

    }

    @Override
    public boolean newBoard(BoardVO bvo) {
        Boolean isOK = false;
        int cnt = bdao.insertBoard(bvo);
        if (cnt > 0) isOK = true;
        return isOK;
    }

    @Override
    public String checkUserid(String bno) {
        return bdao.checkUid(bno);
    }
}
