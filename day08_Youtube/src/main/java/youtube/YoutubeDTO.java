package youtube;

//IDX       NOT NULL NUMBER         
//TITLE     NOT NULL VARCHAR2(1000) 
//CHANNEL   NOT NULL VARCHAR2(1000) 
//THUMBNAIL NOT NULL VARCHAR2(2000) 
//IFRAME    NOT NULL VARCHAR2(2000)

public class YoutubeDTO {
	private int idx;
	private String title;
	private String channel;
	private String thumbNail;
	private String iframe;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getChannel() {
		return channel;
	}
	public void setChannel(String channel) {
		this.channel = channel;
	}
	public String getThumbNail() {
		return thumbNail;
	}
	public void setThumbNail(String thumbNail) {
		this.thumbNail = thumbNail;
	}
	public String getIframe() {
		return iframe;
	}
	public void setIframe(String iframe) {
		this.iframe = iframe;
	}
	
	

}
