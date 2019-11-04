<%@page import="osel.test.gameboard.domain.GameStone"%>
<%@page import="osel.test.gameboard.dao.GameBoardDaoImpl"%>
<%@page import="osel.test.gameboard.dao.GameBoardDao"%>
<%@page import="osel.test.gameboard.domain.GameBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	GameBoard gameBoard = new GameBoard();
	GameBoardDao gameBoardDao = new GameBoardDaoImpl();
	gameBoard = gameBoardDao.getBoard(1);
	String mySide = request.getParameter("mySide");//black or white
	
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
	/* int matrix[][] = {
			{0,0,0,0,0,0,0,0},
			{0,0,0,0,0,0,0,0},
			{0,0,0,0,0,0,0,0},
			{0,0,0,2,1,0,0,0},
			{0,0,0,1,2,0,0,0},
			{0,0,0,0,0,0,0,0},
			{0,0,0,0,0,0,0,0},
			{0,0,0,0,0,0,0,0}
	}; */
	
	int clickable[][] = {
			{0,0,0,0,0,0,0,0},
			{0,0,0,0,0,0,0,0},
			{0,0,0,0,0,0,0,0},
			{0,0,0,0,0,0,0,0},
			{0,0,0,0,0,0,0,0},
			{0,0,0,0,0,0,0,0},
			{0,0,0,0,0,0,0,0},
			{0,0,0,0,0,0,0,0}
	};
	
	int counter=0;
	int tempX; int tempY;
	
	
	if(mySide.equals("black")){//유저가 흑돌
		//left-top
		for(int m=0;m<8;m++){
			for(int n=0;n<8;n++){
				tempX = m; tempY= n;
				if(matrix[tempX][tempY]==0){
					while(tempX-1>=0&&tempY-1>=0&&counter!=-1){
						switch(matrix[tempX-1][tempY-1]){
						case 0: counter =-1;
								break;
						case 1:
							if(counter==0) break;
							else{
								clickable[m][n]=1;
								counter=-1;
								break;
							}
						case 2:
							counter=1;
							break;
						}
						tempX--; tempY--;
					}//end while()
				}
				counter=0;
			}
		}
		//right-top
		for(int m=0;m<8;m++){
			for(int n=0;n<8;n++){
				tempX = m; tempY= n;
				if(matrix[tempX][tempY]==0){
					while(tempX-1>=0&&tempY+1<8&&counter!=-1){
						switch(matrix[tempX-1][tempY+1]){
						case 0: counter =-1;
								break;
						case 1:
							if(counter==0) break;
							else{
								clickable[m][n]=1;
								counter=-1;
								break;
							}
						case 2:
							counter=1;
							break;
						}
						tempX--; tempY++;
					}//end while()
				}
				counter=0;
			}
		}
		//right-bottom
		for(int m=0;m<8;m++){
			for(int n=0;n<8;n++){
				tempX = m; tempY= n;
				if(matrix[tempX][tempY]==0){
					while(tempX+1<8&&tempY+1<8&&counter!=-1){
						switch(matrix[tempX+1][tempY+1]){
						case 0: counter =-1;
								break;
						case 1:
							if(counter==0) break;
							else{
								clickable[m][n]=1;
								counter=-1;
								break;
							}
						case 2:
							counter=1;
							break;
						}
						tempX++; tempY++;
					}//end while()
				}
				counter=0;
			}
		}
		//left-bottom
		for(int m=0;m<8;m++){
			for(int n=0;n<8;n++){
				tempX = m; tempY= n;
				if(matrix[tempX][tempY]==0){
					while(tempX+1<8&&tempY-1>=0&&counter!=-1){
						switch(matrix[tempX+1][tempY-1]){
						case 0: counter =-1;
								break;
						case 1:
							if(counter==0) break;
							else{
								clickable[m][n]=1;
								counter=-1;
								break;
							}
						case 2:
							counter=1;
							break;
						}
						tempX++; tempY--;
					}//end while()
				}
				counter=0;
			}
		}
		
		//left
		for(int m=0;m<8;m++){
			for(int n=0;n<8;n++){
				tempX = m; tempY= n;
				if(matrix[tempX][tempY]==0){
					while(tempY-1>=0&&counter!=-1){
						switch(matrix[tempX][tempY-1]){
						case 0: counter =-1;
								break;
						case 1:
							if(counter==0) break;
							else{
								clickable[m][n]=1;
								counter=-1;
								break;
							}
						case 2:
							counter=1;
							break;
						}
						tempY--;
					}//end while()
				}
				counter=0;
			}
		}
		//top
		for(int m=0;m<8;m++){
			for(int n=0;n<8;n++){
				tempX = m; tempY= n;
				if(matrix[tempX][tempY]==0){
					while(tempX-1>=0&&counter!=-1){
						switch(matrix[tempX-1][tempY]){
						case 0: counter =-1;
								break;
						case 1:
							if(counter==0) break;
							else{
								clickable[m][n]=1;
								counter=-1;
								break;
							}
						case 2:
							counter=1;
							break;
						}
						tempX--;
					}//end while()
				}
				counter=0;
			}
		}
		//right
		for(int m=0;m<8;m++){
			for(int n=0;n<8;n++){
				tempX = m; tempY= n;
				if(matrix[tempX][tempY]==0){
					while(tempY+1<8&&counter!=-1){
						switch(matrix[tempX][tempY+1]){
						case 0: counter =-1;
								break;
						case 1:
							if(counter==0) break;
							else{
								clickable[m][n]=1;
								counter=-1;
								break;
							}
						case 2:
							counter=1;
							break;
						}
						tempY++;
					}//end while()
				}
				counter=0;
			}
		}
		//bottom
		for(int m=0;m<8;m++){
			for(int n=0;n<8;n++){
				tempX = m; tempY= n;
				if(matrix[tempX][tempY]==0){
					while(tempX+1<8&&counter!=-1){
						switch(matrix[tempX+1][tempY]){
						case 0: counter =-1;
								break;
						case 1:
							if(counter==0) break;
							else{
								clickable[m][n]=1;
								counter=-1;
								break;
							}
						case 2:
							counter=1;
							break;
						}
						tempX++;
					}//end while()
				}
				counter=0;
			}
		}
	}else if(mySide.equals("white")){//유저가 백돌
		//left-top
		for(int m=0;m<8;m++){
			for(int n=0;n<8;n++){
				tempX = m; tempY= n;
				if(matrix[tempX][tempY]==0){
					while(tempX-1>=0&&tempY-1>=0&&counter!=-1){
						switch(matrix[tempX-1][tempY-1]){
						case 0: counter =-1;
								break;
						case 2:
							if(counter==0) break;
							else{
								clickable[m][n]=1;
								counter=-1;
								break;
							}
						case 1:
							counter=1;
							break;
						}
						tempX--; tempY--;
					}//end while()
				}
				counter=0;
			}
		}
		//right-top
		for(int m=0;m<8;m++){
			for(int n=0;n<8;n++){
				tempX = m; tempY= n;
				if(matrix[tempX][tempY]==0){
					while(tempX-1>=0&&tempY+1<8&&counter!=-1){
						switch(matrix[tempX-1][tempY+1]){
						case 0: counter =-1;
								break;
						case 2:
							if(counter==0) break;
							else{
								clickable[m][n]=1;
								counter=-1;
								break;
							}
						case 1:
							counter=1;
							break;
						}
						tempX--; tempY++;
					}//end while()
				}
				counter=0;
			}
		}
		//right-bottom
		for(int m=0;m<8;m++){
			for(int n=0;n<8;n++){
				tempX = m; tempY= n;
				if(matrix[tempX][tempY]==0){
					while(tempX+1<8&&tempY+1<8&&counter!=-1){
						switch(matrix[tempX+1][tempY+1]){
						case 0: counter =-1;
								break;
						case 2:
							if(counter==0) break;
							else{
								clickable[m][n]=1;
								counter=-1;
								break;
							}
						case 1:
							counter=1;
							break;
						}
						tempX++; tempY++;
					}//end while()
				}
				counter=0;
			}
		}
		//left-bottom
		for(int m=0;m<8;m++){
			for(int n=0;n<8;n++){
				tempX = m; tempY= n;
				if(matrix[tempX][tempY]==0){
					while(tempX+1<8&&tempY-1>=0&&counter!=-1){
						switch(matrix[tempX+1][tempY-1]){
						case 0: counter =-1;
								break;
						case 2:
							if(counter==0) break;
							else{
								clickable[m][n]=1;
								counter=-1;
								break;
							}
						case 1:
							counter=1;
							break;
						}
						tempX++; tempY--;
					}//end while()
				}
				counter=0;
			}
		}
		
		//left
		for(int m=0;m<8;m++){
			for(int n=0;n<8;n++){
				tempX = m; tempY= n;
				if(matrix[tempX][tempY]==0){
					while(tempY-1>=0&&counter!=-1){
						switch(matrix[tempX][tempY-1]){
						case 0: counter =-1;
								break;
						case 2:
							if(counter==0) break;
							else{
								clickable[m][n]=1;
								counter=-1;
								break;
							}
						case 1:
							counter=1;
							break;
						}
						tempY--;
					}//end while()
				}
				counter=0;
			}
		}
		//top
		for(int m=0;m<8;m++){
			for(int n=0;n<8;n++){
				tempX = m; tempY= n;
				if(matrix[tempX][tempY]==0){
					while(tempX-1>=0&&counter!=-1){
						switch(matrix[tempX-1][tempY]){
						case 0: counter =-1;
								break;
						case 2:
							if(counter==0) break;
							else{
								clickable[m][n]=1;
								counter=-1;
								break;
							}
						case 1:
							counter=1;
							break;
						}
						tempX--;
					}//end while()
				}
				counter=0;
			}
		}
		//right
		for(int m=0;m<8;m++){
			for(int n=0;n<8;n++){
				tempX = m; tempY= n;
				if(matrix[tempX][tempY]==0){
					while(tempY+1<8&&counter!=-1){
						switch(matrix[tempX][tempY+1]){
						case 0: counter =-1;
								break;
						case 2:
							if(counter==0) break;
							else{
								clickable[m][n]=1;
								counter=-1;
								break;
							}
						case 1:
							counter=1;
							break;
						}
						tempY++;
					}//end while()
				}
				counter=0;
			}
		}
		//bottom
		for(int m=0;m<8;m++){
			for(int n=0;n<8;n++){
				tempX = m; tempY= n;
				if(matrix[tempX][tempY]==0){
					while(tempX+1<8&&counter!=-1){
						switch(matrix[tempX+1][tempY]){
						case 0: counter =-1;
								break;
						case 2:
							if(counter==0) break;
							else{
								clickable[m][n]=1;
								counter=-1;
								break;
							}
						case 1:
							counter=1;
							break;
						}
						tempX++;
					}//end while()
				}
				counter=0;
			}
		}	
	}
	
	
%>
{"clickable":
<%out.print("[");
for(int i=0;i<8;i++){
	out.print("{");
	for(int j=0;j<7;j++){
		out.print("\"row"+(j+1)+"\":"+clickable[i][j]+", ");
	}
	if(i==7){out.print("\"row"+(8)+"\":"+clickable[i][7]+"}]");}
	else{out.print("\"row"+(8)+"\":"+clickable[i][7]+"}, ");}
	out.print("\n");
}
%>}
