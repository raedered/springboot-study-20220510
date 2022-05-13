package com.springboot.study.service.board;

import com.springboot.study.web.dto.board.BoardInsertReqdto;
import com.springboot.study.web.dto.board.BoardRespDto;

public interface BoardService {
	public int createBoard(BoardInsertReqdto boardInsertReqdto) throws Exception;
	public BoardRespDto getBoard(int boardCode) throws Exception;
}
