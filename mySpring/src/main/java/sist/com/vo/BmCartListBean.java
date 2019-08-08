package sist.com.vo;

public class BmCartListBean {
	private int no;
	private String productcode;
	private int cartamount;
	private String productname;
	private int productprice;
	private String productimage;

	public BmCartListBean() {
		super();
	}

	public BmCartListBean(int no, String productcode, int cartamount, String productname, int productprice,
			String productimage) {
		super();
		this.no = no;
		this.productcode = productcode;
		this.cartamount = cartamount;
		this.productname = productname;
		this.productprice = productprice;
		this.productimage = productimage;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getProductcode() {
		return productcode;
	}

	public void setProductcode(String productcode) {
		this.productcode = productcode;
	}

	public int getCartamount() {
		return cartamount;
	}

	public void setCartamount(int cartamount) {
		this.cartamount = cartamount;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public int getProductprice() {
		return productprice;
	}

	public void setProductprice(int productprice) {
		this.productprice = productprice;
	}

	public String getProductimage() {
		return productimage;
	}

	public void setProductimage(String productimage) {
		this.productimage = productimage;
	}

	@Override
	public String toString() {
		return "BmCartListBean [no=" + no + ", productcode=" + productcode + ", cartamount=" + cartamount
				+ ", productname=" + productname + ", productprice=" + productprice + ", productimage=" + productimage
				+ "]";
	}


}
