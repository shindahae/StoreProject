package sist.com.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import sist.com.dao.BmStoreDao;
import sist.com.vo.BmCartBean;
import sist.com.vo.BmCartListBean;
import sist.com.vo.BmEventBean;
import sist.com.vo.BmOrderBean;
import sist.com.vo.BmProductBean;

@RestController
@SessionAttributes(value = { "info" })
public class BmStoreController {
	@Resource(name = "bmDao")
	private BmStoreDao dao;

	// 메인에 신상품/추천상품 등을 가져옴 (주문내역에서 주문이 많은 상품 1~20위까지) (main.jsp)
	// 쿼리 수정 필요
	@RequestMapping(value = "mainList.do")
	public List<BmProductBean> productMainList() {
		List<BmProductBean> list = dao.mainList();
		for (int i = 0; i < list.size(); i++) {
			String priceview = new String();
			int price = list.get(i).getProductprice();
			if (price != 0) {
				StringBuffer a = new StringBuffer();
				a.append(price);
				if (a.length() > 3) {
					for (int k = a.length() - 1; k >= 0; k--) {
						if (k % 3 == 0) {
							a.insert(a.length() - k, ",");
						}
					}
				}
				a.deleteCharAt(a.length() - 1);
				a.append("원");
				priceview = a.toString();
			}
			list.get(i).setPriceView(priceview);
		}
		return list;
	}

	// 메인에서 사장님 업종과 관련된 추천상품을 가져옴(주문내역에서 주문이 많은 상품 1,2위) (main.jsp)
	// 쿼리 수정 필요
	@RequestMapping(value = "mainSelectItem.do")
	public List<BmProductBean> productSelectItem(Model model, String category) {
		category = "가공식품";
		List<BmProductBean> list = dao.productSelectItem(category);
		for (int i = 0; i < list.size(); i++) {
			String priceview = new String();
			int price = list.get(i).getProductprice();
			if (price != 0) {
				StringBuffer a = new StringBuffer();
				a.append(price);
				if (a.length() > 3) {
					for (int k = a.length() - 1; k >= 0; k--) {
						if (k % 3 == 0) {
							a.insert(a.length() - k, ",");
						}
					}
				}
				a.deleteCharAt(a.length() - 1);
				a.append("원");
				priceview = a.toString();
			}
			list.get(i).setPriceView(priceview);
		}
		return list;
	}

	// 메인에서 이벤트이미지 클릭 시 카테고리로 연결 (main.jsp)
	// 쿼리 수정 필요
	@RequestMapping(value = "mainEvent.do")
	public ModelAndView mainEvent(String category, ModelAndView mv) {
		System.out.println("메인이벤트클릭");
		String str = "";
		if (category.equals("category2")) {
			str = "포장랩,백";
		}
		if (category.equals("category3")) {
			str = "종이봉투";
		}
		if (category.equals("category4")) {
			str = "비닐봉투";
		}
		if (category.equals("category5")) {
			str = "수저";
		}
		if (category.equals("category6")) {
			str = "위생용품";
		}
		if (category.equals("category7")) {
			str = "냉장냉동";
		}
		if (category.equals("category8")) {
			str = "가공식품";
		}
		if (category.equals("category9")) {
			str = "음료";
		}
		if (category.equals("category10")) {
			str = "쌀";
		}
		if (category.equals("category11")) {
			str = "농수산물";
		}
		if (category.equals("category12")) {
			str = "닭";
		}
		mv.setViewName("store/category");
		mv.addObject("mainlist", dao.productSelectList(str));
		return mv;
		// System.out.println(str);
		// return "store/category";
	}

	/*
	 * @RequestMapping(value = "clientproductInfo.do") public String
	 * clientInfoProcess(int pk, Model model) { model.addAttribute("cInfo",
	 * dao.selectClientInfo(pk)); return "cart/productInfo"; }
	 */

