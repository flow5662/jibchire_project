package dto;

public class PageInfo {
	//페이징을 위해서 
	//테이블이 있어야 모델링파일이 필요한 건 아님
	//내가 새로운 커스텀의 형태를 만들어 내겠습니다.
	private int page;
	private int maxPage;
	private int startPage;
	private int endPage;
	private int listCount;
	
	public int getPage() {
		return page;
	}
	
	public void setPage(int page) {
		this.page = page;
	}
	
	public int getMaxPage() {
		return maxPage;
	}
	
	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}
	
	public int getStartPage() {
		return startPage;
	}
	
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	
	public int getEndPage() {
		return endPage;
	}
	
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	public int getListCount() {
		return listCount;
	}
	
	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

}
