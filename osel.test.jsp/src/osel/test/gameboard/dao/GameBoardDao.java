package osel.test.gameboard.dao;

import osel.test.gameboard.domain.GameBoard;

public interface GameBoardDao {
	public GameBoard getBoard(int gameId);
	
	public int makeRoom();
	
	public int startGame(int gameId);
	
	public int updateBoard(GameBoard gameBoard);
	
	//인게임 시작 전,직후(191102)
	
	public int blackReady(int gameId);
	public int whiteReady(int gameId);
	public GameBoard loadReadyStatus(int gameId);

	
}
