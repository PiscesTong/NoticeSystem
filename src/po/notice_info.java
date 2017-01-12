package po;

import java.util.Date;

public class notice_info {
	private int nno;
	private String title;
	private String content;
	private String editor;
	private Date creattime;
	private int type;
	
	public int getNno() {
		return nno;
	}
	public void setNno(int nno) {
		this.nno = nno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getEditor() {
		return editor;
	}
	public void setEditor(String editor) {
		this.editor = editor;
	}
	public Date getCreattime() {
		return creattime;
	}
	public void setCreattime(Date creattime) {
		this.creattime = creattime;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "notice_info [nno=" + nno + ", title=" + title + ", content="
				+ content + ", editor=" + editor + ", creattime=" + creattime
				+ ", type=" + type + "]";
	}
}
