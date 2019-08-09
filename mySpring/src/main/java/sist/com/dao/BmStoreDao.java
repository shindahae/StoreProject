package sist.com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sist.com.vo.BmCartBean;
import sist.com.vo.BmCartListBean;
/*
import sist.com.model.CardBean;
import sist.com.model.ProductBean;*/
import sist.com.vo.BmEventBean;
import sist.com.vo.BmOrderBean;
import sist.com.vo.BmOrderListBean;
import sist.com.vo.BmProductBean;

@Repository(value = "bmDao")
public class BmStoreDao extends SqlSessionDaoSupport {

	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	// 총 열 수 구하기
	public Integer getBmTotalRow() {
		return this.getSqlSession().selectOne("getBmTotalRow");
	}

	// 전체 상품 목록을 가져옴
	public List<BmProductBean> productList() {
		return this.getSqlSession().selectList("productList");
	}

	// 메인에서 이벤트 상품 추천
	public List<BmProductBean> productSelectItem() {
		return this.getSqlSession().selectList("productSelectItem");
	}

	// 카테고리 선택 시 해당하는 리스트를 가져옴
	public List<BmProductBean> productSelectList(String category) {
		return this.getSqlSession().selectList("productSelectList", category);
	}

	// 제품상세페이지
	public BmProductBean productDetail(String productcode) {
		return this.getSqlSession().selectOne("productDetail", productcode);
	}

	// 메인에 자주 구매한 상품
	public List<BmProductBean> mainList(String ownerno) {
		return this.getSqlSession().selectList("mainList", ownerno);
	}

	// 깜짝세일 페이지에서 이벤트 테이블에 있는 데이터를 가져옴
	public List<BmEventBean> eventList() {
		return this.getSqlSession().selectList("eventList");
	}

	// 잘나가요 페이지 리스트 -> 주문내역이 많은 순으로 가져옴
	public List<BmProductBean> SelectjalList() {
		return this.getSqlSession().selectList("jalList");
	}

	// 장바구니 목록에 추가
	public void cartAdd(BmCartBean bean) {
		this.getSqlSession().insert("cartAdd", bean);
	}

	//// 장바구니 중복 체크
	public int cartcheck(String productcode) {
		return this.getSqlSession().selectOne("cartcheck", productcode);
	}

	// 장바구니 목록
	public List<BmCartListBean> cartList() {
		return this.getSqlSession().selectList("cartList");
	}

	// 장바구니 수량 수정
	public void cartmodify(int no, int cartamount) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("no", no);
		map.put("cartamount", cartamount);
		this.getSqlSession().update("cartmodify", map);
	}

	// 장바구니 목록 비우기
	public void alldelete(String ownerno) {
		this.getSqlSession().delete("alldelete", ownerno);
	}

	// 장바구니 선택 삭제
	public void checkdelete(String productcode) {
		this.getSqlSession().delete("checkdelete", productcode);
	}

	// [1] 장바구니 가져오기
	public BmCartBean selectcart(String productcode) {
		return this.getSqlSession().selectOne("selectcart", productcode);
	}

	// [2]장바구니 선택 주문
	public void checkorder(List<BmOrderBean> list) {
		for (int i = 0; i < list.size(); i++) {
			this.getSqlSession().insert("checkorder", list.get(i));
		}
	}

	// detail.jsp에서 바로 주문하기
	public void directorder(BmOrderBean bean) {
		this.getSqlSession().insert("checkorder", bean);
	}
	
	// 주문내역 (mypage.jsp)
	public List<BmOrderListBean> mypagelist(String ownerno){
		return this.getSqlSession().selectList("mypagelist",ownerno);
	}
	
	//// 장바구니 수량 (mypage.jsp)
	public int cartrownum(String ownerno){
		return this.getSqlSession().selectOne("cartrownum", ownerno);
	}
}
