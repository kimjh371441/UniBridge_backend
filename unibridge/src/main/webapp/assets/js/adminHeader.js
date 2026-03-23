document.addEventListener("DOMContentLoaded", () => {


  const menuMap = {
    main:     `${toAdmin}/adminMain/main.admin`,
    notice:   `${toAdmin}/adminNotice/noticeList.admin`,
    board:    `${toAdmin}/adminBoard/menteeBoard/menteeBoardList.admin`,
    report:   `${toAdmin}/adminReport/reportList.admin`,
    user:     `${toAdmin}/adminUserManagement/userList.admin`,
    matching: `${toAdmin}/adminMatching/matchingList.admin`,
    logout:   `${toAdmin}/logoutOk.admin`,
  };

  /* ========================
     현재 페이지 → 활성 메뉴 판별
  ======================== */

  const pageKeyMap = {
    notice:   ["noticeList", "noticeDetail.admin", "noticeWrite.admin", "noticeEdit.admin"],
    board:    ["mentorBoardList.admin", "menteeBoardList.admin", "mentorBoardDetail.admin", "menteeBoardDetail.admin", "mentorBoardWrite.admin", "menteeBoardWrite.admin", "mentorBoardEdit.admin", "menteeBoardEdit.admin"],
    report:   ["reportList.admin", "reportDetail.admin"],
    user:     ["userList.admin", "userDetail.admin", "userDetailWaiting.admin"],
    matching: ["matchingList.admin", "matchingDetail.admin"],
  };

  const currentPath = window.location.pathname;
  const getCurrentMenuKey = () => {
    for (const [key, pages] of Object.entries(pageKeyMap)) {
      if (pages.some(name => currentPath.includes(name))) return key;
    }
    return "";
  };

  const currentMenuKey = getCurrentMenuKey();

  document.querySelectorAll("[data-link]").forEach(btn => {
    const target = btn.dataset.link;

    if (target === currentMenuKey) btn.classList.add("is-active");

    btn.addEventListener("click", e => {
      e.preventDefault();
      if (target === "logout") {
        if (!window.confirm("로그아웃 하시겠습니까?")) return;
      }
      const path = menuMap[target];
      if (path) window.location.href = path;
    });
  });

});
