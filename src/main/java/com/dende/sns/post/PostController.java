package com.dende.sns.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dende.sns.post.bo.PostBO;
import com.dende.sns.post.model.Post;
import com.dende.sns.post.model.PostDetail;


@Controller
@RequestMapping("/post")
public class PostController {

	@Autowired
	private PostBO postBO;
	
	@GetMapping("/timeline")
	public String timeLine(Model model) {
		
		List<PostDetail> postList = postBO.getPostList();
		model.addAttribute("postList", postList);
		
		
		return "post/timeline";
	}
	
	
	
	
	
	
	
	
	@GetMapping("noLoginTimeline")
	public String noLogTimeline(
			Model model
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		session.removeAttribute("userId");
		session.removeAttribute("userName");
		List<Post> uploadContents = postBO.getAllPostList();
		model.addAttribute("uploadContents", uploadContents);
		
		return "post/timeline";
		
	}
	
	
}
