package osel.test.gameboard.dao.mapper;

import osel.test.gameboard.domain.GameBoard;

public interface BoardMapper {
	
	public GameBoard getBoard(int gameId);
	public int makeRoom();
	public int startGame(int gameId);
	public int updateBoard(GameBoard gameBoard);
	
	public int blackReady(int gameId);
	public int whiteReady(int gameId);
	public GameBoard loadReadyStatus(int gameId);
}
