package com.unibridge.app.admin.dto;

import com.unibridge.app.file.dto.FileDTO;

public class AdNoticeBoardDTO {

//	CREATE TABLE UB_NOTICEBOARD (
//		    noticeboard_number  NUMBER          NOT NULL,
//		    board_type         VARCHAR2(50)    NULL,
//		    board_title        VARCHAR2(255)   NOT NULL,
//		    board_content      VARCHAR2(4000)  NOT NULL,
//		    board_click        NUMBER          DEFAULT 0 NOT NULL,
//		    board_date         DATE            NOT NULL,
//		    admin_number       NUMBER          NOT NULL,
//		    contest_number     NUMBER          NULL,
//		    file_number        NUMBER          NULL,
//		    CONSTRAINT PK_UB_NOTICEBOARD  PRIMARY KEY (noticeboard_number),
//		    CONSTRAINT FK_UB_ADMIN_NB     FOREIGN KEY (admin_number)   REFERENCES UB_ADMIN(admin_number),
//		    CONSTRAINT FK_UB_CONTEST_NB   FOREIGN KEY (contest_number) REFERENCES UB_CONTEST(contest_number),
//		    CONSTRAINT FK_UB_FILENUM_NB   FOREIGN KEY (file_number)    REFERENCES UB_FILE (file_number)
//		);
//	
	
	private int noticeboardNumber;
	private String boardType;
	private String boardTitle;
	private String boardContent;
	private int boardClick;
	private String boardDate;
	private int adminNumber;
	private String adminNickname;
	private int contestNumber;
	private int fileNumber;
	private FileDTO file;
	
	
	
	public int getNoticeboardNumber() {
		return noticeboardNumber;
	}
	public void setNoticeboardNumber(int noticeboardNumber) {
		this.noticeboardNumber = noticeboardNumber;
	}
	public String getBoardType() {
		return boardType;
	}
	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public int getBoardClick() {
		return boardClick;
	}
	public void setBoardClick(int boardClick) {
		this.boardClick = boardClick;
	}
	public String getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}
	public int getAdminNumber() {
		return adminNumber;
	}
	public void setAdminNumber(int adminNumber) {
		this.adminNumber = adminNumber;
	}
	public int getContestNumber() {
		return contestNumber;
	}
	public void setContestNumber(int contestNumber) {
		this.contestNumber = contestNumber;
	}
	public int getFileNumber() {
		return fileNumber;
	}
	public void setFileNumber(int fileNumber) {
		this.fileNumber = fileNumber;
	}
	public String getAdminNickname() {
		return adminNickname;
	}
	public void setAdminNickname(String adminNickname) {
		this.adminNickname = adminNickname;
	}
	public FileDTO getFile() {
		return file;
	}
	public void setFile(FileDTO file) {
		this.file = file;
	}
	
}
