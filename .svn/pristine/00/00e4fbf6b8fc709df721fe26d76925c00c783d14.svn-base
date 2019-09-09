package kr.or.ddit.enumpkg;

public enum ServiceKind {
	STANDARDJSP("standardJSP", "/03/standardDesc.jsp"), 
	CACHECONTROL("cacheCotrol", "/05/cacheControl.jsp"),
	IMAGESTRAMING("imageStreaming", "/model2/imageForm.do"), 
	FACTORIAL("factorial", "/06/NewForm.jsp"),
	CALENDAR("calendar", "/04/calendar.jsp"), 
	AUTOREQUESTAJAX("비동기요청테스트", "/05/autoRequestAjax.jsp"),
	SESSIONTIMER("세션타이머", "/09/sessionTimer2.jsp"),
	IDOLSERVICE("아이돌검색", "/idol.do");
	
	private String contentUrl;
	private String contentName;

	private ServiceKind(String contentName, String contentUrl) {
		this.contentName = contentName;
		this.contentUrl = contentUrl;
	}

	public String getContentUrl() {
		return contentUrl;
	}

	public String getContentName() {
		return contentName;
	}
}
