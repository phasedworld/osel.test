<%@page import="osel.test.gameboard.dao.GameBoardDaoImpl"%>
<%@page import="osel.test.gameboard.dao.GameBoardDao"%>
<%@page import="osel.test.gameboard.domain.GameBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int gameId = Integer.parseInt(request.getParameter("gameId"));
	GameBoard gameBoard = new GameBoard();
	GameBoardDao gameBoardDao = new GameBoardDaoImpl();
	gameBoard = gameBoardDao.loadReadyStatus(gameId);
%>
{
"headCount":<%=gameBoard.getGameHeadcount()%>,
"blackId":"<%=gameBoard.getGameBlackuser() %>",
"whiteId":"<%=gameBoard.getGameWhiteuser() %>",
"blackStatus":<%=gameBoard.getBlackStatus() %>,
"whiteStatus":<%=gameBoard.getWhiteStatus() %>,
"turn":<%=gameBoard.getGameTurn() %>
}
