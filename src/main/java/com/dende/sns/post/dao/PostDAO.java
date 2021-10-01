package com.dende.sns.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.dende.sns.post.model.Post;

@Repository
public interface PostDAO {

	public int insertPost(
			@Param("userId") int userId
			, @Param("userName") String userName
			, @Param("content") String content
			, @Param("imagePath") String imagePath);
	
	
	public Post selectPost(
			@Param("id") int id
			, @Param("userId") int userId);
	
	
	
	public List<Post> selectPostList();
	
	public int deletePost(
			@Param("id") int id
			, @Param("userId") int userId);
	
	public int deleteLike(@Param("id") int id);
	
	public int deleteComment(@Param("id") int id);
	
}
