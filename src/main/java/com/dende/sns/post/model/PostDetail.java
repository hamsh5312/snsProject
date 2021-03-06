package com.dende.sns.post.model;

import java.util.List;

import com.dende.sns.post.comment.model.Comment;


// DTO, VO
public class PostDetail {
	
	private Post post;
	private List<Comment> commentList;
	private boolean isLike;       // isLike 의 게터 세터의 이름은 다르군... 아래 확인해보면 나옴
	private int likeCount;
	
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public List<Comment> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}
	public boolean isLike() {
		return isLike;
	}
	public void setLike(boolean isLike) {
		this.isLike = isLike;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	
	

	
	
}
