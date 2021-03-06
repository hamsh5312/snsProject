package com.dende.sns.post.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dende.sns.post.like.dao.LikeDAO;

@Service
public class LikeBO {

	@Autowired
	private LikeDAO likeDAO;
	
	public boolean like(int userId, int postId) {
		
		// 좋아요 상태면 좋아요 취소
		if(this.likeByUserIdPostId(postId, userId)) {
			int count = likeDAO.deleteLike(userId, postId);
			if(count == 0) {
				return false;
			}else {
				return true;
			}
		}else {  // 좋아요 취소 상태면 좋아요
			int count = likeDAO.insertLike(userId, postId);
			if(count == 1) {
				return true;
			}else {
				return false;
			}
		}
		
	}
	
	
	public int unlike(int userId, int postId) {
		return likeDAO.deleteLike(userId, postId);
	}
	
	// postId 와 userId로 좋아요 여부 확인
	public boolean likeByUserIdPostId(int postId, int userId) {
		int count = likeDAO.selectCountLikeByUserIdPostId(postId, userId);
		
		if(count == 0) {
			return false;
		}else {
			return true;
		}	
	}
	
	// postId 로 생성된 좋아요 개수
	public int likeCount(int postId) {
		return likeDAO.selectCountLikeByPostId(postId);
	}
	
	public int deleteLikeByPostId(int postId) {
		return likeDAO.deleteLikeByPostId(postId);
	}
	
	
}
