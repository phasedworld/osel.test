package osel.test;

import java.util.Scanner;


public class MainApp {

	public static void main(String[] args) {
		int matrix[][] = {
				{0,0,0,0,1,0,0,0},
				{0,0,0,2,0,0,0,0},
				{0,1,2,2,0,0,0,0},
				{0,2,1,1,1,0,0,0},
				{0,2,0,1,1,0,0,0},
				{0,0,0,2,1,1,0,0},
				{0,0,0,0,0,0,0,0},
				{0,0,0,0,0,0,0,0}
		};
		
		
		for(int i=0;i<8;i++){
			for(int j=0;j<8;j++){
				System.out.print(matrix[i][j]);
			}
			System.out.print("\n");
		}
		
		System.out.println("===========출력해요===========");
		
		//기본적으로는 전부 click 불가능
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
		
		for(int i=0;i<8;i++){
			for(int j=0;j<8;j++){
				System.out.print(clickable[i][j]);
			}
			System.out.print("\n");
		}
		
		
		System.out.print("클릭할 칸을 선택해 주세요! > ");
		Scanner scan = new Scanner(System.in);
		int x = scan.nextInt();
		scan.nextLine();
		System.out.print(", ");
		int y = scan.nextInt();
		
		//기존 보드를 resultboard에 옮긴다.
		int resultboard[][] = matrix;
		resultboard[x][y]=1;//백돌이면 이게 2
		
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
		
		
		
		
		for(int i=0;i<8;i++){
			for(int j=0;j<8;j++){
				System.out.print(resultboard[i][j]);
			}
			System.out.print("\n");
		}
		
		
	}

}
