<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인게임</title>
<style>
.readybtn{
  background:orange;
  display:inline-block;
  padding:10px;
}
.readybtn.set{
  background:red;
  color:white;
}
#gameboard{
  position: absolute;
  left:50%; top:50%;
  transform:translate(-50%,-50%);
  display:grid;
  width:600px;
  height:600px;
  grid-template-rows: 12.5% 12.5% 12.5% 12.5% 12.5% 12.5% 12.5% 12.5% ;
  grid-template-columns: 12.5% 12.5% 12.5% 12.5% 12.5% 12.5% 12.5% 12.5% ;
  border:1px solid #333;
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
}
.cells:nth-child(-2n+7),
.cells:nth-child(9) ~ .cells:nth-child(-2n+16),
.cells:nth-child(16) ~ .cells:nth-child(-2n+23),
.cells:nth-child(24) ~ .cells:nth-child(-2n+32),
.cells:nth-child(31) ~ .cells:nth-child(-2n+39),
.cells:nth-child(40) ~ .cells:nth-child(-2n+48),
.cells:nth-child(47) ~ .cells:nth-child(-2n+55),
.cells:nth-child(56) ~ .cells:nth-child(-2n+64){
  background:#089f90;
}
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
<script>
</script>
</head>
<body>
  <div id="gameboard">
  <div class="cells" id="1"><div class="stone">1</div></div><div class="cells" id="2"><div class="stone">2</div></div><div class="cells" id="3"><div class="stone">3</div></div><div class="cells" id="4"><div class="stone">4</div></div><div class="cells" id="5"><div class="stone">5</div></div><div class="cells" id="6"><div class="stone">6</div></div><div class="cells" id="7"><div class="stone">7</div></div><div class="cells" id="8"><div class="stone">8</div></div><div class="cells" id="9"><div class="stone">9</div></div><div class="cells" id="10"><div class="stone">10</div></div><div class="cells" id="11"><div class="stone">11</div></div><div class="cells" id="12"><div class="stone">12</div></div><div class="cells" id="13"><div class="stone">13</div></div><div class="cells" id="14"><div class="stone">14</div></div><div class="cells" id="15"><div class="stone">15</div></div><div class="cells" id="16"><div class="stone">16</div></div><div class="cells" id="17"><div class="stone">17</div></div><div class="cells" id="18"><div class="stone">18</div></div><div class="cells" id="19"><div class="stone">19</div></div><div class="cells" id="20"><div class="stone">20</div></div><div class="cells" id="21"><div class="stone">21</div></div><div class="cells" id="22"><div class="stone">22</div></div><div class="cells" id="23"><div class="stone">23</div></div><div class="cells" id="24"><div class="stone">24</div></div><div class="cells" id="25"><div class="stone">25</div></div><div class="cells" id="26"><div class="stone">26</div></div><div class="cells" id="27"><div class="stone">27</div></div><div class="cells" id="28"><div class="stone">28</div></div><div class="cells" id="29"><div class="stone">29</div></div><div class="cells" id="30"><div class="stone">30</div></div><div class="cells" id="31"><div class="stone">31</div></div><div class="cells" id="32"><div class="stone">32</div></div><div class="cells" id="33"><div class="stone">33</div></div><div class="cells" id="34"><div class="stone">34</div></div><div class="cells" id="35"><div class="stone">35</div></div><div class="cells" id="36"><div class="stone">36</div></div><div class="cells" id="37"><div class="stone">37</div></div><div class="cells" id="38"><div class="stone">38</div></div><div class="cells" id="39"><div class="stone">39</div></div><div class="cells" id="40"><div class="stone">40</div></div><div class="cells" id="41"><div class="stone">41</div></div><div class="cells" id="42"><div class="stone">42</div></div><div class="cells" id="43"><div class="stone">43</div></div><div class="cells" id="44"><div class="stone">44</div></div><div class="cells" id="45"><div class="stone">45</div></div><div class="cells" id="46"><div class="stone">46</div></div><div class="cells" id="47"><div class="stone">47</div></div><div class="cells" id="48"><div class="stone">48</div></div><div class="cells" id="49"><div class="stone">49</div></div><div class="cells" id="50"><div class="stone">50</div></div><div class="cells" id="51"><div class="stone">51</div></div><div class="cells" id="52"><div class="stone">52</div></div><div class="cells" id="53"><div class="stone">53</div></div><div class="cells" id="54"><div class="stone">54</div></div><div class="cells" id="55"><div class="stone">55</div></div><div class="cells" id="56"><div class="stone">56</div></div><div class="cells" id="57"><div class="stone">57</div></div><div class="cells" id="58"><div class="stone">58</div></div><div class="cells" id="59"><div class="stone">59</div></div><div class="cells" id="60"><div class="stone">60</div></div><div class="cells" id="61"><div class="stone">61</div></div><div class="cells" id="62"><div class="stone">62</div></div><div class="cells" id="63"><div class="stone">63</div></div><div class="cells" id="64"><div class="stone">64</div></div>
  </div>
  <div class="readybtn" onClick="ready(usera)">UserA(BLACK) READY...</div>
  <div class="readybtn" onClick="ready(userb)">UserB(WHITE) READY...</div>
  <input id="myId" name="myId" value="" />
</body>
</html>
