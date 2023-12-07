package ex06;

public class MemberDTO {
	
	private String name;
	private String imgPath;
	
	// 매개변수를 받지않는 기본생성자가 꼭 있어야 
	// jabaBeans를 사용할 수 있다
	public MemberDTO() {}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
		this.imgPath = "image/" + name + ".png";
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	

}
