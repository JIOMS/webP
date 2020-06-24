//canvas 세팅
let GAME_WIDTH = 20;
let GAME_HEIGHT = 10;
let NuM_OF_VIRUS = 40;
let BLOCK_SIZE;
let VIRUS_MOVE_PERIOD = 20;
let door_loc = { x: 5, y: 0 };
var character;
var virus_icon;
var virus_moving;

//색상에 따라 board에 입력하는 숫자
let stats = {
  color: {
    wall: "#600",
    ground: "#FFF",
    door: "#CCC",
    fever: "#F00",
    cough: "#9CF",
  },
  number: {
    player: 1,
    wall: -1,
    ground: 0,
    none: -2,
    door: 2,
    fever: 3,
    cough: 4,
    virus: 5,
  },
  // wall: {color: "#660000", number: -1},
  // ground: {color: "#FFFFFF", number: 0},
  // none: -2,
  // door: {color: "#C0C0C0", number: 2},
  // fever: {color: "FF0000", number: 3},
  // cough: {color: "#99CCFF", number: 4}
};

function change_gage(num) {
  console.log(num);
}

var player = new Player();

function Player() {
  this.x = GAME_WIDTH - 1;
  this.y = 5;
}

onkeydown = function () {
  switch (event.keyCode) {
    case 38:
      player.up();
      break;
    case 40:
      player.down();
      break;
    case 39:
      player.right();
      break;
    case 37:
      player.left();
      break;
  }
};

Player.prototype.up = function () {
  let c = this.x;
  let r = this.y - 1;
  if (board[r][c] == stats.number.ground || board[r][c] == stats.number.door) {
    board[this.y][this.x] = stats.number.ground;
    board[r][c] = stats.number.player;
    ctx.fillStyle = stats.color.ground;
    ctx.fillRect(
      this.x * BLOCK_SIZE,
      this.y * BLOCK_SIZE,
      BLOCK_SIZE,
      BLOCK_SIZE
    );
    ctx.drawImage(
      character,
      c * BLOCK_SIZE,
      r * BLOCK_SIZE,
      BLOCK_SIZE,
      BLOCK_SIZE
    );
    this.x = c;
    this.y = r;
  }
};

Player.prototype.down = function () {
  let c = this.x;
  let r = this.y + 1;
  if (board[r][c] == stats.number.ground || board[r][c] == stats.number.door) {
    board[this.y][this.x] = stats.number.ground;
    board[r][c] = stats.number.player;
    ctx.fillStyle = stats.color.ground;
    ctx.fillRect(
      this.x * BLOCK_SIZE,
      this.y * BLOCK_SIZE,
      BLOCK_SIZE,
      BLOCK_SIZE
    );
    ctx.drawImage(
      character,
      c * BLOCK_SIZE,
      r * BLOCK_SIZE,
      BLOCK_SIZE,
      BLOCK_SIZE
    );
    this.x = c;
    this.y = r;
  } else if (board[r][c] == stats.number.virus) {
  }
};
Player.prototype.right = function () {
  let c = this.x + 1;
  let r = this.y;
  if (board[r][c] == stats.number.ground || board[r][c] == stats.number.door) {
    board[this.y][this.x] = stats.number.ground;
    board[r][c] = stats.number.player;
    ctx.fillStyle = stats.color.ground;
    ctx.fillRect(
      this.x * BLOCK_SIZE,
      this.y * BLOCK_SIZE,
      BLOCK_SIZE,
      BLOCK_SIZE
    );
    ctx.drawImage(
      character,
      c * BLOCK_SIZE,
      r * BLOCK_SIZE,
      BLOCK_SIZE,
      BLOCK_SIZE
    );
    this.x = c;
    this.y = r;
  }
};
Player.prototype.left = function () {
  let c = this.x - 1;
  let r = this.y;
  if (board[r][c] == stats.number.ground || board[r][c] == stats.number.door) {
    board[this.y][this.x] = stats.number.ground;
    board[r][c] = stats.number.player;
    ctx.fillStyle = stats.color.ground;
    ctx.fillRect(
      this.x * BLOCK_SIZE,
      this.y * BLOCK_SIZE,
      BLOCK_SIZE,
      BLOCK_SIZE
    );
    ctx.drawImage(
      character,
      c * BLOCK_SIZE,
      r * BLOCK_SIZE,
      BLOCK_SIZE,
      BLOCK_SIZE
    );
    this.x = c;
    this.y = r;
  } else if (board[r][c] == stats.number.virus) {
  }
};
//animation frame 재정의
window.requestAnimFrame = (function (callback) {
  return (
    window.requestAnimationFrame ||
    window.webkitRequestAnimationFrame ||
    window.mozRequestAnimationFrame ||
    window.oRequestAnimationFrame ||
    window.msRequestAnimationFrame ||
    function (callback) {
      window.setTimeout(callback, 1000 / 60);
    }
  );
})();

