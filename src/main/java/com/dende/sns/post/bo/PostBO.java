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
			postDetail.setCommentList(commentList);
			postDetail.setPost(post);
			
			// 해당 포스트에 좋아요 개수
			int likeCount = likeBO.likeCount(post.getId());
			// post 와 댓글이 매칭
			
			// 해당하는 포스트를 현재 로그인한 사용자가 좋아요 했는지 확인
			if(userId != null) {
				boolean isLike = likeBO.likeByUserIdPostId(post.getId(), userId);
				postDetail.setLike(isLike);
			}
			postDetail.setLikeCount(likeCount);
			postDetailList.add(postDetail);
		}
		
		
		return postDetailList;
	}
	
	
	public boolean deletePost(int id, int userId) {
		// 아래 id 에 실질적으로 postId 가 전달된다.
		Post post = this.getPost(id, userId);
		
		int count = postDAO.deletePost(id, userId);
		if(count != 1) {
			return false;
		}
		
		FileManagerService fileManagerService = new FileManagerService();
		fileManagerService.removeFile(post.getImagePath());
		
		// 댓글, 좋아요 삭제 
		commentBO.deleteCommentByPostId(id);
		likeBO.deleteLikeByPostId(id);
		
		return true;
	}
		
}
