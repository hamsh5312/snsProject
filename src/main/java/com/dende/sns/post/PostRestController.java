package com.dende.sns.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.dende.sns.post.bo.PostBO;
import com.dende.sns.post.model.Post;



@RestController
@RequestMapping("/post")
public class PostRestController {

	@Autowired
	private PostBO postBO;
	
	@PostMapping("/create")
	public Map<String ,String> create(
			@RequestParam("content") String content
			, @RequestParam(value = "file") MultipartFile file
			, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		// getAttribute의 리턴형이 Object 형이라서  형변환이 필요
		int userId = (Integer)session.getAttribute("userId");
		String userName = (String)session.getAttribute("userName");
		
		Map<String, String> result = new HashMap<>();
		
		int count = postBO.addPost(userId, userName, content, file);
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}	
		return result;
	}
	
	
	@GetMapping("/delete")
	public Map<String ,String> delete(
			@RequestParam("postId") int postId
			, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		Map<String ,String> result = new HashMap<>();
		
		// 여기서 user의 id와 post의 userId 가 일치하는지를 따지고 분기해서 result.put값을 달리해서 최종 result 리턴
		Post deleteCheck = postBO.getPost(postId, userId);
		
		// deleteCheck 가 null 이 아닐경우만! 즉, 해당 게시물(post)를 올린 userId와 postId(post에서 id) 가 정확히 일치할때만 삭제를 진행 !
		if(deleteCheck != null) {
			
			if(postBO.deletePost(postId, userId)) {
				result.put("result", "success");
			}else {
				result.put("result", "fail");
			}
			
			return result;
			
		}else {      // 해당 게시물을 올린 userId 가 아닐 경우 삭제 금지
			result.put("result", "noMatch");
			return result;
		}
		
	}
	
	
	
	
}