// function range(n) {
//   arr = [];
//   for(i=0;i<n;i++)
//     arr.push(i);
//   return arr;
// }

//객체의 value로부터 key를 가져오기
key_from_value = (obj, value) =>
  Object.keys(obj).find((key) => obj[key] === value);

var ctx;
var board = [];

//board 구성
r = 0;
board[r] = [];
for (c = 0; c < GAME_WIDTH; c++) board[r][c] = stats.number.wall;
board[door_loc.y][door_loc.x] = stats.number.door;

for (r = 1; r < GAME_HEIGHT - 1; r++) {
  board[r] = [];
  for (c = 0; c < GAME_WIDTH; c++) board[r][c] = stats.number.ground;
}
r = GAME_HEIGHT - 1;
board[r] = [];
for (c = 0; c < GAME_WIDTH; c++) board[r][c] = stats.number.wall;

//게임 셋업

function setUp() {
  // document.body.appendChild(character);
  BLOCK_SIZE = window.innerWidth / GAME_WIDTH;
  character = new Image();
  character.src = "./src/images/player_character.png";
  virus_icon = new Image();
  virus_icon.src = "./src/images/coronavirus.png";
  ctx = document.querySelector("#corridor").getContext("2d");
  ctx.canvas.width = GAME_WIDTH * BLOCK_SIZE;
  ctx.canvas.height = GAME_HEIGHT * BLOCK_SIZE;
  for (r in board) {
    for (c in board[r]) {
      index = key_from_value(stats.number, board[r][c]);
      ctx.fillStyle = stats.color[index];
      ctx.fillRect(c * BLOCK_SIZE, r * BLOCK_SIZE, BLOCK_SIZE, BLOCK_SIZE);
    }
  }
  virus_icon.onload = () => {
    for (i in viruses) {
      const virus = viruses[i];
      board[virus.y][virus.x] = stats.number.virus;
      ctx.drawImage(
        virus_icon,
        virus.x * BLOCK_SIZE,
        virus.y * BLOCK_SIZE,
        BLOCK_SIZE,
        BLOCK_SIZE
      );
      // ctx.fillStyle = stats.color[person.status];
      // ctx.beginPath();
      // ctx.arc(
      //   (person.x + 1 / 2) * BLOCK_SIZE,
      //   (person.y + 1 / 2) * BLOCK_SIZE,
      //   (1 / 2) * BLOCK_SIZE,
      //   0,
      //   2 * Math.PI,
      //   true
      // );
      // ctx.fill();
    }
  };

  board[player.y][player.x] = stats.number.player;
  character.onload = () => {
    ctx.drawImage(
      character,
      player.x * BLOCK_SIZE,
      player.y * BLOCK_SIZE,
      BLOCK_SIZE,
      BLOCK_SIZE
    );
  };
  virus_moving = requestAnimationFrame(virus_move);
}

//복도에 있는 바이러스
var viruses = [];

function Virus(x, y, going_up) {
  // var x = Math.floor(Math.random() * GAME_WIDTH - 1);
  // var y = Math.floor(Math.random() * (GAME_HEIGHT - 2) + 1);
  this.x = x;
  this.y = y;
  this.going_up = going_up;
  // this.status = this.status_list[
  //   Math.floor(Math.random() * this.status_list.length)
  // ];
  // this.drawing;
  // this.dx = 0;
  // this.dy = 0;
  // this.count = 1;
}

