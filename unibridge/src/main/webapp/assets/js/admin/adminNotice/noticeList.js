document.addEventListener("DOMContentLoaded", () => {

  let currentType = "전체";
  let dateFrom = "";
  let dateTo = "";

  
  /* ========================
     종류 드롭다운
  ======================== */
  const btnType = document.getElementById("btnType");
  const typeDropdown = document.getElementById("typeDropdown");
  if (btnType && typeDropdown) {
    btnType.addEventListener("click", () => {
      typeDropdown.style.display = typeDropdown.style.display === "block" ? "none" : "block";
    });
    document.addEventListener("click", e => {
      if (!btnType.contains(e.target)) typeDropdown.style.display = "none";
    });
  }

  
  
  /* ========================
     등록 버튼
  ======================== */
  const btnWrite = document.getElementById("btnWrite");
  if (btnWrite) {
    btnWrite.addEventListener("click", () => {
      location.href = "noticeWrite.admin";
    });
  }

  /* ========================
     조회 버튼
  ======================== */
  const btnSearch = document.getElementById("btnSearch");
    btnSearch.addEventListener("click", () => {
      const dateFrom = document.getElementById("dateFrom").value;
      const dateTo = document.getElementById("dateTo").value;
	  
	  const urlParams = new URLSearchParams(window.location.search);
	  const boardType = urlParams.get('boardType') || "";
	  
      if (dateFrom > dateTo) {
        alert("시작 날짜가 종료 날짜보다 클 수 없습니다.");
        return;
      }
	  window.location.href = `${contextPath}/app/admin/adminNotice/noticeList.admin?dateFrom=${dateFrom}&dateTo=${dateTo}&boardType=${boardType}`;	
	  		
    });
 

});





