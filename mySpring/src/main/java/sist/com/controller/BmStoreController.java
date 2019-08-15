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
import sist.com.vo.BmOrderListBean;
import sist.com.vo.BmProductBean;
import twitter4j.HttpResponse;

@RestController
@SessionAttributes(value = { "info" })
public class BmStoreController {
	@Resource(name = "bmDao")
	private BmStoreDao dao;

	// ���ο� ���� ������ ��ǰ (main.jsp)
	@RequestMapping(value = "mainList.do")
	public List<BmProductBean> productMainList() {
		///////////////// ���Ƿ� INSERT///////////////////////////
		String ownerno = "TESTOWNER01";
		////////////////////////////////////////////
		List<BmProductBean> list = dao.mainList(ownerno);
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
				a.append("��");
				priceview = a.toString();
			}
			list.get(i).setPriceView(priceview);
		}
		return list;
	}

	// ���ο��� �̺�Ʈ ��ǰ ��õ (main.jsp)
	@RequestMapping(value = "mainSelectItem.do")
	public List<BmProductBean> productSelectItem(Model model) {
		List<BmProductBean> list = dao.productSelectItem();
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
				a.append("��");
				priceview = a.toString();
			}
			list.get(i).setPriceView(priceview);
		}
		return list;
	}

	// ���ο��� �̺�Ʈ�̹��� Ŭ�� �� ī�װ��� ���� (main.jsp)
	// ���� ���� �ʿ�
	@RequestMapping(value = "mainEvent.do")
	public ModelAndView mainEvent(String category, ModelAndView mv) {
		System.out.println("�����̺�ƮŬ��");
		String str = "";
		if (category.equals("category2")) {
			str = "���左,��";
		}
		if (category.equals("category3")) {
			str = "���̺���";
		}
		if (category.equals("category4")) {
			str = "��Һ���";
		}
		if (category.equals("category5")) {
			str = "����";
		}
		if (category.equals("category6")) {
			str = "������ǰ";
		}
		if (category.equals("category7")) {
			str = "����õ�";
		}
		if (category.equals("category8")) {
			str = "������ǰ";
		}
		if (category.equals("category9")) {
			str = "����";
		}
		if (category.equals("category10")) {
			str = "��";
		}
		if (category.equals("category11")) {
			str = "����깰";
		}
		if (category.equals("category12")) {
			str = "��";
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

	// ��¦���� ���������� �̺�Ʈ ���̺� �ִ� �����͸� ������ (timesale.jsp)
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
				a.append("��");
				priceview = a.toString();
			}
			list.get(i).setPriceView(priceview);
		}
		return list;
	}

	// ��ǰ�������� (detail.jsp)
	@RequestMapping(value = "detail.do")
	public String productDetail(HttpServletResponse response, Model model,
			@RequestParam(value = "productcode", required = true, defaultValue = "0") String productcode)
			throws IOException {
		model.addAttribute("info", dao.productDetail(productcode));
		response.sendRedirect("store/detail.jsp");
		return "detail";
	}

	// ī�װ� ���� �� �ش��ϴ� ����Ʈ�� ������ (category.jsp)
	@RequestMapping(value = "productSelectList.do")
	public List<BmProductBean> productSelectList(String category) {
		String str = "";
		List<BmProductBean> list = null;
		if (category.equals("category1")) {
			list = dao.productList();// ��ü ��ǰ ���
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
					a.append("��");
					priceview = a.toString();
				}
				list.get(i).setPriceView(priceview);
			}
		} else {
			if (category.equals("category2")) {
				str = "���左,��";
			}
			if (category.equals("category3")) {
				str = "���̺���";
			}
			if (category.equals("category4")) {
				str = "��Һ���";
			}
			if (category.equals("category5")) {
				str = "����";
			}
			if (category.equals("category6")) {
				str = "������ǰ";
			}
			if (category.equals("category7")) {
				str = "����õ�";
			}
			if (category.equals("category8")) {
				str = "������ǰ";
			}
			if (category.equals("category9")) {
				str = "����";
			}
			if (category.equals("category10")) {
				str = "��";
			}
			if (category.equals("category11")) {
				str = "����깰";
			}
			if (category.equals("category12")) {
				str = "��";
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
					a.append("��");
					priceview = a.toString();
				}
				list.get(i).setPriceView(priceview);
			}
		}
		return list;
	}

	// �߳����� ������ ����Ʈ -> �ֹ������� ���� ������ ������ (jalnagayo.jsp)
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
				a.append("��");
				priceview = a.toString();
			}
			list.get(i).setPriceView(priceview);
		}
		return list;
	}

	// ��ٱ��� ��Ͽ� �߰� (detail.jsp)
	@RequestMapping(value = "cartAdd.do")
	public String cartAdd(BmCartBean bean, HttpServletResponse response) throws IOException {
		dao.cartAdd(bean);
		String productcode = bean.getProductcode();
		response.sendRedirect("store/cart.jsp");
		return "cart";
	}

	// ��ٱ��� �ߺ� üũ (detail.jsp)
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

	// ��ٱ��� ��� �������� (cart.jsp)
	@RequestMapping(value = "cartList.do")
	public List<BmCartListBean> cartList() {
		List<BmCartListBean> list = dao.cartList();
		return list;
	}

	// ��ٱ��� ���� ���� (cart.jsp)
	@RequestMapping(value = "cartmodify.do")
	public void cartmodify(int no, int cartamount) {
		dao.cartmodify(no, cartamount);
	}

	// ��ٱ��� ��� ����(cart.jsp)
	@RequestMapping(value = "alldelete.do")
	public void alldelete(String ownerno) {
		dao.alldelete(ownerno);
	}

	// ��ٱ��� ���� ����(cart.jsp)
	@RequestMapping(value = "checkdelete.do")
	public void checkdelete(String productcode) {
		dao.checkdelete(productcode);
	}

	// ��ٱ��� ���� �ֹ�(cart.jsp)
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

	// �ٷ� �ֹ��ϱ�(detail.jsp)
	@RequestMapping(value = "directorder.do")
	public void directorder(String productcode, int cartamount, String ownerno) throws Exception {
		BmOrderBean orderbean = new BmOrderBean();
		orderbean.setOwnerno(ownerno);
		orderbean.setProductcode(productcode);
		orderbean.setOrderamount(cartamount);
		dao.directorder(orderbean);
	}

	// �ֹ����� (mypage.jsp)
	@RequestMapping(value = "mypagelist.do")
	public List<BmOrderListBean> mypagelist(String ownerno) {
		List<BmOrderListBean> list = dao.mypagelist(ownerno);
		return list;
	}

	// ��ٱ��� ���� (mypage.jsp)
	@RequestMapping(value = "cartrownum.do")
	public int cartrownum(String ownerno) {
		int cartrow = dao.cartrownum(ownerno);
		return cartrow;
	}

	// �˻� (search.jsp)
	@RequestMapping(value = "search.do", produces="application/json;charset=utf8")
	public List<BmProductBean> search(String select, String searchdata) {
		List<BmProductBean> list = dao.searchList(select, searchdata);
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
				a.append("��");
				priceview = a.toString();
			}
			list.get(i).setPriceView(priceview);
		}
		return list;
	}
}
