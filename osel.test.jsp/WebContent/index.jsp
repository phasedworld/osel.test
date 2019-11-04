<%@page import="osel.test.gameboard.dao.GameBoardDaoImpl"%>
<%@page import="osel.test.gameboard.dao.GameBoardDao"%>
<%@page import="osel.test.gameboard.domain.GameBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인게임 화면</title>
<style>
#gameboard{
  position: absolute;
  left:50%; top:50%;
  transform:translate(-50%,-50%);
  display:grid;
  width:800px;
  height:800px;
  grid-template-rows: 12.5% 12.5% 12.5% 12.5% 12.5% 12.5% 12.5% 12.5% ;
  grid-template-columns: 12.5% 12.5% 12.5% 12.5% 12.5% 12.5% 12.5% 12.5% ;
  border:1px solid #333;
}
.readybtn{
  background:orange;
  display:inline-block;
  padding:10px;
}
.readybtn.set{
  background:red;
  color:white;
}
.cells{
  display:flex;
  justify-content: center;
  align-items: center;
  font-size:30px;
  background:#26b899;
}
.cells.clickable{
background:plum;
cursor:pointer;
}
/* .cells:nth-child(-2n+7),
.cells:nth-child(9) ~ .cells:nth-child(-2n+16),
.cells:nth-child(16) ~ .cells:nth-child(-2n+23),
.cells:nth-child(24) ~ .cells:nth-child(-2n+32),
.cells:nth-child(31) ~ .cells:nth-child(-2n+39),
.cells:nth-child(40) ~ .cells:nth-child(-2n+48),
.cells:nth-child(47) ~ .cells:nth-child(-2n+55),
.cells:nth-child(56) ~ .cells:nth-child(-2n+64){
  background:#089f90;
} */
.cells.black .stone{
  background:#333;
}
.cells.white .stone{
  background:ivory;
}
.stone{
	width:80%;
	height:80%;
	background:transparent;
	border-radius:50px;
}
</style>
<script src="res/js/jquery-3.4.1.min.js"></script>
<script>
var curTurn = 0; //현재 턴 저장
//커밋 됩니까
var row1 = [];
var row2 = [];
var row3 = [];
var row4 = [];
var row5 = [];
var row6 = [];
var row7 = [];
var row8 = [];
var cells = [];

var load = setInterval("loadGame()", 4000);
//1. 게임 로드
function loadGame(){
	ajaxURL='loadgame.jsp?gameId='+1;
	   $.ajax({
	      url:ajaxURL,
	      dataType:'json',
	      success:function(info){
	    	  console.log('게임의 턴과 상대 정보 로드..');
	    	  if(info.turn!=curTurn){//게임 시작 또는 턴 변경시.
	    		//[중요]나의 턴인가? 흑돌->turn%2=1, 백돌->turn%2=0
	    				
	    		console.log('턴 변경!'+info.turn%2);
	    		getBoard();
	    		console.info('턴 변경에 따라흑백돌 함께 보드 불러옴');
	    		if(($('#mySide').val()=='black'&&(info.turn)%2==1)||($('#mySide').val()=='white'&&(info.turn)%2==0)){//내 턴임
	    			clearInterval(load);
	    			console.info('나의 차례-clearInterval');
	    			getClickable();
	    		}else{//내 턴 아님
	    			console.info('상대 차례 - Interval 지속');
	    			curTurn = info.turn;
	    		}
	    		
	    	  }
	      }
	});
}
//2. 게임 준비시 불린다
function ready(me, name){
  ajaxURL='setReady.jsp?gameId='+1+'&userId='+name;
    $.ajax({
      url:ajaxURL,
      dataType:'json',
      success:function(data){
    	$('#mySide').val(data.mySide);// 흑돌 black, 백돌 white 문자열 저장
    	$(me).addClass('set');
        if(data.result==1){
          console.log(data.mySide+'게임을 시작합니다...');
        }else{
          console.log(data.mySide+'준비를 완료합니다...');
        }
      }
    });
}
//3. 보드를 가져올 때에 불린다.
function getBoard(){
	ajaxURL='getBoard.jsp';
	   $.ajax({
	      url:ajaxURL,
	      dataType:'json',
	      success:function(data){
	         console.log($('#mySide').val()+'의 보드를 가져오는데에 성공');
	         for(k=0;k<8;k++){
	        	 row1[k] = data.board[k].row1;
	        	 row2[k] = data.board[k].row2;
	        	 row3[k] = data.board[k].row3;
	        	 row4[k] = data.board[k].row4;
	        	 row5[k] = data.board[k].row5;
	        	 row6[k] = data.board[k].row6;
	        	 row7[k] = data.board[k].row7;
	        	 row8[k] = data.board[k].row8;
	         }
	         cells.push(row1);
	         cells.push(row2);
	         cells.push(row3);
	         cells.push(row4);
	         cells.push(row5);
	         cells.push(row6);
	         cells.push(row7);
	         cells.push(row8);
	         
	         for(i=0;i<8;i++){
	        	 for(j=0;j<8;j++){
	        		 console.log(cells[i][j]);
	        		 if(cells[i][j]==1){
	        			 //돌의 색상 변경
	        			 $('#'+(i*8+j+1)).removeClass("white");
	        			 $('#'+(i*8+j+1)).addClass("black");
	        		 }else if(cells[i][j]==2){
	        			 $('#'+(i*8+j+1)).removeClass("black");
	        			 $('#'+(i*8+j+1)).addClass("white");
	        		 }
	        	 }
	         }
	      }
	   });
}

