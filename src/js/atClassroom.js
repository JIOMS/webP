DESK_HOR = 10;
DESK_VER = 4;
let roomSets = {
  width: 1200,
  height: 750,
  ver_gap: 30,
  hor_gap: 120
}

let desk = {
  width: 60,
  height: 150,
  hor_margin: 40,
  ver_margin: 30
}

var ctx;
var selected_seat;
let svg;
let path;
let check_seat;
let char_img;
let classroom_loc;
let door_loc;

//교실 그리기
function setClassroom() {
  // canvas = document.createElement('canvas');
  // canvas.setAttribute('id', 'route');
  // classroom.appendChild(canvas);
  // ctx = canvas.getContext('2d');
  const classroom = document.querySelector("#classroom");
  svg = document.createElementNS('http://www.w3.org/2000/svg', 'svg');
  svg.setAttribute('id', 'route');
  path = document.createElementNS('http://www.w3.org/2000/svg', 'path');
  char_img = document.createElement('image');
  char_img.setAttribute('src', './player_character.png');
  char_img.setAttribute('height', '20');
  char_img.setAttribute('width', '20');
  
  // path.setAttribute('d', 'M 0,0 L 50,50 Z');
  path.setAttribute('id', 'to_clicked')
  svg.appendChild(path);
  svg.appendChild(char_img);
  classroom.appendChild(svg);

  //뒷문 쪽
  const back = document.createElement('div');
  back.setAttribute('id', 'atDoor');
  const door = document.createElement('span');
  door.setAttribute('id', 'door');
  door.innerText = '문';
  back.appendChild(door);
  classroom.appendChild(back);
  
  //가운데 책상들
  const middle = document.createElement('div');
  middle.setAttribute('id', 'desks');
  for (r = 0; r < DESK_VER; r++) {
    for(c = 0; c < DESK_HOR; c++){
      //desk = document.createElement('button');
      const desk = document.createElement('input');
      desk.setAttribute('type', 'button');
      desk.setAttribute('class', 'desk');
      const desk_id = "desk"+ (r*DESK_HOR + c);
      desk.setAttribute('id', desk_id);
      desk.setAttribute('onclick', `selected_seat = {row: ${r}, col: ${c}};draw_path(this.id);`);
      middle.appendChild(desk);
    }
  }
  classroom.appendChild(middle);
  
  //칠판 쪽
  const front = document.createElement('div');
  front.setAttribute('id', 'atBlackboard');
  const blackboard = document.createElement('span');
  blackboard.setAttribute('id', 'blackboard');
  blackboard.innerText = '칠판';
  front.appendChild(blackboard);
  classroom.appendChild(front);

  classroom_loc = document.querySelector('#classroom').getBoundingClientRect();
  door_loc = document.querySelector('#door').getBoundingClientRect();

  //게임 안내 페이지
  const initial = document.createElement('div');
  initial.setAttribute('id', 'initial');
  const initial_title = document.createElement('h1');
  const initial_detail = document.createElement('p');
  const initial_button = document.createElement('button')
  initial_title.innerText = "안전한 자리 선점하기!";
  initial_detail.innerText = "위험 요소를 피해 가장 안전해 보이는 자리를 선택하세요";
  initial_button.setAttribute('type', 'button');
  initial_button.setAttribute('onclick', 'document.getElementById("initial").style.display = "none"');
  initial_button.innerText = "OK!";
  initial.appendChild(initial_title);
  initial.appendChild(initial_detail);
  initial.appendChild(initial_button);
  classroom.appendChild(initial);

  //자리 선택 시 확인 창
  check_seat = document.createElement('div');
  check_seat.setAttribute('id', 'check_seat');
  check_seat.setAttribute('style', 'display: none;')
  const check_title = document.createElement('h4');
  check_title.innerText = "여기 앉으시겠습니까?"
  const check_yes = document.createElement('button');
  check_yes.innerText = "네";
  check_yes.setAttribute('onclick', 'seat_result();')
  const check_no = document.createElement('button');
  check_no.innerText = "아니요";
  check_no.setAttribute('onclick', 'erase_path();')
  check_seat.appendChild(check_title);
  check_seat.appendChild(check_yes);
  check_seat.appendChild(check_no);
  document.body.appendChild(check_seat);
}

//자리 선택 시 경로 그리기 + 선택 확인
function draw_path(id) {
  desk_loc = document.getElementById(id).getBoundingClientRect();
  const door_to_desk = {
    x1: door_loc.x - classroom_loc.x + door_loc.width/2,
    y1: door_loc.top - classroom_loc.y,
    y2: desk_loc.bottom - classroom_loc.y + desk_loc.height/3,
    x2: desk_loc.x - classroom_loc.x + desk_loc.width/2,
    y3: desk_loc.bottom - classroom_loc.y
  };

  if (selected_seat.row == 3) {
    door_to_desk.y2 = desk_loc.top - classroom_loc.y - desk_loc.height/3;
    door_to_desk.y3 = desk_loc.top - classroom_loc.y
  }

  const path_route = `M ${door_to_desk.x1}, ${door_to_desk.y1} L ${door_to_desk.x1}, ${door_to_desk.y2} L ${door_to_desk.x2}, ${door_to_desk.y2} L ${door_to_desk.x2}, ${door_to_desk.y3}`;
  path.setAttribute('d', path_route);

  check_seat.setAttribute('style', `display: box; left: ${desk_loc.right}; top: ${desk_loc.top};`);
  // ctx.strokeStyle = "#F00";
  // ctx.lineWidth = 1;
  // ctx.moveTo(start_point.x, start_point.y);
  // ctx.lineTo(start_point.x, 0);
  // ctx.stroke();
}

function erase_path() {
  path.setAttribute('d', '');
  check_seat.style.display = "none";
}

//자리 선택 완료시 점수(위험도) 계산
function seat_result() {
  
}

desks = [];
for (r = 0; r < DESK_VER; r++) {
  desks[r] = [];
  for(c = 0; c < DESK_HOR; c++)
    desks[r][c] = 0;
}

