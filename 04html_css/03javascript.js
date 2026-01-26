// html에서 id가 title인 태그를 찾아서 웹브라우저 console에 결과 출력
const title = document.querySelector("#title")
console.log(title)

// 링크 클릭 이벤트 연결하기 a태그를 찾아서 클릭시 "링크를 클릭했습니다."
const link = document.querySelector("a")
link.addEventListener("click", ()=>{
    console.log("링크를 클릭했습니다.");
});

// HTML요소에 마우스 이벤트 연결하기
const box = document.querySelector("#box")
box.addEventListener("mouseenter", ()=>{
    box.style.backgroundColor = "hotpink";
});

box.addEventListener("mouseleave", ()=>{
    box.style.backgroundColor = "aqua";
});

// 클릭 이벤트가 발생 할 때 숫자 증가, 감소하기
const btnPlus = document.querySelector(".btnPlus");
const btnMinus = document.querySelector(".btnMinus");
let num = 0; //제어할 숫자값을 0으로 초기화

// btnPlus를 클릭할 때
btnPlus.addEventListener("click", e=>{
    e.preventDefault();
    num++; //num값을 1씩 증가
    console.log(num);
});

// btnMinus를 클릭할 때
btnMinus.addEventListener("click", e=>{
    e.preventDefault();
    num--; //num값을 1씩 감소
    console.log(num);
});


// 버튼을 클릭하면 좌우로 회전하는 박스 만들기
const btnLeft = document.querySelector(".btnLeft");
const btnRight = document.querySelector(".btnRight");
const box2 = document.querySelector("#box2");
const deg = 45;  //회전할 각도
let num2 = 0;   // 증가시킬 값을 0으로 초기화

// btnLeft를 클릭할 때
btnLeft.addEventListener("click", e=>{
    e.preventDefault();
    num2--;
    console.log(`btnLeft를 클릭했을 때 num2에 있는 값: ${num2}`);
    box2.style.transform = `rotate(${num2 * deg}deg)`;
});

// btnRight를 클릭할 때
btnRight.addEventListener("click", e=>{
    e.preventDefault();
    num2++;
    console.log(`btnRight를 클릭했을 때 num2에 있는 값: ${num2}`);
    box2.style.transform = `rotate(${num2 * deg}deg)`;
});


// 웹브라우저에서 팝업창 띄우기
function popup() {
    window.open('popup.html', "팝업", 'width=200, height=100');
}

function printInfo() {
    console.log(`웹 브라우저의 넓이: ${window.innerWidth}`);
    console.log(`웹 브라우저의 높이: ${window.innerHeight}`);
    console.log(`웹 브라우저의 창의 넓이: ${window.outerWidth}`);
    console.log(`웹 브라우저의 창의 높이: ${window.outerHeight}`);
    console.log(`웹 브라우저의 창의 스크롤 가로 위치: ${window.scrollX}`);
    console.log(`웹 브라우저의 창의 스크롤 세로 위치: ${window.scrollY}`);
}

// 웹브우저 절대위치에서 이동
// 100 은 왼쪽에서 오른쪽으로 가로방향 이동
// 200 은 위에서 아래로 이동 세로방향 이동
// scrollTo는 웹브라우저 왼쪽 가장 위부터 시작
function sTo() {
    window.scrollTo(100, 200);
}

// 현재 위치에서 가로 세로 이동
function sBy() {
    window.scrollBy(100, 200);
}
