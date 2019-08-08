package sist.com.vo;

public class BmEventBean {

	private int no;
	private String productcode;
	private String startdate;
	private String enddate;
	private int amount;
	private int sale;
	private String productname;
	private int productprice;
	private String productunit;
	private String productimage;
	private String priceView;

	public BmEventBean() {
		super();
	}

	public BmEventBean(int no, String productcode, String startdate, String enddate, int amount, int sale,
			String productname, int productprice, String productunit, String productimage, String priceView) {
		super();
		this.no = no;
		this.productcode = productcode;
		this.startdate = startdate;
		this.enddate = enddate;
		this.amount = amount;
		this.sale = sale;
		this.productname = productname;
		this.productprice = productprice;
		this.productunit = productunit;
		this.productimage = productimage;
		this.priceView = priceView;
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

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getSale() {
		return sale;
	}

	public void setSale(int sale) {
		this.sale = sale;
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

	public String getProductunit() {
		return productunit;
	}

	public void setProductunit(String productunit) {
		this.productunit = productunit;
	}

	public String getProductimage() {
		return productimage;
	}

	public void setProductimage(String productimage) {
		this.productimage = productimage;
	}

	public String getPriceView() {
		return priceView;
	}

	public void setPriceView(String priceView) {
		this.priceView = priceView;
	}

	@Override
	public String toString() {
		return "BmEventBean [no=" + no + ", productcode=" + productcode + ", startdate=" + startdate + ", enddate="
				+ enddate + ", amount=" + amount + ", sale=" + sale + ", productname=" + productname + ", productprice="
				+ productprice + ", productunit=" + productunit + ", productimage=" + productimage + ", priceView="
				+ priceView + "]";
	}

}
