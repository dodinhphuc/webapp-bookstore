package com.webapp.model;

public class LikeCommentModel extends AbstractModel<LikeCommentModel>{
	private Long userId;
	private Long commentId;

	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public Long getCommentId() {
		return commentId;
	}
	public void setCommentId(Long commentId) {
		this.commentId = commentId;
	}
	
	
}
		