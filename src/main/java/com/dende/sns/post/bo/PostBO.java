package com.dende.sns.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.dende.sns.common.FileManagerService;
import com.dende.sns.post.dao.PostDAO;
import com.dende.sns.post.model.Post;


@Service
public class PostBO {

	@Autowired
	private PostDAO postDAO;
	
	public int addPost(int userId, String userName, String content, MultipartFile file) {
		
		String filePath = FileManagerService.saveFile(userId, file);
		
		if(filePath == null) {
			return -1;
		}
		
		return postDAO.insertPost(userId, userName, content, filePath);
		
	}
	
	public List<Post> getPostList(int userId){
		return postDAO.selectPostList(userId);
	}
	
	
}
