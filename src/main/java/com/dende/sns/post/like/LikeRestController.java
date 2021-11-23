package com.dende.sns.post.like;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.dende.sns.post.like.bo.LikeBO;

@RestController
@RequestMapping("/post")
public class LikeRestController {
	
	@Autowired
	private LikeBO likeBO;
	
	@GetMapping("/like")
	public Map<String, String> like(
			@RequestParam("postId") int postId
			, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
		
		Map<String, String> result = new HashMap<>();
		
		if(userId != null) {
			boolean isLike = likeBO.like(userId, postId);
			if(isLike) {
				result.put("result","success");			
			}else {
				result.put("result", "fail");
			}	
		}else {  // userId 가 null 일경우, 즉 비로그인 상태로 접속할 경우 좋아요는 실패하고 알림창뜨게 첫 세팅
			result.put("result","noLogin");
		}
		
		return result;
	}
	
	
	
	//  원래는 timeline 에서 likeBtn 과 unLikeBtn 두개를 설정해서 두개의 메소드로 분기해서 했었는데 
	// 그래서 아래와 같은 메소드를 만들었지만,  위의 "/post/like"만을 가지고도 충분히 구현이 가능했다.
	// 지금 코드의 현상태에서는 아래 메소드는 사용되지 않고 있다.  일단 만들어보았고, 참고 정도 하면 된다.
	@GetMapping("/unlike")
	public Map<String, String> unlike(
			@RequestParam("postId") int postId
			, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		Map<String ,String> result = new HashMap<>();
		
		int count = likeBO.unlike(userId, postId);
		
		if(count == 0) {
			result.put("result", "fail");
		}else {
			result.put("result", "success");
		}
		
		return result;
	}
	
	
}
