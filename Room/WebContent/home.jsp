<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
	<link type="text/css" rel="stylesheet" href="home.css"></link>
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script>
		window.onload = function openpage(){
			document.getElementById("game_info").style.display="block";
			document.getElementById("page-wrap").style.filter = 'blur(2px)';
		}
		
		/*
		var blinkInterval = setInterval(catBlink,1000);
		function catBlink(){
			var time = new Date();
			var second = time.getSeconds();
			if(second%6 == 0){
				$(".cat_img").attr("src","res/img/cat_blink.png");
			}else if(second%6 == 1){
				$(".cat_img").attr("src","res/img/cat.png");
			}
		}
		catBlink();
		if(isCatMoved || isKF94Found){
			clearInterval(blinkInterval);
		}
		*/
		
		var plant_cnt = 0;
		var upper_chest_cnt = 0;
		var lower_chest_cnt = 0;
		var trashbin_cnt = 0;
		var bag_cnt = 0;
		var flower_cnt = 0;
		var bed_cnt = 0;
		var closet_cnt = 0;
		var cat_cnt = 0;
		
		var money = (plant_cnt + upper_chest_cnt + lower_chest_cnt + trashbin_cnt + bag_cnt + flower_cnt + bed_cnt + closet_cnt + cat_cnt)*10;
		
		document.getElementById("money").innerHTML = "돈 : "+money;
		
		var isUpperChestOpen = false;
		var isUpperChestClear = false;
		var isLowerChestOpen = false;
		var isLowerChestClear = false;
		var isFlowerBroken = false;
		var isCatMeow = false;
		var isCatMoved = false;
		var isCatLeft = false;
		var isBagOpen = false;
		
		var isKF94Found = false;
		var isKF80Found = false;
		var isDentalFound = false;
		var isFabricFound = false;
		var isCleanerFound = false;
		var isKey1Found = false;
		var isKey2Found = false;
		var isCatsnackFound = false;
		
		
		
		function plant_click(){
			if(isDentalFound){
			}else{
				document.getElementById('itemSound').play();
				plant_cnt = plant_cnt+1;
				isDentalFound = true;
				openDentalModal();
				$(".plant_img").attr("src","res/img/plant_clicked.png");
				$(".dental_icon").attr("src","res/img/icon/dental_icon.png");
			}
		}
		
		function upper_chest_click(){
			if(isKey2Found){
				if(isKF80Found){
					
				}else if(isUpperChestOpen){
					document.getElementById('itemSound').play();
					isKF80Found = true;
					openKF80Modal();
					$(".kf80_icon").attr("src","res/img/icon/kf80_icon.png");
					$(".chest_img").attr("src","res/img/lower_chest_open_clicked_upper_chest_open_clicked.png");
				}else{
					document.getElementById('clothSound').play();
					$(".chest_img").attr("src","res/img/lower_chest_open_clicked_upper_chest_open.png");
					$(".key2_icon").removeAttr("style").hide();
					isUpperChestOpen=true;
				}			
			} else if(isLowerChestClear){
				upper_chest_cnt = upper_chest_cnt + 1;
				if (upper_chest_cnt%2 == 0){
					document.getElementById('lockedSound').play();
					$(".chest_img").attr("src","res/img/lower_chest_open_clicked.png");
				} else if (upper_chest_cnt%3 == 0){
					document.getElementById('lockedSound').play();
					$(".chest_img").attr("src","res/img/lower_chest_open_clicked_upper_chest_click1.png");
				} else{
					document.getElementById('lockedSound').play();
					$(".chest_img").attr("src","res/img/lower_chest_open_clicked_upper_chest_click2.png");
				}
			} else {
				upper_chest_cnt = upper_chest_cnt + 1;
				if (upper_chest_cnt%2 == 0){
					document.getElementById('lockedSound').play();
					$(".chest_img").attr("src","res/img/chest.png");
				} else if (upper_chest_cnt%3 == 0){
					document.getElementById('lockedSound').play();
					$(".chest_img").attr("src","res/img/upper_chest_click1.png");
				} else{
					document.getElementById('lockedSound').play();
					$(".chest_img").attr("src","res/img/upper_chest_click2.png");
				}
			}
		}
		
		function lower_chest_click(){
			if(isKey2Found){}else if(isLowerChestOpen){
				document.getElementById('itemSound').play();
				isKey2Found = true;
				openKey2Modal();
				$(".key2_icon").removeAttr("style").show();
				$(".chest_img").attr("src","res/img/lower_chest_open_clicked.png");
				isLowerChestClear = true;
			}else if (lower_chest_cnt>=10){
				document.getElementById('clothSound').play();
				lower_chest_cnt = lower_chest_cnt +1;
				$(".chest_img").attr("src","res/img/lower_chest_open.png");
				isLowerChestOpen = true;
			} else if (lower_chest_cnt%2 == 0){
				document.getElementById('lockedSound').play();
				lower_chest_cnt = lower_chest_cnt +1;
				$(".chest_img").attr("src","res/img/chest.png");
			} else if (lower_chest_cnt%3 == 0){
				document.getElementById('lockedSound').play();
				lower_chest_cnt = lower_chest_cnt +1;
				$(".chest_img").attr("src","res/img/lower_chest_click1.png");
			} else{
				document.getElementById('lockedSound').play();
				lower_chest_cnt = lower_chest_cnt +1;
				$(".chest_img").attr("src","res/img/lower_chest_click2.png");
			}
		}
		
		function trashbin_click(){
			
			if(trashbin_cnt == 0){
				document.getElementById('moneySound').play();
				openMoneyModal();
				trashbin_cnt = 500;
			}else if(trashbin_cnt > 510){
				document.getElementById('trashbinSound').play();
				openDangerModal();
			}else if (trashbin_cnt == 510){
				document.getElementById('trashbinSound').play();
				$(".trashbin_img").attr("src","res/img/trashbin_clicked.png");
				trashbin_cnt = trashbin_cnt + 1;
			} else if(trashbin_cnt%2 == 0){
				document.getElementById('clothSound').play();
				trashbin_cnt = trashbin_cnt + 1;
				$(".trashbin_img").attr("src","res/img/trashbin.png");
			} else if(trashbin_cnt%3 == 0){
				document.getElementById('smallClothSound').play();
				trashbin_cnt = trashbin_cnt + 1;
				$(".trashbin_img").attr("src","res/img/trashbin_click1.png");
			} else {
				document.getElementById('clothSound').play();
				trashbin_cnt = trashbin_cnt + 1;
				$(".trashbin_img").attr("src","res/img/trashbin_click2.png");
			}
		}
		function bag_click(){
			
			if(isCleanerFound){}else{
				if (isBagOpen == true){
					document.getElementById('itemSound').play();
					isCleanerFound = true;
					openCleanerModal();
					$(".bag_img").attr("src","res/img/bag_open_clicked.png");
					$(".cleaner_icon").attr("src","res/img/icon/cleaner_icon.png");
				}else {
					document.getElementById('bagSound').play();
					bag_cnt = bag_cnt+1;
					$(".bag_img").attr("src","res/img/bag_open.png");
					isBagOpen = true;
				}
			}
		}
		function flower_click(){
			if(isFlowerBroken){
				
			} else if(flower_cnt >=10) {
				document.getElementById('flowerBrokenSound').play();
				flower_cnt = flower_cnt +1;
				isFlowerBroken = true;
				$(".flower_img").attr("src","res/img/flower_broken.png");
				isFlowerBroken == true;
			} else if (flower_cnt %2 == 0){
				document.getElementById('flowerSound').play();
				flower_cnt = flower_cnt +1;
				$(".flower_img").attr("src","res/img/flower.png");
			} else if (flower_cnt%3 == 0){
				document.getElementById('flowerSound').play();
				flower_cnt = flower_cnt +1;
				$(".flower_img").attr("src","res/img/flower_click1.png");
			} else {
				document.getElementById('flowerSound').play();
				flower_cnt = flower_cnt +1;
				$(".flower_img").attr("src","res/img/flower_click2.png");
			}
		}
		function flower_broken_click(){
			if(!isKey1Found && isFlowerBroken){
				document.getElementById('itemSound').play();
				isKey1Found = true;
				openKey1Modal();
				$(".key1_icon").removeAttr("style").show();
				$(".flower_img").attr("src","res/img/flower_broken_clicked.png");
			}
		}
		function bed_click(){
			if(isFabricFound){
				
			}else if(bed_cnt >= 2){
				document.getElementById('itemSound').play();
				isFabricFound = true;
				openFabricModal();
				$(".bed_img").attr("src","res/img/bed_click3.png");
				$(".fabric_icon").attr("src","res/img/icon/fabric_icon.png");
			} else if(bed_cnt == 1){
				document.getElementById('smallClothSound').play();
				bed_cnt = bed_cnt+1;
				$(".bed_img").attr("src","res/img/bed_click2.png");
			} else {
				document.getElementById('clothSound').play();
				bed_cnt = bed_cnt+1;
				$(".bed_img").attr("src","res/img/bed_click1.png");
			}
		}
		
		var closet_open = false;
		var closet_open_clicked = false;
		
		function closet_click(){
			if(isKey1Found){
				if(isCatsnackFound){
					
				} else if(closet_open_clicked){
					document.getElementById('itemSound').play();
					closet_cnt = closet_cnt +1;
					isCatsnackFound = true;
					openCatsnackModal();
					$(".catsnack_icon").removeAttr("style").show();
					$(".closet_img").attr("src","res/img/closet_open_clicked2.png");
				} else if(closet_open){
					document.getElementById('moneySound').play();
					closet_cnt = closet_cnt +1;
					$(".closet_img").attr("src","res/img/closet_open_clicked1.png");
					closet_cnt = closet_cnt + 1000;
					closet_open_clicked = true;
					openMoneyModal();
				} else {
					document.getElementById('trashbinSound').play();
					closet_cnt = closet_cnt +1;
					$(".key1_icon").removeAttr("style").hide();
					$(".closet_img").attr("src","res/img/closet_open.png");
					closet_open = true;
					
				}
			} else if(closet_cnt%2 == 0){
				document.getElementById('lockedSound').play();
				closet_cnt = closet_cnt +1;
				$(".closet_img").attr("src","res/img/closet.png");
			} else if (closet_cnt%3 ==0){
				document.getElementById('lockedSound').play();
				closet_cnt = closet_cnt +1;
				$(".closet_img").attr("src","res/img/closet_click1.png");
			} else {
				document.getElementById('lockedSound').play();
				closet_cnt = closet_cnt +1;
				$(".closet_img").attr("src","res/img/closet_click2.png");
			}
		}
		
		function cat_click(){
			if (!isCatsnackFound) {
				cat_cnt = cat_cnt+1;
				var meowInterval = setInterval(catMeow,2000);
				catMeow();
				function catMeow(){
					if(!isCatMeow){
						$(".cat_img").attr("src","res/img/cat_meow.png");
						document.getElementById('catSound').play();
						isCatMeow = true;
					} else {
						$(".cat_img").attr("src","res/img/cat.png");
						clearInterval(meowInterval);
						isCatMeow = false;
					}
				}
			} else {
				if(isKF94Found){
					
				}else if(isCatMoved){
					document.getElementById('itemSound').play();
					cat_cnt = cat_cnt+1;
					isKF94Found = true;
					openKF94Modal();
					$(".kf94_icon").attr("src","res/img/icon/kf94_icon.png");
					$(".cat_img").attr("src","res/img/cat_move.png");
				} else {
					document.getElementById('catSound').play();
					cat_cnt = cat_cnt+1;
					$(".catsnack_icon").removeAttr("style").hide();
					$(".cat_img").attr("src","res/img/cat_leave.png");
					isCatMoved = true;
				}
			}
		}
		
		function kf94_icon_click(){
			if(isKF94Found){
				openKF94Modal();
			}
		}
		function kf80_icon_click(){
			if(isKF80Found){
				openKF80Modal();
			}
		}
		function fabric_icon_click(){
			if(isFabricFound){
				openFabricModal();
			}
		}
		function dental_icon_click(){
			if(isDentalFound){
				openDentalModal();
			}
		}
		function cleaner_icon_click(){
			if(isCleanerFound){
				openCleanerModal();
			}
		}
		function key1_icon_click(){
			if(isKey1Found){
				openKey1Modal();
			}
		}
		function key2_icon_click(){
			if(isKey2Found){
				openKey2Modal();
			}
		}
		function catsnack_icon_click(){
			if(isCatsnackFound){
				openCatsnackModal();
			}
		}
		
		
		
		
		function closeModal(){
			if(isKF94Found && isKF80Found && isDentalFound && isFabricFound && isCleanerFound){
				var modalArray = document.getElementsByClassName("modal");
				for (var i = 0; i< modalArray.length; i++){
					modalArray[i].style.display="none";
				}
				document.getElementById("page-wrap").style.filter = 'none';
				document.getElementById('clearSound').play();
				openGameClearModal();
				
			}else{
				var modalArray = document.getElementsByClassName("modal");
				for (var i = 0; i< modalArray.length; i++){
					modalArray[i].style.display="none";
				}
				document.getElementById("page-wrap").style.filter = 'none';
			}
		}
		
		function openKF94Modal(){
			document.getElementById("kf94_info").style.display="block";
			document.getElementById("page-wrap").style.filter = 'blur(2px)';
		}
		
		function openKF80Modal(){
			document.getElementById("kf80_info").style.display="block";
			document.getElementById("page-wrap").style.filter = 'blur(2px)';
		}
		function openDentalModal(){
			document.getElementById("dental_info").style.display="block";
			document.getElementById("page-wrap").style.filter = 'blur(2px)';
		}
		function openFabricModal(){
			document.getElementById("fabric_info").style.display="block";
			document.getElementById("page-wrap").style.filter = 'blur(2px)';
		}
		function openCleanerModal(){
			document.getElementById("cleaner_info").style.display="block";
			document.getElementById("page-wrap").style.filter = 'blur(2px)';
		}
		function openKey1Modal(){
			document.getElementById("key1_info").style.display="block";
			document.getElementById("page-wrap").style.filter = 'blur(2px)';
		}
		function openKey2Modal(){
			document.getElementById("key2_info").style.display="block";
			document.getElementById("page-wrap").style.filter = 'blur(2px)';
		}
		function openCatsnackModal(){
			document.getElementById("catsnack_info").style.display="block";
			document.getElementById("page-wrap").style.filter = 'blur(2px)';
		}
		function openDangerModal(){
			document.getElementById("danger_info").style.display="block";
			document.getElementById("page-wrap").style.filter = 'blur(2px)';
		}
		function openMoneyModal(){
			document.getElementById("money_info").style.display="block";
			document.getElementById("page-wrap").style.filter = 'blur(2px)';
		}
		function openGameClearModal(){
			document.getElementById("game_clear").style.display="block";
			document.getElementById("page-wrap").style.filter = 'blur(2px)';
		}
	</script>
