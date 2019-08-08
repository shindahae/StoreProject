/*package sist.com.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import sist.com.dao.CardDao;
import sist.com.model.CardBean;
import sist.com.vo.ProductBean;
import sist.com.dao.BmStoreDao;

@Component
public class BmPagingProcess {

	private BmStoreDao dao;
	private StringBuffer sb = new StringBuffer();

	public List<ProductBean> pagingAction(Model model, HashMap<String, Object> map, HttpServletRequest request) {
		map = new HashMap<String, Object>();
		List<ProductBean> list = null;
		int totalRow = dao.getBmTotalRow();
		int pageScale = 20;
		int totalPage = (totalRow % pageScale) == 0 ? (totalRow / pageScale) : (totalRow / pageScale) + 1;
		if (totalRow == 0)
			totalPage = 1;
		int currentPage = 1;
		String temp = "1";
		temp = request.getParameter("page") == null ? "1" : request.getParameter("page");
		currentPage = Integer.parseInt(temp);

		int start = 1 + (currentPage - 1) * pageScale;
		int end = pageScale + (currentPage - 1) * pageScale;
		int currentBlock = currentPage % pageScale == 0 ? (currentPage / pageScale) : (currentPage / pageScale) + 1;
		int startPage = 1 + (currentBlock - 1) * pageScale;
		int endPage = pageScale + (currentBlock - 1) * pageScale;
		if (totalPage <= endPage)
			endPage = totalPage;
		map.put("start", start);
		map.put("end", end);
		//list = dao.selectProductList(map);
		sb.delete(0, sb.length());
		sb.append("<a href=\"/web/cardList.do?page=1\"><img src=\"/web/img/button/btn_first.gif\" alt=\"처음페이지\" /></a>");
		if(currentBlock>1){
		sb.append("<a href=\"/web/cardList.do?page="+(startPage-1)+"\"><img src=\"/web/img/button/btn_prev.gif\" alt=\"이전\" /></a>");
		}else{
			sb.append("<a href=\"#\"><img src=\"/web/img/button/btn_prev.gif\" alt=\"이전\" /></a>");	
		}
		sb.append("<span>");
		for(int i=startPage;i<=endPage;i++){
			if(i==currentPage){
			sb.append("<font size=4 color='red'>["+i+"]</font>");	
			}else{
			sb.append("<a href='/web/cardList.do?page="+i+"'>["+i+"]</a>");
			}
		}//for
		sb.append("</span>");
		if(totalPage>endPage){
		sb.append("<a href=\"/web/cardList.do?page="+(endPage+1)+"\"><img src=\"/web/img/button/btn_next.gif\" alt=\"다음\" /></a>");
		}else{
			sb.append("<a href=\"#\"><img src=\"/web/img/button/btn_next.gif\" alt=\"다음\" /></a>");	
		}
		sb.append("<a href=\"/web/cardList.do?page="+totalPage+"\"><img src=\"/web/img/button/btn_last.gif\" alt=\"마지막페이지\" /></a>");
		model.addAttribute("page", sb.toString());
		return list;
	}

}
*/