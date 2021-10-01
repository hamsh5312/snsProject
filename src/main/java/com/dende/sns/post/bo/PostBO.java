package com.dende.sns.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.dende.sns.common.FileManagerService;
import com.dende.sns.post.comment.bo.CommentBO;
import com.dende.sns.post.comment.model.Comment;
import com.dende.sns.post.dao.PostDAO;
import com.dende.sns.post.like.bo.LikeBO;
import com.dende.sns.post.model.Post;
import com.dende.sns.post.model.PostDetail;


@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	@Autowired 
	private CommentBO commentBO;
	
	@Autowired
	private LikeBO likeBO;
	
	public int addPost(int userId, String userName, String content, MultipartFile file) {
		String filePath = FileManagerService.saveFile(userId, file);
		if(filePath == null) {
			return -1;
		}
		return postDAO.insertPost(userId, userName, content, filePath);
	}
	
	public Post getPost(int id, int userId) {
		return postDAO.selectPost(id, userId);
	}
	
	
	public List<PostDetail> getPostList(Integer userId){
		
		List<Post> postList = postDAO.selectPostList();
		List<PostDetail> postDetailList = new ArrayList<>();
		
		// 포스트 하나당 댓글 가져오기
		for(Post post : postList) {
		
			// 해당하는 포스트의 댓글 가져오기
			List<Comment> commentList = commentBO.getCommentListByPostId(post.getId());
			
			PostDetail postDetail = new PostDetail();
			
			// 해당하는 포스트를 현재 로그인한 사용자가 좋아요 했는지 확인
			if(userId != null) {
				boolean isLike = likeBO.likeByUserId(post.getId(), userId);
				postDetail.setLike(isLike);
			}
			
			// 해당 포스트에 좋아요 개수
			int likeCount = likeBO.likeCount(post.getId());
			
			// post 와 댓글이 매칭
			
			postDetail.setPost(post);
			postDetail.setCommentList(commentList);
			postDetail.setLikeCount(likeCount);
	
			postDetailList.add(postDetail);
		}
		return postDetailList;
	}
	
	
	public int deletePost(int id, int userId) {
		// 아래 id 에 실질적으로 postId 가 전달된다.
		Post post = this.getPost(id, userId);
		
		if(post.getImagePath() != null) {
			FileManagerService.removeFile(post.getImagePath());
		}
	
		int count = postDAO.deletePost(id, userId);
		int likeResult = 0;
		int commentResult = 0;
		if(count == 1) {
			likeResult = postDAO.deleteLike(id);
			commentResult = postDAO.deleteComment(id);
			if(likeResult == 1 && commentResult == 1) {
				return count;	
			}else {
				return -1;
			}
			
		}else {
			// -1 로 쓰는거 맞나?
			return -1;
		}
	}
	
	
	
}
