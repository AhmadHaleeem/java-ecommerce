package mycart.com.learn.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int pId;
	private String pName;
	@Column(length = 3000)
	private String pDesc;
	private String pPhoto;
	private int pPrice;
	private int pDiscount;
	private int pQuantity;
	@ManyToOne()
	private Category category;

	public Product() {
	}

	public Product(String pName, String pDesc, String pPhoto, int pPrice, int pDiscount, int pQuantity,
			Category category) {
		this.pName = pName;
		this.pDesc = pDesc;
		this.pPhoto = pPhoto;
		this.pPrice = pPrice;
		this.pDiscount = pDiscount;
		this.pQuantity = pQuantity;
		this.category = category;
	}

	/**
	 * @return the pId
	 */
	public int getpId() {
		return pId;
	}

	/**
	 * @param pId the pId to set
	 */
	public void setpId(int pId) {
		this.pId = pId;
	}

	/**
	 * @return the pName
	 */
	public String getpName() {
		return pName;
	}

	/**
	 * @param pName the pName to set
	 */
	public void setpName(String pName) {
		this.pName = pName;
	}

	/**
	 * @return the pDesc
	 */
	public String getpDesc() {
		return pDesc;
	}

	/**
	 * @param pDesc the pDesc to set
	 */
	public void setpDesc(String pDesc) {
		this.pDesc = pDesc;
	}

	/**
	 * @return the pPhoto
	 */
	public String getpPhoto() {
		return pPhoto;
	}

	/**
	 * @param pPhoto the pPhoto to set
	 */
	public void setpPhoto(String pPhoto) {
		this.pPhoto = pPhoto;
	}

	/**
	 * @return the pPrice
	 */
	public int getpPrice() {
		return pPrice;
	}

	/**
	 * @param pPrice the pPrice to set
	 */
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	/**
	 * @return the pDiscount
	 */
	public int getpDiscount() {
		return pDiscount;
	}

	/**
	 * @param pDiscount the pDiscount to set
	 */
	public void setpDiscount(int pDiscount) {
		this.pDiscount = pDiscount;
	}

	/**
	 * @return the pQuantity
	 */
	public int getpQuantity() {
		return pQuantity;
	}

	/**
	 * @param pQuantity the pQuantity to set
	 */
	public void setpQuantity(int pQuantity) {
		this.pQuantity = pQuantity;
	}

	/**
	 * @return the category
	 */
	public Category getCategory() {
		return category;
	}

	/**
	 * @param category the category to set
	 */
	public void setCategory(Category category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Product [pId=" + pId + ", pName=" + pName + ", pDesc=" + pDesc + ", pPhoto=" + pPhoto + ", pPrice="
				+ pPrice + ", pDiscount=" + pDiscount + ", pQuantity=" + pQuantity + "]";
	}

}
