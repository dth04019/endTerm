package comment;

public class commentDTO {
	private int commentID;
	private String userID;
	private int galleryID;
	private String commentTitle;
	private String commentContent;
	private double commentTotal;
	private double commentAccessibility;
	private double commentArt;
	private double commentPlace;
	private String galleryTitle;
	
	public commentDTO() {		
	}
	
	public commentDTO(int commentID, String userID, int galleryID, String commentTitle, String commentContent,
			double commentTotal, double commentAccessibility, double commentArt, double commentPlace, int likeCount, String galleryTitle) {
		super();
		this.commentID = commentID;
		this.userID = userID;
		this.galleryID = galleryID;
		this.galleryTitle = galleryTitle;
		this.commentTitle = commentTitle;
		this.commentContent = commentContent;
		this.commentTotal = commentTotal;
		this.commentAccessibility = commentAccessibility;
		this.commentArt = commentArt;
		this.commentPlace = commentPlace;
		this.likeCount = likeCount;
	}
	public int getCommentID() {
		return commentID;
	}
	public void setCommentID(int commentID) {
		this.commentID = commentID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
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
	public String getCommentTitle() {
		return commentTitle;
	}
	public void setCommentTitle(String commentTitle) {
		this.commentTitle = commentTitle;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public double getCommentTotal() {
		return commentTotal;
	}
	public void setCommentTotal(double commentTotal) {
		this.commentTotal = commentTotal;
	}
	public double getCommentAccessibility() {
		return commentAccessibility;
	}
	public void setCommentAccessibility(double commentAccessibility) {
		this.commentAccessibility = commentAccessibility;
	}
	public double getCommentArt() {
		return commentArt;
	}
	public void setCommentArt(double commentArt) {
		this.commentArt = commentArt;
	}
	public double getCommentPlace() {
		return commentPlace;
	}
	public void setCommentPlace(double commentPlace) {
		this.commentPlace = commentPlace;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	private int likeCount;
	
	
}
