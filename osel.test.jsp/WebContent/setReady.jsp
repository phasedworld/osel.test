<%@page import="osel.test.gameboard.dao.GameBoardDaoImpl"%>
<%@page import="osel.test.gameboard.dao.GameBoardDao"%>
<%@page import="osel.test.gameboard.domain.GameBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = request.getParameter("userId");
	int result = 0;
	String mySide="";
	GameBoard gameBoard = new GameBoard();
	GameBoardDao gameBoardDao = new GameBoardDaoImpl();
	gameBoard = gameBoardDao.loadReadyStatus(1);
	if(userId.equals(gameBoard.getGameBlackuser())){
		//유저의 아이디가 흑돌유저일때
		mySide="black";
		if(gameBoard.getWhiteStatus()==1){
			//white가 준비중이라면 게임 시작
			gameBoardDao.startGame(1);
			result = 1;
		}else{
			//white가 준비중이지 않다면 준비
			gameBoardDao.blackReady(1);//인자는 게임아이디
			result = 0;
		}
	}else{//유저의 아이디가 백돌유저일때
		mySide="white";
		if(gameBoard.getBlackStatus()==1){
			//black가 준비중이라면 게임 시작
			gameBoardDao.startGame(1);
			result = 1;
		}else{
			//black가 준비중이지 않다면 준비
			gameBoardDao.whiteReady(1);//인자는 게임아이디
			result = 0;
		}
	}
	
%>
{
"start":<%=result%>,
"mySide":"<%=mySide%>"
}