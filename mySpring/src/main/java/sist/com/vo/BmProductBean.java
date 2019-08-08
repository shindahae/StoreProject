package sist.com.vo;

public class BmProductBean {
	private String category;
	private int no;
	private String productname;
	private String productcode;
	private int productprice;
	private String productunit;
	private String productdelivery;
	private int productcount;
	private String productproduction;
	private String productimage;
	private String priceView;

	public BmProductBean() {
		super();
	}

	public BmProductBean(String category, int no, String productname, String productcode, int productprice,
			String productunit, String productdelivery, int productcount, String productproduction, String productimage,
			String priceView) {
		super();
		this.category = category;
		this.no = no;
		this.productname = productname;
		this.productcode = productcode;
		this.productprice = productprice;
		this.productunit = productunit;
		this.productdelivery = productdelivery;
		this.productcount = productcount;
		this.productproduction = productproduction;
		this.productimage = productimage;
		this.priceView = priceView;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public String getProductcode() {
		return productcode;
	}

	public void setProductcode(String productcode) {
		this.productcode = productcode;
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

	public String getProductdelivery() {
		return productdelivery;
	}

	public void setProductdelivery(String productdelivery) {
		this.productdelivery = productdelivery;
	}

	public int getProductcount() {
		return productcount;
	}

	public void setProductcount(int productcount) {
		this.productcount = productcount;
	}

	public String getProductproduction() {
		return productproduction;
	}

	public void setProductproduction(String productproduction) {
		this.productproduction = productproduction;
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
		return "BmProductBean [category=" + category + ", no=" + no + ", productname=" + productname + ", productcode="
				+ productcode + ", productprice=" + productprice + ", productunit=" + productunit + ", productdelivery="
				+ productdelivery + ", productcount=" + productcount + ", productproduction=" + productproduction
				+ ", productimage=" + productimage + ", priceView=" + priceView + "]";
	}

}
