package osel.test.gameboard.dao;

import osel.test.config.Configuration;
import osel.test.gameboard.dao.mapper.BoardMapper;
import osel.test.gameboard.domain.GameBoard;

public class GameBoardDaoImpl implements GameBoardDao{
	
	BoardMapper mapper;
	
	public GameBoardDaoImpl(){
		mapper = Configuration.getMapper(BoardMapper.class);
	}
	
	@Override
	public GameBoard getBoard(int gameId) {
		return mapper.getBoard(gameId);
	}
	
	@Override
	public int makeRoom() {
		return mapper.makeRoom();
	}

	@Override
	public int startGame(int gameId) {
		return mapper.startGame(gameId);
	}

	@Override
	public int updateBoard(GameBoard gameBoard) {
		return mapper.updateBoard(gameBoard);
	}

	@Override
	public int blackReady(int gameId) {
		return mapper.blackReady(gameId);
	}

	@Override
	public int whiteReady(int gameId) {
		return mapper.whiteReady(gameId);
	}

	@Override
	public GameBoard loadReadyStatus(int gameId) {
		return mapper.loadReadyStatus(gameId);
	}



}
