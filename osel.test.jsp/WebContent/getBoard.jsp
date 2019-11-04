<%@page import="osel.test.gameboard.dao.GameBoardDaoImpl"%>
<%@page import="osel.test.gameboard.dao.GameBoardDao"%>
<%@page import="osel.test.gameboard.domain.GameBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	GameBoard gameBoard = new GameBoard();
	GameBoardDao gameBoardDao = new GameBoardDaoImpl();
	//1. 리퀘스트를 받습니다.
	//int gameId = Integer.parseInt(request.getParameter("gameId"));
	
	//2. 현재 보드를 가져옵니다.
	gameBoard = gameBoardDao.getBoard(1);
	
	int[] row1 = new int[8];
	int[] row2 = new int[8];
	int[] row3 = new int[8];
	int[] row4 = new int[8];
	int[] row5 = new int[8];
	int[] row6 = new int[8];
	int[] row7 = new int[8];
	int[] row8 = new int[8];
	for(int i=0;i<8;i++){
		row1[i] = (int)gameBoard.getRow1().charAt(i)-48;
		row2[i] = (int)gameBoard.getRow2().charAt(i)-48;
		row3[i] = (int)gameBoard.getRow3().charAt(i)-48;
		row4[i] = (int)gameBoard.getRow4().charAt(i)-48;
		row5[i] = (int)gameBoard.getRow5().charAt(i)-48;
		row6[i] = (int)gameBoard.getRow6().charAt(i)-48;
		row7[i] = (int)gameBoard.getRow7().charAt(i)-48;
		row8[i] = (int)gameBoard.getRow8().charAt(i)-48;
	}
	int matrix[][] = {
			row1, row2, row3, row4, row5, row6, row7, row8
	};
%>
{"board":
<%out.print("[");
for(int i=0;i<8;i++){
	out.print("{");
	for(int j=0;j<7;j++){
		out.print("\"row"+(j+1)+"\":"+matrix[i][j]+", ");
	}
	if(i==7){out.print("\"row"+(8)+"\":"+matrix[i][7]+"}]");}
	else{out.print("\"row"+(8)+"\":"+matrix[i][7]+"}, ");}
	out.print("\n");
}
%>}