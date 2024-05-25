package Modal;

public class Product {
	private int pid,sid;
	private double pprice;
	private String image,pbrands,pcategory,ptype;
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
	public double getPprice() {
		return pprice;
	}
	public void setPprice(double pprice) {
		this.pprice = pprice;
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
	@Override
	public String toString() {
		return "Product [pid=" + pid + ", sid=" + sid + ", pprice=" + pprice + ", image=" + image + ", pbrands="
				+ pbrands + ", pcategory=" + pcategory + ", ptype=" + ptype + "]";
	}
	
	
}
