package com.springboot.study.service.board;

import java.util.List;

import com.springboot.study.web.dto.board.BoardInsertReqdto;
import com.springboot.study.web.dto.board.BoardRespDto;
import com.springboot.study.web.dto.board.BoardUpdateReqDto;

public interface BoardService {
	public List<BoardRespDto> getBoardListAll() throws Exception;
	public List<BoardRespDto> getBoardListByPage(int page) throws Exception;
	public int createBoard(BoardInsertReqdto boardInsertReqdto) throws Exception;
	public BoardRespDto getBoard(int boardCode) throws Exception;
	public int updateBoard(int boardCode, BoardUpdateReqDto boardUpdateReqDto) throws Exception;
	public int deleteBoard(int boardCode) throws Exception;
}
