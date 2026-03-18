document.addEventListener("DOMContentLoaded", () => {
	//엘리먼트 선택(DOM 요소 선택)
	const listBtn = document.querySelector(".list-btn");
	const modifyBtn = document.querySelector(".modify-btn");
	const deleteBtn = document.querySelector(".delete-btn");
	const submitBtn = document.querySelector(".submit-btn");
	
	//데이터 읽기(data- 속성 사용)
	const boardNumber = listBtn?.dataset.boardNumber??window.boardNumber;
	const memberNumber = listBtn?.dataset.memberNumber??window.memberNumber;
	
	console.log("확인 boardNumber : ", boardNumber);
	console.log("확인 memberNumber : ", memberNumber);
	
	//이동버튼
	listBtn?.addEventListener("click", ()=>{
		window.location.href = "/noticeBoard/NoticeBoardListOk.bo";
	});

});











