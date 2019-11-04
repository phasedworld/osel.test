package osel.test.gameboard.domain;

public class GameBoard {
	private int gameId;
	private int gameHeadcount;
	private String gameBlackuser;
	private String gameWhiteuser;
	private int gameStatus; //0 시작전 1 하는중  2 끝남
	private int blackStatus;
	private int whiteStatus;
	
	public int getGameHeadcount() {
		return gameHeadcount;
	}

	public void setGameHeadcount(int gameHeadcount) {
		this.gameHeadcount = gameHeadcount;
	}

	public String getGameBlackuser() {
		return gameBlackuser;
	}

	public void setGameBlackuser(String gameBlackuser) {
		this.gameBlackuser = gameBlackuser;
	}

	public String getGameWhiteuser() {
		return gameWhiteuser;
	}

	public void setGameWhiteuser(String gameWhiteuser) {
		this.gameWhiteuser = gameWhiteuser;
	}

	public int getBlackStatus() {
		return blackStatus;
	}

	public void setBlackStatus(int blackStatus) {
		this.blackStatus = blackStatus;
	}

	public int getWhiteStatus() {
		return whiteStatus;
	}

	public void setWhiteStatus(int whiteStatus) {
		this.whiteStatus = whiteStatus;
	}
	private int gameTurn; //0시작전 시작후 1부터~최대 64
	private String row1;
	private String row2;
	private String row3;
	private String row4;
	private String row5;
	private String row6;
	private String row7;
	private String row8;
	
	public GameBoard(){}
	
	public int getGameId() {
		return gameId;
	}
	public void setGameId(int gameId) {
		this.gameId = gameId;
	}
	public int getGameStatus() {
		return gameStatus;
	}
	public void setGameStatus(int gameStatus) {
		this.gameStatus = gameStatus;
	}
	public int getGameTurn() {
		return gameTurn;
	}
	public void setGameTurn(int gameTurn) {
		this.gameTurn = gameTurn;
	}
	public String getRow1() {
		return row1;
	}
	public void setRow1(String row1) {
		this.row1 = row1;
	}
	public String getRow2() {
		return row2;
	}
	public void setRow2(String row2) {
		this.row2 = row2;
	}
	public String getRow3() {
		return row3;
	}
	public void setRow3(String row3) {
		this.row3 = row3;
	}
	public String getRow4() {
		return row4;
	}
	public void setRow4(String row4) {
		this.row4 = row4;
	}
	public String getRow5() {
		return row5;
	}
	public void setRow5(String row5) {
		this.row5 = row5;
	}
	public String getRow6() {
		return row6;
	}
	public void setRow6(String row6) {
		this.row6 = row6;
	}
	public String getRow7() {
		return row7;
	}
	public void setRow7(String row7) {
		this.row7 = row7;
	}
	public String getRow8() {
		return row8;
	}
	public void setRow8(String row8) {
		this.row8 = row8;
	}
	

}