</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
	
	<audio src="res/audio/bag.wav" id="bagSound"></audio>
	<audio src="res/audio/cat.mp3" id="catSound"></audio>
	<audio src="res/audio/cloth.wav" id="clothSound"></audio>
	<audio src="res/audio/flower_broken.mp3" id="flowerBrokenSound"></audio>
	<audio src="res/audio/flower.mp3" id="flowerSound"></audio>
	<audio src="res/audio/item.mp3" id="itemSound"></audio>
	<audio src="res/audio/locked.wav" id="lockedSound"></audio>
	<audio src="res/audio/money.mp3" id="moneySound"></audio>
	<audio src="res/audio/small_cloth.wav" id="smallClothSound"></audio>
	<audio src="res/audio/trashbin.wav" id="trashbinSound"></audio>
	<audio src="res/audio/clear.mp3" id="clearSound"></audio>
	
	<p id="money">돈: 0</p>
	
	<div id="page-wrap">
		<div id="room" align="center">
			<img src="res/img/room.png">
			
			<div id="plant">
				<img src="res/img/plant.png" class="plant_img">
			</div>
			<div id="chest">
				<img src="res/img/chest.png" class="chest_img">
			</div>
			<div id="trashbin" onclick="trashbin_click()">
				<img src="res/img/trashbin.png" class="trashbin_img">
			</div>
			<div id="bag" onclick="bag_click()">
				<img src="res/img/bag.png" class="bag_img">
			</div>
			<div id="flower">
				<img src="res/img/flower.png" class="flower_img">
			</div>
			<div id="bed">
				<img src="res/img/bed.png" class="bed_img">
			</div>
			<div id="closet">
				<img src="res/img/closet.png" class="closet_img">
			</div>
			
			
			
			<div id="bed_clickable" onclick="bed_click()">
			</div>
			<div id="closet_clickable" onclick="closet_click()">
			</div>
			<div id="plant_clickable" onclick="plant_click()">
			</div>
			<div id="flower_clickable" onclick="flower_click()">
			</div>
			<div id="flower_broken_clickable" onclick ="flower_broken_click()">
			</div>
			<div id="upper_chest_clickable" onclick="upper_chest_click()">
			</div>
			<div id="lower_chest_clickable" onclick="lower_chest_click()">
			</div>
			
			<div id="cat" onclick="cat_click()">
				<img src="res/img/cat.png" class="cat_img">
			</div>
			
			<div id="inventory">
				찾을 물건들 : 
				<img src="res/img/icon/kf_icon_notfound.png" class="kf94_icon" onclick="kf94_icon_click()">
				<img src="res/img/icon/kf_icon_notfound.png" class="kf80_icon" onclick="kf80_icon_click()">
				<img src="res/img/icon/dental_icon_notfound.png" class="dental_icon" onclick="dental_icon_click()">
				<img src="res/img/icon/fabric_icon_notfound.png" class="fabric_icon" onclick="fabric_icon_click()">
				<img src="res/img/icon/cleaner_icon_notfound.png" class="cleaner_icon" onclick="cleaner_icon_click()">
				<br>
				<img src="res/img/icon/key1_icon.png" class="key1_icon" style="display:none;" onclick="key1_icon_click()">
				<img src="res/img/icon/key2_icon.png" class="key2_icon" style="display:none;" onclick="key2_icon_click()">
				<img src="res/img/icon/catsnack_icon.png" class="catsnack_icon" style="display:none;" onclick="catsnack_icon_click()">
			</div>
		</div>
	</div>
	
	<div id="game_info" class="modal">
		<span class="close cursor" onclick="closeModal()">&times;</span>
		<div class="modal-content" align="center">
			<br><br><h3>오늘은 시험날입니다.</h3>
			<h1>외출 준비 시간</h1><br>
			<div>
			<img src="res/img/icon/kf94_icon.png">
			<img src="res/img/icon/kf80_icon.png">
			<img src="res/img/icon/dental_icon.png">
			<img src="res/img/icon/fabric_icon.png">
			<img src="res/img/icon/cleaner_icon.png">
			</div>
			<div style="position: relative; bottom:45px; z-index:2;">
			<img src="res/img/icon/kf_icon_notfound.png" id="thumb">
			<img src="res/img/icon/kf_icon_notfound.png" id="thumb">
			<img src="res/img/icon/dental_icon_notfound.png" id="thumb">
			<img src="res/img/icon/fabric_icon_notfound.png" id="thumb">
			<img src="res/img/icon/cleaner_icon_notfound.png" id="thumb">
			</div>
			<p>각종 생활방역에 필요한 물건들을 찾아보세요!</p><br><br><br>
			<a href ="#" onclick="closeModal()">시작</a>
		</div>
	</div>
	
	<div id="kf94_info" class="modal">
		<span class="close cursor" onclick="closeModal()">&times;</span>
		<div class="modal-content" align="center">
			<h3>물건을 찾았습니다!</h3>
			<h1>KF94 마스크</h1>
			<img src="res/img/kf94.png">
			<p>KF(Korea Filter)란 미세입자 차단율의 정도를 의미합니다. KF94이상 착용이 반드시 필요한 경우는 코로나 19 의심환자를 돌보는 경우입니다.</p>
			<p id="ref">참고: 식품의약품안전처. 2020.3.4. [한시적 지침] 마스크 사용 개정 권고사항.</p>
			<a href ="#" onclick="closeModal()">확인</a>
		</div>
	</div>
	
	<div id="kf80_info" class="modal">
		<span class="close cursor" onclick="closeModal()">&times;</span>
		<div class="modal-content" align="center">
			<h3>물건을 찾았습니다!</h3>
			<h1>KF80 마스크</h1>
			<img src="res/img/kf80.png">
			<p>KF(Korea Filter)란 미세입자 차단율의 정도를 의미합니다. KF80 이상이 필요한 경우는 의료기관을 방문하는 경우, 기침과 콧물 등 호흡기 증상이 있는 경우, 감염과 전파 위험이 높은 직업군 종사자이거나 건강 취약 계층, 기저질환자 등이 환기가 잘 안되는 공간에서 2미터 이내에 다른사람과 접촉하는 경우입니다.</p>
			<p id="ref">참고: 식품의약품안전처. 2020.3.4. [한시적 지침] 마스크 사용 개정 권고사항.</p>
			<a href ="#" onclick="closeModal()">확인</a>
		</div>
	</div>
	
	<div id="fabric_info" class="modal">
		<span class="close cursor" onclick="closeModal()">&times;</span>
		<div class="modal-content" align="center">
			<h3>물건을 찾았습니다!</h3>
			<h1>면 마스크</h1>
			<img src="res/img/fabric.png">
			<p>정전기필터 장착 면마스크를 사용할 경우 KF80만큼의 효과를 낼 수 있습니다. 정전기필터는 찢어질 수 있으므로 장착시 주의가 필요합니다. 또한 정전기필터는 수분에 노출되면 기능이 떨어질 가능성이 있으므로 세탁해서는 안 됩니다.</p>
			<p id="ref">참고: 식품의약품안전처. 2020.3.4. [한시적 지침] 마스크 사용 개정 권고사항.</p>
			<a href ="#" onclick="closeModal()">확인</a>
		</div>
	</div>
	
	<div id="dental_info" class="modal">
		<span class="close cursor" onclick="closeModal()">&times;</span>
		<div class="modal-content" align="center">
			<h3>물건을 찾았습니다!</h3>
			<h1>덴탈 마스크</h1>
			<img src="res/img/dental.png">
			<p>덴탈마스크는 의료인이 진료, 치료, 수술 시 감염 예방을 위한 마스크로 KF 수치가 따로 없는 마스크입니다. 덴탈마스크는 KF기준 55~80%정도의 비말을 차단할 수 있습니다.</p>
			<p id="ref">참고: 식품의약품안전처. 2020.6.16. [비말 차단용 마스크] 더 필요한 사람에게 양보해 주세요!</p>
			<a href ="#" onclick="closeModal()">확인</a>
		</div>
	</div>
	
	<div id="cleaner_info" class="modal">
		<span class="close cursor" onclick="closeModal()">&times;</span>
		<div class="modal-content" align="center">
			<h3>물건을 찾았습니다!</h3>
			<h1>손소독제</h1>
			<img src="res/img/cleaner.png">
			<p>손소독제는 피부 살균과 소독을 위한 의약외품입니다. 손소독제에 알코올 농도가 높으면 피부를 건조하게 하므로 글리세린 등 보습 성분이 강조된 제품을 선택하면 건조함을 피할 수 있습니다. 손소독제 사용 시에는 눈, 구강 점막과 가은 부위에 직접 닿지 않도록 주의해주세요.</p>
			<p id="ref">참고: 식품의약품안전처. 2020.2.25. 손소독제 &amp; 손세정제 차이점에 대해 아시나요?</p>
			<a href ="#" onclick="closeModal()">확인</a>
		</div>
	</div>
	
	<div id="key1_info" class="modal">
		<span class="close cursor" onclick="closeModal()">&times;</span>
		<div class="modal-content" align="center">
			<h3>물건을 찾았습니다!</h3>
			<h1>열쇠</h1>
			<img src="res/img/key1.png">
			<p>어디에 쓰는 물건일까요?</p>
			<a href ="#" onclick="closeModal()">확인</a>
		</div>
	</div>
	
	<div id="key2_info" class="modal">
		<span class="close cursor" onclick="closeModal()">&times;</span>
		<div class="modal-content" align="center">
			<h3>물건을 찾았습니다!</h3>
			<h1>열쇠</h1>
			<img src="res/img/key2.png">
			<p>어디에 쓰는 물건일까요?</p>
			<a href ="#" onclick="closeModal()">확인</a>
		</div>
	</div>
	
	<div id="catsnack_info" class="modal">
		<span class="close cursor" onclick="closeModal()">&times;</span>
		<div class="modal-content" align="center">
			<h3>물건을 찾았습니다!</h3>
			<h1>고양이 간식</h1>
			<img src="res/img/catsnack.png">
			<p>어디에 쓰는 물건일까요?</p>
			<a href ="#" onclick="closeModal()">확인</a>
		</div>
	</div>
	
	<div id="danger_info" class="modal">
		<span class="close cursor" onclick="closeModal()">&times;</span>
		<div class="modal-content" align="center">
			<h3>조심하세요!</h3>
			<h1>위생 경보</h1>
			<img src="res/img/danger.png">
			<p>개인 방역을 위해서는 위생 관리가 철저해야합니다.</p>
			<a href ="#" onclick="closeModal()">확인</a>
		</div>
	</div>
	
	<div id="money_info" class="modal">
		<span class="close cursor" onclick="closeModal()">&times;</span>
		<div class="modal-content" align="center">
			<h3>횡재했다!</h3>
			<h1>돈 발견</h1>
			<img src="res/img/money.png">
			<p>숨겨진 돈을 찾아냈습니다!</p>
			<a href ="#" onclick="closeModal()">확인</a>
		</div>
	</div>
	
	<div id="game_clear" class="modal">
		<span class="close cursor" onclick="closeModal()">&times;</span>
		<div class="modal-content" align="center">
			<br><br>
			<h1>축하합니다!</h1><br>
			<h3>모든 물건들을 찾았습니다.</h3>
			<div>
			<img src="res/img/icon/kf94_icon.png">
			<img src="res/img/icon/kf80_icon.png">
			<img src="res/img/icon/dental_icon.png">
			<img src="res/img/icon/fabric_icon.png">
			<img src="res/img/icon/cleaner_icon.png">
			</div>
			<p>이제 밖으로 나갈 준비가 끝났습니다!</p><br><br><br>
			<a href ="#" onclick="closeModal()">다음 단계로</a>
		</div>
	</div>
	
</body>
</html>