// Virus.prototype.status_list = ["fever", "cough"];

for (i = 0; i < GAME_WIDTH - 1; i++) {
  var j = i % 2 == 1 ? 1 : GAME_HEIGHT - 2;
  var going_up = i % 2 == 1 ? false : true;
  viruses.push(new Virus(i, j, going_up));
}

Virus.prototype.up = function () {
  if (board[this.y - 1][this.x] == stats.number.ground) {
    board[this.y][this.x] = stats.number.ground;
    ctx.fillStyle = stats.color.ground;
    ctx.fillRect(
      this.x * BLOCK_SIZE,
      this.y * BLOCK_SIZE,
      BLOCK_SIZE,
      BLOCK_SIZE
    );
    this.y -= 1;
    board[this.y][this.x] = stats.number.virus;
    ctx.drawImage(
      virus_icon,
      this.x * BLOCK_SIZE,
      this.y * BLOCK_SIZE,
      BLOCK_SIZE,
      BLOCK_SIZE
    );
  } else {
    if (board[this.y - 1][this.x] == stats.number.player) change_gage(1);
    else this.down();
    this.going_up = false;
  }
};
Virus.prototype.down = function () {
  if (board[this.y + 1][this.x] == stats.number.ground) {
    board[this.y][this.x] = stats.number.ground;
    ctx.fillStyle = stats.color.ground;
    ctx.fillRect(
      this.x * BLOCK_SIZE,
      this.y * BLOCK_SIZE,
      BLOCK_SIZE,
      BLOCK_SIZE
    );
    this.y += 1;
    board[this.y][this.x] = stats.number.virus;
    ctx.drawImage(
      virus_icon,
      this.x * BLOCK_SIZE,
      this.y * BLOCK_SIZE,
      BLOCK_SIZE,
      BLOCK_SIZE
    );
  } else {
    if (board[this.y + 1][this.x] == stats.number.player) change_gage(-1);
    else this.up();
    this.going_up = true;
  }
};
var count = 0;
function virus_move() {
  count += 1;
  if (board[door_loc.y][door_loc.x] == stats.number.player) {
    cancelAnimationFrame(virus_moving);
    alert("성공!");
    return;
  }
  if (count % VIRUS_MOVE_PERIOD == 0) {
    for (num in viruses) {
      virus = viruses[num];
      virus.going_up ? virus.up() : virus.down();
    }
  }
  virus_moving = requestAnimationFrame(virus_move);
}

/* Virus.prototype.draw = function () {
  ctx.fillStyle = stats.color.ground;
  ctx.fillRect(
    this.x * BLOCK_SIZE,
    this.y * BLOCK_SIZE,
    BLOCK_SIZE,
    BLOCK_SIZE
  );
  this.x += this.dx / 60;
  this.y += this.dy / 60;
  ctx.fillStyle = stats.color[this.status];
  ctx.beginPath();
  ctx.arc(
    this.x + BLOCK_SIZE / 2,
    this.y + BLOCK_SIZE / 2,
    BLOCK_SIZE / 2,
    0,
    2 * Math.PI,
    true
  );
  ctx.fill();

  if (this.count % 60 != 0) {
    this.count += 1;
    this.drawing = requestAnimationFrame(this.draw);
  } else {
    cancelAnimationFrame(this.drawing);
    this.count = 1;
  }
}; */

/* Virus.prototype.move = {
  top: () => {
    x = this.x;
    y = this.y - 1;
    status = this.status;
    if (
      board[y][x] == stats.number.ground &&
      typeof board[y][x] != "undefined"
    ) {
      board[this.y][this.x] = stats.number.ground;
      board[y][x] = stats.number[status];
      this.dy = -1;
      this.drawing = requestAnimationFrame(this.draw);
      this.dy = 0;
    }
  },
  bottom: () => {
    x = this.x;
    y = this.y + 1;
    if (board[y][x] == stats.white && typeof board[y][x] != "undefined") {
      board[this.y][this.x] = stats.ground.number;
      this.x = x;
      this.y = y;
      board[y][x] = stats.number.status;
      ctx.fillStyle = stats.color.ground;
    }
  },
}; */