	// 깜짝세일 페이지에서 이벤트 테이블에 있는 데이터를 가져옴 (timesale.jsp)
	@RequestMapping(value = "eventList.do")
	public List<BmEventBean> eventList() {
		List<BmEventBean> list = dao.eventList();
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setStartdate(list.get(i).getStartdate().substring(0, 10));
			list.get(i).setEnddate(list.get(i).getEnddate().substring(0, 10));
		}
		for (int i = 0; i < list.size(); i++) {
			String priceview = new String();
			int price = (list.get(i).getProductprice()
					- (int) (list.get(i).getProductprice() * ((double) list.get(i).getSale() / 100)));
			if (price != 0) {
				StringBuffer a = new StringBuffer();
				a.append(price);
				if (a.length() > 3) {
					for (int k = a.length() - 1; k >= 0; k--) {
						if (k % 3 == 0) {
							a.insert(a.length() - k, ",");
						}
					}
				}
				a.deleteCharAt(a.length() - 1);
				a.append("원");
				priceview = a.toString();
			}
			list.get(i).setPriceView(priceview);
		}
		return list;
	}

	// 제품상세페이지 (detail.jsp)
	@RequestMapping(value = "detail.do")
	public String productDetail(HttpServletResponse response, Model model,
			@RequestParam(value = "productcode", required = true, defaultValue = "0") String productcode)
			throws IOException {
		model.addAttribute("info", dao.productDetail(productcode));
		response.sendRedirect("store/detail.jsp");
		return "detail";
	}

	// 카테고리 선택 시 해당하는 리스트를 가져옴 (category.jsp)
	@RequestMapping(value = "productSelectList.do")
	public List<BmProductBean> productSelectList(String category) {
		String str = "";
		List<BmProductBean> list = null;
		if (category.equals("category1")) {
			list = dao.productList();// 전체 상품 목록
			for (int i = 0; i < list.size(); i++) {
				String priceview = new String();
				int price = list.get(i).getProductprice();
				if (price != 0) {
					StringBuffer a = new StringBuffer();
					a.append(price);
					if (a.length() > 3) {
						for (int k = a.length() - 1; k >= 0; k--) {
							if (k % 3 == 0) {
								a.insert(a.length() - k, ",");
							}
						}
					}
					a.deleteCharAt(a.length() - 1);
					a.append("원");
					priceview = a.toString();
				}
				list.get(i).setPriceView(priceview);
			}
		} else {
			if (category.equals("category2")) {
				str = "포장랩,백";
			}
			if (category.equals("category3")) {
				str = "종이봉투";
			}
			if (category.equals("category4")) {
				str = "비닐봉투";
			}
			if (category.equals("category5")) {
				str = "수저";
			}
			if (category.equals("category6")) {
				str = "위생용품";
			}
			if (category.equals("category7")) {
				str = "냉장냉동";
			}
			if (category.equals("category8")) {
				str = "가공식품";
			}
			if (category.equals("category9")) {
				str = "음료";
			}
			if (category.equals("category10")) {
				str = "쌀";
			}
			if (category.equals("category11")) {
				str = "농수산물";
			}
			if (category.equals("category12")) {
				str = "닭";
			}
			list = dao.productSelectList(str);
			for (int i = 0; i < list.size(); i++) {
				String priceview = new String();
				int price = list.get(i).getProductprice();
				if (price != 0) {
					StringBuffer a = new StringBuffer();
					a.append(price);
					if (a.length() > 3) {
						for (int k = a.length() - 1; k >= 0; k--) {
							if (k % 3 == 0) {
								a.insert(a.length() - k, ",");
							}
						}
					}
					a.deleteCharAt(a.length() - 1);
					a.append("원");
					priceview = a.toString();
				}
				list.get(i).setPriceView(priceview);
			}
		}
		return list;
	}

	// 잘나가요 페이지 리스트 -> 주문내역이 많은 순으로 가져옴 (jalnagayo.jsp)
	@RequestMapping(value = "selectJalList.do")
	public List<BmProductBean> selectJalList() {
		List<BmProductBean> list = dao.SelectjalList();
		for (int i = 0; i < list.size(); i++) {
			String priceview = new String();
			int price = list.get(i).getProductprice();
			if (price != 0) {
				StringBuffer a = new StringBuffer();
				a.append(price);
				if (a.length() > 3) {
					for (int k = a.length() - 1; k >= 0; k--) {
						if (k % 3 == 0) {
							a.insert(a.length() - k, ",");
						}
					}
				}
				a.deleteCharAt(a.length() - 1);
				a.append("원");
				priceview = a.toString();
			}
			list.get(i).setPriceView(priceview);
		}
		return list;
	}

	// 장바구니 목록에 추가 (detail.jsp)
	@RequestMapping(value = "cartAdd.do")
	public String cartAdd(BmCartBean bean, HttpServletResponse response) throws IOException {
		dao.cartAdd(bean);
		String productcode = bean.getProductcode();
		response.sendRedirect("store/cart.jsp");
		return "cart";
	}

	// 장바구니 중복 체크 (detail.jsp)
	@RequestMapping(value = "cartcheck.do")
	public String cartcheck(String productcode) {
		int count = dao.cartcheck(productcode);
		String result;
		if (count != 0) {
			result = "e";
			return result;
		} else {
			result = "n";
			return result;
		}
	}

	// 장바구니 목록 가져오기 (cart.jsp)
	@RequestMapping(value = "cartList.do")
	public List<BmCartListBean> cartList() {
		List<BmCartListBean> list = dao.cartList();
		return list;
	}

	// 장바구니 수량 수정 (cart.jsp)
	@RequestMapping(value = "cartmodify.do")
	public void cartmodify(int no, int cartamount) {
		dao.cartmodify(no, cartamount);
	}

	// 장바구니 목록 비우기(cart.jsp)
	@RequestMapping(value = "alldelete.do")
	public void alldelete(String ownerno) {
		dao.alldelete(ownerno);
	}

	// 장바구니 선택 삭제(cart.jsp)
	@RequestMapping(value = "checkdelete.do")
	public void checkdelete(String productcode) {
		dao.checkdelete(productcode);
	}

	// 장바구니 선택 주문(cart.jsp)
	@RequestMapping(value = "checkorder.do")
	public void checkorder(@RequestParam(value = "valueArrTest[]") List<String> checkList) {
		List<BmOrderBean> orderlist = new ArrayList<BmOrderBean>();
		for (int i = 0; i < checkList.size(); i++) {
			BmCartBean cartbean = dao.selectcart(checkList.get(i));
			BmOrderBean orderbean = new BmOrderBean();
			orderbean.setOwnerno(cartbean.getOwnerno());
			orderbean.setProductcode(cartbean.getProductcode());
			orderbean.setOrderamount(cartbean.getCartamount());
			orderlist.add(orderbean);
			dao.checkdelete(cartbean.getProductcode());
		}
		dao.checkorder(orderlist);
		
	}
}
