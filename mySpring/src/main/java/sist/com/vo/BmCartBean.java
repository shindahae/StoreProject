package sist.com.vo;

public class BmCartBean {

	private int no;
	private String cartdate;
	private String ownerno;
	private String productcode;
	private int cartamount;
	public BmCartBean() {
		super();
	}
	public BmCartBean(int no, String cartdate, String ownerno, String productcode, int cartamount) {
		super();
		this.no = no;
		this.cartdate = cartdate;
		this.ownerno = ownerno;
		this.productcode = productcode;
		this.cartamount = cartamount;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getCartdate() {
		return cartdate;
	}
	public void setCartdate(String cartdate) {
		this.cartdate = cartdate;
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
	public int getCartamount() {
		return cartamount;
	}
	public void setCartamount(int cartamount) {
		this.cartamount = cartamount;
	}
	@Override
	public String toString() {
		return "BmCartBean [no=" + no + ", cartdate=" + cartdate + ", ownerno=" + ownerno + ", productcode="
				+ productcode + ", cartamount=" + cartamount + "]";
	}
	           
}
