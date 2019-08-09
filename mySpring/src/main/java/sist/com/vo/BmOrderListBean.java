package sist.com.vo;

public class BmOrderListBean {

	private int no;
	private String productcode;
	private String productname;
	private String productimage;
	private String orderdate;
	private int orderamount;
	private int productprice;
	private String orderstatus;

	public BmOrderListBean() {
		super();
	}

	public BmOrderListBean(int no, String productcode, String productname, String productimage, String orderdate,
			int orderamount, int productprice, String orderstatus) {
		super();
		this.no = no;
		this.productcode = productcode;
		this.productname = productname;
		this.productimage = productimage;
		this.orderdate = orderdate;
		this.orderamount = orderamount;
		this.productprice = productprice;
		this.orderstatus = orderstatus;
	}

	public int getProductprice() {
		return productprice;
	}

	public void setProductprice(int productprice) {
		this.productprice = productprice;
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

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public String getProductimage() {
		return productimage;
	}

	public void setProductimage(String productimage) {
		this.productimage = productimage;
	}

	public String getOrderstatus() {
		return orderstatus;
	}

	public void setOrderstatus(String orderstatus) {
		this.orderstatus = orderstatus;
	}

	@Override
	public String toString() {
		return "BmOrderListBean [no=" + no + ", productcode=" + productcode + ", productname=" + productname
				+ ", productimage=" + productimage + ", orderdate=" + orderdate + ", orderamount=" + orderamount
				+ ", productprice=" + productprice + ", orderstatus=" + orderstatus + "]";
	}

}
