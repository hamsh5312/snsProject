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
import com.dende.sns.post.model.Post;
import com.dende.sns.post.model.PostDetail;


@Service
public class PostBO {

	@Autowired
	private PostDAO postDAO;
	
	@Autowired CommentBO commentBO;
	
	
	public int addPost(int userId, String userName, String content, MultipartFile file) {
		
		String filePath = FileManagerService.saveFile(userId, file);
		
		if(filePath == null) {
			return -1;
		}
		
		return postDAO.insertPost(userId, userName, content, filePath);
		
	}
	
	public List<PostDetail> getPostList(){
		
		List<Post> postList = postDAO.selectPostList();
		
		List<PostDetail> postDetailList = new ArrayList<>();
		
		
		// 포스트 하나당 댓글 가져오기
		for(Post post : postList) {
			// 해당하는 포스트의 댓글 가져오기
			List<Comment> commentList = commentBO.getCommentListByPostId(post.getId());
			
			// post 와 댓글이 매칭
			PostDetail postDetail = new PostDetail();
			postDetail.setPost(post);
			postDetail.setCommentList(commentList);
			
			postDetailList.add(postDetail);
		}
		
		
		return postDetailList;
	}
	
	
	
	
	
	
	
	public List<Post> getAllPostList(){
		return postDAO.selectAllPostList();
	}
	
}
