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

	// �� �� �� ���ϱ�
	public Integer getBmTotalRow() {
		return this.getSqlSession().selectOne("getBmTotalRow");
	}

	// ��ü ��ǰ ����� ������
	public List<BmProductBean> productList() {
		return this.getSqlSession().selectList("productList");
	}

	// ���ο��� �̺�Ʈ ��ǰ ��õ
	public List<BmProductBean> productSelectItem() {
		return this.getSqlSession().selectList("productSelectItem");
	}

	// ī�װ� ���� �� �ش��ϴ� ����Ʈ�� ������
	public List<BmProductBean> productSelectList(String category) {
		return this.getSqlSession().selectList("productSelectList", category);
	}

	// ��ǰ��������
	public BmProductBean productDetail(String productcode) {
		return this.getSqlSession().selectOne("productDetail", productcode);
	}

	// ���ο� ���� ������ ��ǰ
	public List<BmProductBean> mainList(String ownerno) {
		return this.getSqlSession().selectList("mainList", ownerno);
	}

	// ��¦���� ���������� �̺�Ʈ ���̺� �ִ� �����͸� ������
	public List<BmEventBean> eventList() {
		return this.getSqlSession().selectList("eventList");
	}

	// �߳����� ������ ����Ʈ -> �ֹ������� ���� ������ ������
	public List<BmProductBean> SelectjalList() {
		return this.getSqlSession().selectList("jalList");
	}

	// ��ٱ��� ��Ͽ� �߰�
	public void cartAdd(BmCartBean bean) {
		this.getSqlSession().insert("cartAdd", bean);
	}

	//// ��ٱ��� �ߺ� üũ
	public int cartcheck(String productcode) {
		return this.getSqlSession().selectOne("cartcheck", productcode);
	}

	// ��ٱ��� ���
	public List<BmCartListBean> cartList() {
		return this.getSqlSession().selectList("cartList");
	}

	// ��ٱ��� ���� ����
	public void cartmodify(int no, int cartamount) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("no", no);
		map.put("cartamount", cartamount);
		this.getSqlSession().update("cartmodify", map);
	}

	// ��ٱ��� ��� ����
	public void alldelete(String ownerno) {
		this.getSqlSession().delete("alldelete", ownerno);
	}

	// ��ٱ��� ���� ����
	public void checkdelete(String productcode) {
		this.getSqlSession().delete("checkdelete", productcode);
	}

	// [1] ��ٱ��� ��������
	public BmCartBean selectcart(String productcode) {
		return this.getSqlSession().selectOne("selectcart", productcode);
	}

	// [2]��ٱ��� ���� �ֹ�
	public void checkorder(List<BmOrderBean> list) {
		for (int i = 0; i < list.size(); i++) {
			this.getSqlSession().insert("checkorder", list.get(i));
		}
	}

	// detail.jsp���� �ٷ� �ֹ��ϱ�
	public void directorder(BmOrderBean bean) {
		this.getSqlSession().insert("checkorder", bean);
	}
	
	// �ֹ����� (mypage.jsp)
	public List<BmOrderListBean> mypagelist(String ownerno){
		return this.getSqlSession().selectList("mypagelist",ownerno);
	}
	
	//// ��ٱ��� ���� (mypage.jsp)
	public int cartrownum(String ownerno){
		return this.getSqlSession().selectOne("cartrownum", ownerno);
	}
}
