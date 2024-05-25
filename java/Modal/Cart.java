package Modal;

public class Cart {
	private int cid, cusid, pid, sid, pprice, pqty, total;
	private String image, pbrands, pcategory, ptype, payment_status;

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getCusid() {
		return cusid;
	}

	public void setCusid(int cusid) {
		this.cusid = cusid;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getPbrands() {
		return pbrands;
	}

	public void setPbrands(String pbrands) {
		this.pbrands = pbrands;
	}

	public String getPcategory() {
		return pcategory;
	}

	public void setPcategory(String pcategory) {
		this.pcategory = pcategory;
	}

	public String getPtype() {
		return ptype;
	}

	public void setPtype(String ptype) {
		this.ptype = ptype;
	}

	public int getPprice() {
		return pprice;
	}

	public void setPprice(int pprice) {
		this.pprice = pprice;
	}

	public int getPqty() {
		return pqty;
	}

	public void setPqty(int pqty) {
		this.pqty = pqty;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getPayment_status() {
		return payment_status;
	}

	public void setPayment_status(String payment_status) {
		this.payment_status = payment_status;
	}

	@Override
	public String toString() {
		return "Cart [cid=" + cid + ", cusid=" + cusid + ", pid=" + pid + ", sid=" + sid + ", pprice=" + pprice
				+ ", pqty=" + pqty + ", total=" + total + ", image=" + image + ", pbrands=" + pbrands + ", pcategory="
				+ pcategory + ", ptype=" + ptype + ", payment_status=" + payment_status + "]";
	}

}
