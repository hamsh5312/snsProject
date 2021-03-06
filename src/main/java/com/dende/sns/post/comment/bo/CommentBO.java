package com.dende.sns.post.comment.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dende.sns.post.comment.dao.CommentDAO;
import com.dende.sns.post.comment.model.Comment;

@Service
public class CommentBO {

	@Autowired
	private CommentDAO commentDAO;
	
	public int inputComment(int postId, int userId, String userName, String content) {
		return commentDAO.insertComment(postId, userId, userName, content);
	}
	

	// postId 에 해당하는 댓글 리스트 가져오기
	public List<Comment> getCommentListByPostId(int postId){
		return commentDAO.selectCommentListByPostId(postId);
	}
	
	// postId 를 대상으로 삭제
	public int deleteCommentByPostId(int postId) {
		return commentDAO.deleteCommentByPostId(postId);
	}
	
}
