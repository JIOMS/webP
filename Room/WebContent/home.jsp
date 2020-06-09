
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	<link type="text/css" rel="stylesheet" href="home.css"></link>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script>
		var plant_cnt = 0;
		var upper_chest_cnt = 0;
		var lower_chest_cnt = 0;
		var trashbin_cnt = 0;
		var bag_cnt = 0;
		var flower_cnt = 0;
		var bed_cnt = 0;
		var closet_cnt = 0;
		var cat_cnt = 0;
		
		var isUpperChestOpen = false;
		var isUpperChestClear = false;
		var isLowerChestOpen = false;
		var isLowerChestClear = false;
		var isFlowerBroken = false;
		var isCatMeow = false;
		var isCatMoved = false;
		var isBagOpen = false;
		
		function plant_click(){
			$(".plant_img").attr("src","res/img/plant_clicked.png");
		}
		
		function upper_chest_click(){
			upper_chest_cnt = upper_chest_cnt + 1;
			if(isUpperChestOpen == true){
				
			} else if(isLowerChestClear == true){
				if (upper_chest_cnt%2 == 0){
					$(".chest_img").attr("src","res/img/lower_chest_open_clicked.png");
				} else if (upper_chest_cnt%3 == 0){
					$(".chest_img").attr("src","res/img/lower_chest_open_clicked_upper_chest_click1.png");
				} else{
					$(".chest_img").attr("src","res/img/lower_chest_open_clicked_upper_chest_click2.png");
				}
			} else {
				if (upper_chest_cnt%2 == 0){
					$(".chest_img").attr("src","res/img/chest.png");
				} else if (upper_chest_cnt%3 == 0){
					$(".chest_img").attr("src","res/img/upper_chest_click1.png");
				} else{
					$(".chest_img").attr("src","res/img/upper_chest_click2.png");
				}
			}
		}
		
		function lower_chest_click(){
			lower_chest_cnt = lower_chest_cnt +1;
			if(isLowerChestOpen == true){
				$(".chest_img").attr("src","res/img/lower_chest_open_clicked.png");
				isLowerChestClear = true;
			}else if (lower_chest_cnt>=20){
				$(".chest_img").attr("src","res/img/lower_chest_open.png");
				isLowerChestOpen = true;
			} else if (lower_chest_cnt%2 == 0){
				$(".chest_img").attr("src","res/img/chest.png");
			} else if (lower_chest_cnt%3 == 0){
				$(".chest_img").attr("src","res/img/lower_chest_click1.png");
			} else{
				$(".chest_img").attr("src","res/img/lower_chest_click2.png");
			}
		}
		
		function trashbin_click(){
			trashbin_cnt = trashbin_cnt + 1;
			if (trashbin_cnt >= 10){
				$(".trashbin_img").attr("src","res/img/trashbin_clicked.png");
			} else if(trashbin_cnt%2 == 0){
				$(".trashbin_img").attr("src","res/img/trashbin.png");
			} else if(trashbin_cnt%3 == 0){
				$(".trashbin_img").attr("src","res/img/trashbin_click1.png");
			} else {
				$(".trashbin_img").attr("src","res/img/trashbin_click2.png");
			}
		}
		function bag_click(){
			if (isBagOpen == true){
				$(".bag_img").attr("src","res/img/bag_open_clicked.png");
			}else {
				$(".bag_img").attr("src","res/img/bag_open.png");
				isBagOpen == true;
			}
		}
		function flower_click(){
			flower_cnt = flower_cnt +1;
			if(isFlowerBroken == true){
				
			} else if(flower_cnt >=10) {
				$(".flower_img").attr("src","res/img/flower_broken.png");
				isFlowerBroken == true;
			} else if (flower_cnt %2 == 0){
				$(".flower_img").attr("src","res/img/flower.png");
			} else if (flower_cnt%3 == 0){
				$(".flower_img").attr("src","res/img/flower_click1.png");
			} else {
				$(".flower_img").attr("src","res/img/flower_click2.png");
			}
		}
		function flower_broken_click(){
			
		}
		function bed_click(){
			bed_cnt = bed_cnt+1;
			if(bed_cnt >= 3){
				$(".bed_img").attr("src","res/img/bed_click3.png");
			} else if(bed_cnt ==2){
				$(".bed_img").attr("src","res/img/bed_click2.png");
			} else {
				$(".bed_img").attr("src","res/img/bed_click1.png");
			}
		}
		function closet_click(){
			closet_cnt = closet_cnt +1;
			if(closet_cnt%2 == 0){
				$(".closet_img").attr("src","res/img/closet.png");
			} else if (closet_cnt%3 ==0){
				$(".closet_img").attr("src","res/img/closet_click1.png");
			} else {
				$(".closet_img").attr("src","res/img/closet_click2.png");
			}
		}
		function cat_click(){
			if (isCatMoved == false) {
				var meowInterval = setInterval(catMeow(),2000);
				function catMeow(){
					if(isCatMeow == false){
						$(".cat_img").attr("src","res/img/cat_meow.png");
						isCatMeow = true;
					} else {
						$(".cat_img").attr("src","res/img/cat.png");
						isCatMeow = false;
						clearInterval(meowInterval);
					}
				}
			}
		}
		
		if(isCatMoved == false){
			setInterval(catBlink(),1000);
			
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
		}
		
	</script>
</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
	title
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
	</div>
</body>
</html>