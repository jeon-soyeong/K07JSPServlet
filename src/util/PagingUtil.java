package util;

public class PagingUtil {
	
	public static String pagingImg(int totalRecordCount, 
			int pageSize, int blockPage, int nowPage, String pageName) {
		
		String pagingStr = "";
		
		int totalPage = 
		(int)(Math.ceil(((double)totalRecordCount/pageSize)));
		
		int intTemp = (((nowPage-1) / blockPage) * blockPage ) + 1; 
		
		if(intTemp != 1) {
			pagingStr += ""
				+ "<a href='"+pageName+"nowPage=1'>"
				+ "<img src='../images/paging1.gif'></a>";
			pagingStr += "&nbsp;";
			pagingStr += ""
				+ "<a href='"+pageName+"nowPage="+
								(intTemp-blockPage)+"'>"// 1, 6 // (intTemp-1) => 바로 전페이지로 이동-> 11->10페이지로 이동
				+ "<img src='../images/paging2.gif'></a>";
		}
		int blockCount = 1;
		while(blockCount<=blockPage && intTemp<=totalPage) {
			if(intTemp==nowPage) {//비활성화
				pagingStr += "&nbsp;"+intTemp+"&nbsp;";
			}
			else {//활성화
				pagingStr += "&nbsp;<a href='"+pageName
					+"nowPage="+intTemp+"'>"+
					intTemp+"</a>&nbsp;";
			}
			intTemp++;//
			blockCount++;
		}
		if(intTemp <= totalPage) {
			pagingStr += "<a href='"+pageName+"nowPage="+
												intTemp+"'>"
					+ "<img src='../images/paging3.gif'></a>";
			pagingStr += "&nbsp;";
			pagingStr += "<a href='"+pageName+"nowPage="+
												totalPage+"'>"
					+ "<img src='../images/paging4.gif'></a>";
		}
		
		return pagingStr;		
	}
	
	
	public static String pagingBS4(int totalRecordCount, 
			int pageSize, int blockPage, int nowPage, String pageName) {
		
		String pagingStr = "";
		
		int totalPage = 
		(int)(Math.ceil(((double)totalRecordCount/pageSize)));
		
		int intTemp = (((nowPage-1) / blockPage) * blockPage ) + 1; 
		
		if(intTemp != 1) {
			
	/*		<li class="page-item">
			<a href="#" class="page-link">
				<i class="fas fa-angle-double-left"></i>
			</a>
			</li>*/
			
			pagingStr += ""
				+ "<a href='"+pageName+"nowPage=1'>"
				+ "<img src='../images/paging1.gif'></a>";
			pagingStr += "&nbsp;";
			pagingStr += ""
				+ "<a href='"+pageName+"nowPage="+
								(intTemp-blockPage)+"'>"
				+ "<img src='../images/paging2.gif'></a>";
		}
		int blockCount = 1;
		while(blockCount<=blockPage && intTemp<=totalPage) {
			if(intTemp==nowPage) {
				pagingStr += "&nbsp;"+intTemp+"&nbsp;";
			}
			else {
				pagingStr += "&nbsp;<a href='"+pageName
					+"nowPage="+intTemp+"'>"+
					intTemp+"</a>&nbsp;";
			}
			intTemp++;
			blockCount++;
		}
		if(intTemp <= totalPage) {
			pagingStr += "<a href='"+pageName+"nowPage="+
												intTemp+"'>"
					+ "<img src='../images/paging3.gif'></a>";
			pagingStr += "&nbsp;";
			pagingStr += "<a href='"+pageName+"nowPage="+
												totalPage+"'>"
					+ "<img src='../images/paging4.gif'></a>";
		}
		
		return pagingStr;		
	}
		
}