//4. 선택 위치 변경시 불린다.
function getClickable(){
	ajaxURL='getClickable.jsp?mySide='+$('#mySide').val();
	   $.ajax({
	      url:ajaxURL,
	      dataType:'json',
	      success:function(data){
	         console.log($('#mySide').val()+'이 둘 차례!');
	         for(k=0;k<8;k++){
	        	 row1[k] = data.clickable[k].row1;
	        	 row2[k] = data.clickable[k].row2;
	        	 row3[k] = data.clickable[k].row3;
	        	 row4[k] = data.clickable[k].row4;
	        	 row5[k] = data.clickable[k].row5;
	        	 row6[k] = data.clickable[k].row6;
	        	 row7[k] = data.clickable[k].row7;
	        	 row8[k] = data.clickable[k].row8;
	         }
	         cells.push(row1);
	         cells.push(row2);
	         cells.push(row3);
	         cells.push(row4);
	         cells.push(row5);
	         cells.push(row6);
	         cells.push(row7);
	         cells.push(row8);
	         
	         for(i=0;i<8;i++){
	        	 for(j=0;j<8;j++){
	        		 //console.log(cells[i][j]);
	        		 if(cells[i][j]==1){
	        			 //백그라운드색상과(후에 변경) onClick을 준다.
	        			 $('#'+(i*8+j+1)).addClass("clickable");
	        			 $('#'+(i*8+j+1)).on("click", function(e){dropStone($(this).attr('id'))})
	        		 }else{
	        			 $('#'+(i*8+j+1)).removeClass("clickable");
	        			 $('#'+(i*8+j+1)).off("click");
	        		 }
	        	 }
	         }//it works! 지은살려
	      },
	      /* error:function(error){
	    	  getClickable();
	      } */
	   });
}

//5. 칸 선택시 불린다.
function dropStone(idx){
	ajaxURL='dropstone.jsp?gameId='+1+'&cellIdx='+idx+'&mySide='+$('#mySide').val();
	   $.ajax({
	      url:ajaxURL,
	      dataType:'json',
	      success:function(data){
	         if(data.success==1){
	        	 load = setInterval("loadGame()", 4000);
	         }
	      }
	   });
}
</script>
</head>
<body>
  <div id="gameboard">
  <%for(int c =1;c<65;c++){
	  out.print("<div class=\"cells\" id=\""+c+"\" onClick=\"send()\"><div class=\"stone\">"+c+"</div></div>");
  }%>
  </div>
  <div class="readybtn" onClick="ready(this,'usera')">UserA(BLACK) READY...</div>
  <div class="readybtn" onClick="ready(this,'userb')">UserB(WHITE) READY...</div>
  <a href="http://localhost:8085/">나를 누르면 Node.js 서버랑 연결이 됩니다!</a>
  <input id="mySide" name="mySide" value="" />
</body>
</html>