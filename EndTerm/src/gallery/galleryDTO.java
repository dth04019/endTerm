package gallery;

import java.sql.Date;

public class galleryDTO {

	private int galleryID;
	private String galleryTitle;
	private String galleryAuthor;
	private String galleryPlace;
	private Date galleryStart;
	private Date galleryEnd;
	private String galleryThumbnail;
	private String galleryImageFirst;
	private String galleryImageSecond;
	private String galleryImageThird;
	private String galleryImageFourth;
	private String galleryImageFifth;
	
	public galleryDTO() {
		
	}
	public galleryDTO(int galleryID, String galleryTitle, String galleryAuthor, String galleryPlace, Date galleryStart,
			Date galleryEnd, String galleryThumbnail, String galleryImageFirst, String galleryImageSecond,
			String galleryImageThird, String galleryImageFourth, String galleryImageFifth) {
		super();
		this.galleryID = galleryID;
		this.galleryTitle = galleryTitle;
		this.galleryAuthor = galleryAuthor;
		this.galleryPlace = galleryPlace;
		this.galleryStart = galleryStart;
		this.galleryEnd = galleryEnd;
		this.galleryThumbnail = galleryThumbnail;
		this.galleryImageFirst = galleryImageFirst;
		this.galleryImageSecond = galleryImageSecond;
		this.galleryImageThird = galleryImageThird;
		this.galleryImageFourth = galleryImageFourth;
		this.galleryImageFifth = galleryImageFifth;
	}
	
	
	public int getGalleryID() {
		return galleryID;
	}
	public void setGalleryID(int galleryID) {
		this.galleryID = galleryID;
	}
	public String getGalleryTitle() {
		return galleryTitle;
	}
	public void setGalleryTitle(String galleryTitle) {
		this.galleryTitle = galleryTitle;
	}
	public String getGalleryAuthor() {
		return galleryAuthor;
	}
	public void setGalleryAuthor(String galleryAuthor) {
		this.galleryAuthor = galleryAuthor;
	}
	public String getGalleryPlace() {
		return galleryPlace;
	}
	public void setGalleryPlace(String galleryPlace) {
		this.galleryPlace = galleryPlace;
	}
	public Date getGalleryStart() {
		return galleryStart;
	}
	public void setGalleryStart(Date galleryStart) {
		this.galleryStart = galleryStart;
	}
	public Date getGalleryEnd() {
		return galleryEnd;
	}
	public void setGalleryEnd(Date galleryEnd) {
		this.galleryEnd = galleryEnd;
	}
	public String getGalleryThumbnail() {
		return galleryThumbnail;
	}
	public void setGalleryThumbnail(String galleryThumbnail) {
		this.galleryThumbnail = galleryThumbnail;
	}
	public String getGalleryImageFirst() {
		return galleryImageFirst;
	}
	public void setGalleryImageFirst(String galleryImageFirst) {
		this.galleryImageFirst = galleryImageFirst;
	}
	public String getGalleryImageSecond() {
		return galleryImageSecond;
	}
	public void setGalleryImageSecond(String galleryImageSecond) {
		this.galleryImageSecond = galleryImageSecond;
	}
	public String getGalleryImageThird() {
		return galleryImageThird;
	}
	public void setGalleryImageThird(String galleryImageThird) {
		this.galleryImageThird = galleryImageThird;
	}
	public String getGalleryImageFourth() {
		return galleryImageFourth;
	}
	public void setGalleryImageFourth(String galleryImageFourth) {
		this.galleryImageFourth = galleryImageFourth;
	}
	public String getGalleryImageFifth() {
		return galleryImageFifth;
	}
	public void setGalleryImageFifth(String galleryImageFifth) {
		this.galleryImageFifth = galleryImageFifth;
	}
	
	
}
