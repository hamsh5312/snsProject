package com.dende.sns.ex;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class helloController {

	@ResponseBody
	@RequestMapping("/hallohallo")
	public String hallo() {
		return "hallo hello";
	}
}
