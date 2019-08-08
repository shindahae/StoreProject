package sist.com.vo;

public class BmOrderBean {

	private int no;
	private String orderdate;
	private String ownerno;
	private String productcode;
	private int orderamount;
	private String delivery;

	public BmOrderBean() {
		super();
	}

	public BmOrderBean(int no, String orderdate, String ownerno, String productcode, int orderamount, String delivery) {
		super();
		this.no = no;
		this.orderdate = orderdate;
		this.ownerno = ownerno;
		this.productcode = productcode;
		this.orderamount = orderamount;
		this.delivery = delivery;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}

	public String getOwnerno() {
		return ownerno;
	}

	public void setOwnerno(String ownerno) {
		this.ownerno = ownerno;
	}

	public String getProductcode() {
		return productcode;
	}

	public void setProductcode(String productcode) {
		this.productcode = productcode;
	}

	public int getOrderamount() {
		return orderamount;
	}

	public void setOrderamount(int orderamount) {
		this.orderamount = orderamount;
	}

	public String getDelivery() {
		return delivery;
	}

	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}

	@Override
	public String toString() {
		return "BmOrderBean [no=" + no + ", orderdate=" + orderdate + ", ownerno=" + ownerno + ", productcode="
				+ productcode + ", orderamount=" + orderamount + ", delivery=" + delivery + "]";
	}

}
