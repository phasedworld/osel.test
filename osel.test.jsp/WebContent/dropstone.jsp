<%@page import="osel.test.gameboard.domain.GameStone"%>
<%@page import="osel.test.gameboard.dao.GameBoardDaoImpl"%>
<%@page import="osel.test.gameboard.dao.GameBoardDao"%>
<%@page import="osel.test.gameboard.domain.GameBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	GameBoard gameBoard = new GameBoard();
	GameBoardDao gameBoardDao = new GameBoardDaoImpl();
	//1. 리퀘스트를 받습니다.
	int gameId = Integer.parseInt(request.getParameter("gameId"));
	int cellIdx = Integer.parseInt(request.getParameter("cellIdx"));
	String mySide = request.getParameter("mySide");//black or white
	int x = (cellIdx-1)%8;
	int y = (int) (cellIdx-1)/8;
	int tempX=0; int tempY=0;
	
	//2. 현재 보드를 가져와, 놓여질 돌 색상을 결정합니다.
	gameBoard = gameBoardDao.getBoard(1);
	
	//3. 새로운 돌이 놓인 곳+플립된 곳을 고쳐 업데이트합니다.
	
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

	//기존 보드를 resultboard에 옮긴다.
	int resultboard[][] = matrix;
	
	int counter=0;
	
	if(mySide.equals("black")){
		resultboard[x][y]=1;
		//left-top
		counter=0; //뒤집을 개수를 세어준다! 모든 플립작업 전 필요
		if(x>1&&y>1){
			for(int m=x;m>=0;m--){
				for(int n=y;n>=0;n--){
					tempX = x; tempY= y;
					while(tempX-1>=0&&tempY-1>=0&&counter!=-1){
						switch(matrix[tempX-1][tempY-1]){
						case 0: counter=-1; break;
						case 1: if(counter==0) counter =-1;
								else{
									for(int k=1;k<=counter;k++){
										resultboard[x-k][y-k]=1;//흑돌 기준으로만 짜놓기
									} counter=-1; break;
								}
						case 2: counter++; break;
						}
						tempX--; tempY--;
					}
				}
			}
		}
		
		//right-top
		counter=0; //뒤집을 개수를 세어준다! 모든 플립작업 전 필요
		if(x>1&&y<6){
			for(int m=x;m>=0;m--){
				for(int n=0;n<y;n++){
					tempX = x; tempY= y;
					while(tempX-1>=0&&tempY+1<8&&counter!=-1){
						switch(matrix[tempX-1][tempY+1]){
						case 0: counter=-1; break;
						case 1: if(counter==0) counter =-1;
								else{
									for(int k=1;k<=counter;k++){
										resultboard[x-k][y+k]=1;//흑돌 기준으로만 짜놓기
									} counter=-1; break;
								}
						case 2: counter++; break;
						}
						tempX--; tempY++;
					}
				}
			}
		}
		
		//right-bottom
		counter=0; //뒤집을 개수를 세어준다! 모든 플립작업 전 필요
		if(x<6&&y<6){
			for(int m=0;m<x;m++){
				for(int n=0;n<y;n++){
					tempX = x; tempY= y;
					while(tempX+1<8&&tempY+1<8&&counter!=-1){
						switch(matrix[tempX+1][tempY+1]){
						case 0: counter=-1; break;
						case 1: if(counter==0) counter =-1;
								else{
									for(int k=1;k<=counter;k++){
										resultboard[x+k][y+k]=1;//흑돌 기준으로만 짜놓기
									} counter=-1; break;
								}
						case 2: counter++; break;
						}
						tempX++; tempY++;
					}
				}
			}
		}

		//left-bottom
		counter=0; //뒤집을 개수를 세어준다! 모든 플립작업 전 필요
		if(x<6&&y>1){
			for(int m=0;m<x;m++){
				for(int n=y;n>=0;n--){
					tempX = x; tempY= y;
					while(tempX+1<8&&tempY-1>=0&&counter!=-1){
						switch(matrix[tempX+1][tempY-1]){
						case 0: counter=-1; break;
						case 1: if(counter==0) counter =-1;
								else{
									for(int k=1;k<=counter;k++){
										resultboard[x+k][y-k]=1;//흑돌 기준으로만 짜놓기
									} counter=-1; break;
								}
						case 2: counter++; break;
						}
						tempX++; tempY--;
					}
				}
			}
		}
		
		//left
		counter=0;
		if(y>1){
			for(int n=y;n>=0;n--){
				tempY= y;
				while(tempY-1>=0&&counter!=-1){
					switch(matrix[x][tempY-1]){
					case 0: counter=-1; break;
					case 1: if(counter==0) counter =-1;
							else{
								for(int k=1;k<=counter;k++){
									resultboard[x][y-k]=1;//흑돌 기준으로만 짜놓기
								} counter=-1; break;
							}
					case 2: counter++; break;
					}
					tempY--;
				}
			}
		}
		
		//right
		counter=0;
		if(y<6){
			for(int n=0;n<8;n++){
				tempY= y;
				while(tempY+1<8&&counter!=-1){
					switch(matrix[x][tempY+1]){
					case 0: counter=-1; break;
					case 1: if(counter==0) counter =-1;
							else{
								for(int k=1;k<=counter;k++){
									resultboard[x][y+k]=1;//흑돌 기준으로만 짜놓기
								} counter=-1; break;
							}
					case 2: counter++; break;
					}
					tempY++;
				}
			}
		}
		//top
		counter=0;
		if(x>1){
			for(int m=x;m>=0;m--){
				tempX= x;
				while(tempX-1>=0&&counter!=-1){
					switch(matrix[tempX-1][y]){
					case 0: counter=-1; break;
					case 1: if(counter==0) counter =-1;
							else{
								for(int k=1;k<=counter;k++){
									resultboard[x-k][y]=1;//흑돌 기준으로만 짜놓기
								} counter=-1; break;
							}
					case 2: counter++; break;
					}
					tempX--;
				}
			}
		}
		//bottom
		counter=0;
		if(x<6){
			for(int m=0;m<8;m++){
				tempX= x;
				while(tempX+1<8&&counter!=-1){
					switch(matrix[tempX+1][y]){
					case 0: counter=-1; break;
					case 1: if(counter==0) counter =-1;
							else{
								for(int k=1;k<=counter;k++){
									resultboard[x+k][y]=1;//흑돌 기준으로만 짜놓기
								} counter=-1; break;
							}
					case 2: counter++; break;
					}
					tempX++;
				}
			}
		}
	}else if(mySide.equals("white")){//흑돌일 때
		resultboard[x][y]=2;
		//left-top
		counter=0; //뒤집을 개수를 세어준다! 모든 플립작업 전 필요
		if(x>1&&y>1){
			for(int m=x;m>=0;m--){
				for(int n=y;n>=0;n--){
					tempX = x; tempY= y;
					while(tempX-1>=0&&tempY-1>=0&&counter!=-1){
						switch(matrix[tempX-1][tempY-1]){
						case 0: counter=-1; break;
						case 2: if(counter==0) counter =-1;
								else{
									for(int k=1;k<=counter;k++){
										resultboard[x-k][y-k]=2;//흑돌 기준으로만 짜놓기
									} counter=-1; break;
								}
						case 1: counter++; break;
						}
						tempX--; tempY--;
					}
				}
			}
		}
		
		//right-top
		counter=0; //뒤집을 개수를 세어준다! 모든 플립작업 전 필요
		if(x>1&&y<6){
			for(int m=x;m>=0;m--){
				for(int n=0;n<y;n++){
					tempX = x; tempY= y;
					while(tempX-1>=0&&tempY+1<8&&counter!=-1){
						switch(matrix[tempX-1][tempY+1]){
						case 0: counter=-1; break;
						case 2: if(counter==0) counter =-1;
								else{
									for(int k=1;k<=counter;k++){
										resultboard[x-k][y+k]=2;//흑돌 기준으로만 짜놓기
									} counter=-1; break;
								}
						case 1: counter++; break;
						}
						tempX--; tempY++;
					}
				}
			}
		}
		
		//right-bottom
		counter=0; //뒤집을 개수를 세어준다! 모든 플립작업 전 필요
		if(x<6&&y<6){
			for(int m=0;m<x;m++){
				for(int n=0;n<y;n++){
					tempX = x; tempY= y;
					while(tempX+1<8&&tempY+1<8&&counter!=-1){
						switch(matrix[tempX+1][tempY+1]){
						case 0: counter=-1; break;
						case 2: if(counter==0) counter =-1;
								else{
									for(int k=1;k<=counter;k++){
										resultboard[x+k][y+k]=2;//흑돌 기준으로만 짜놓기
									} counter=-1; break;
								}
						case 1: counter++; break;
						}
						tempX++; tempY++;
					}
				}
			}
		}

		//left-bottom
		counter=0; //뒤집을 개수를 세어준다! 모든 플립작업 전 필요
		if(x<6&&y>1){
			for(int m=0;m<x;m++){
				for(int n=y;n>=0;n--){
					tempX = x; tempY= y;
					while(tempX+1<8&&tempY-1>=0&&counter!=-1){
						switch(matrix[tempX+1][tempY-1]){
						case 0: counter=-1; break;
						case 2: if(counter==0) counter =-1;
								else{
									for(int k=1;k<=counter;k++){
										resultboard[x+k][y-k]=2;//흑돌 기준으로만 짜놓기
									} counter=-1; break;
								}
						case 1: counter++; break;
						}
						tempX++; tempY--;
					}
				}
			}
		}
		
		//left
		counter=0;
		if(y>1){
			for(int n=y;n>=0;n--){
				tempY= y;
				while(tempY-1>=0&&counter!=-1){
					switch(matrix[x][tempY-1]){
					case 0: counter=-1; break;
					case 2: if(counter==0) counter =-1;
							else{
								for(int k=1;k<=counter;k++){
									resultboard[x][y-k]=2;//흑돌 기준으로만 짜놓기
								} counter=-1; break;
							}
					case 1: counter++; break;
					}
					tempY--;
				}
			}
		}
		
		//right
		counter=0;
		if(y<6){
			for(int n=0;n<8;n++){
				tempY= y;
				while(tempY+1<8&&counter!=-1){
					switch(matrix[x][tempY+1]){
					case 0: counter=-1; break;
					case 2: if(counter==0) counter =-1;
							else{
								for(int k=1;k<=counter;k++){
									resultboard[x][y+k]=2;//흑돌 기준으로만 짜놓기
								} counter=-1; break;
							}
					case 1: counter++; break;
					}
					tempY++;
				}
			}
		}
		//top
		counter=0;
		if(x>1){
			for(int m=x;m>=0;m--){
				tempX= x;
				while(tempX-1>=0&&counter!=-1){
					switch(matrix[tempX-1][y]){
					case 0: counter=-1; break;
					case 2: if(counter==0) counter =-1;
							else{
								for(int k=1;k<=counter;k++){
									resultboard[x-k][y]=2;//흑돌 기준으로만 짜놓기
								} counter=-1; break;
							}
					case 1: counter++; break;
					}
					tempX--;
				}
			}
		}
		//bottom
		counter=0;
		if(x<6){
			for(int m=0;m<8;m++){
				tempX= x;
				while(tempX+1<8&&counter!=-1){
					switch(matrix[tempX+1][y]){
					case 0: counter=-1; break;
					case 2: if(counter==0) counter =-1;
							else{
								for(int k=1;k<=counter;k++){
									resultboard[x+k][y]=2;//흑돌 기준으로만 짜놓기
								} counter=-1; break;
							}
					case 1: counter++; break;
					}
					tempX++;
				}
			}
		}
	}
	
	//3. 각각의 row에 셋하고 update.
	String row1Next="";
	String row2Next="";
	String row3Next="";
	String row4Next="";
	String row5Next="";
	String row6Next="";
	String row7Next="";
	String row8Next="";
	for(int i=0;i<8;i++){
		row1Next = row1Next+resultboard[0][i];
		row2Next = row2Next+resultboard[1][i];
		row3Next = row3Next+resultboard[2][i];
		row4Next = row4Next+resultboard[3][i];
		row5Next = row5Next+resultboard[4][i];
		row6Next = row6Next+resultboard[5][i];
		row7Next = row7Next+resultboard[6][i];
		row8Next = row8Next+resultboard[7][i];
	}
	
	gameBoard.setRow1(row1Next);
	gameBoard.setRow2(row2Next);
	gameBoard.setRow3(row3Next);
	gameBoard.setRow4(row4Next);
	gameBoard.setRow5(row5Next);
	gameBoard.setRow6(row6Next);
	gameBoard.setRow7(row7Next);
	gameBoard.setRow8(row8Next);
	gameBoardDao.updateBoard(gameBoard);
	
	int success = 1; 
%>
{
"success":<%=success%>
}