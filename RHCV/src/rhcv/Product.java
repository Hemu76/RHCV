package rhcv;

public class Product {
	private Integer productId;
	private String productName;
	private String hsnCode;
	private Double price;
	private Integer categoryId;

	public Product() {

	}

	public Product(Integer productId, String productName, String hsnCode, Double price, Integer categoryId) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.hsnCode = hsnCode;
		this.price = price;
		this.categoryId = categoryId;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getHsnCode() {
		return hsnCode;
	}

	public void setHsnCode(String hsnCode) {
		this.hsnCode = hsnCode;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	// Getters and setters
}
