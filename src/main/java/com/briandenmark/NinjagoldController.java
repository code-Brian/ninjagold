package com.briandenmark;

import java.util.ArrayList;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class NinjagoldController {
	Random rand = new Random();
	public int addGold(int min, int max) {
		int goldEarned = min + rand.nextInt((max+1)-min);
		return goldEarned;
	}
	@RequestMapping("/")
	public String index(Model model) {
		model.getAttribute("goldBalance");
		
		return "index.jsp";
	}
	
	@PostMapping("/addGold")
	public String addGold(HttpSession session, 
			Model model,
			@RequestParam(value="min") Integer min,
			@RequestParam(value="max") Integer max,
			@RequestParam(value="questName") String questName) {
			if(session.getAttribute("goldBalance") == null) {
				session.setAttribute("goldBalance", 0);
			}
			System.out.println("goldBalance after getting it from session: " + session.getAttribute("goldBalance"));
			Integer goldEarned = addGold(min,max);
			Integer sum = goldEarned + (Integer)session.getAttribute("goldBalance");
			session.setAttribute("goldBalance", sum);
			model.addAttribute("goldBalance", session.getAttribute("goldBalance"));
			
			ArrayList<String> allMessages = new ArrayList<String>();
			allMessages.add(new String("Visited " + questName + " and earned " + goldEarned + " gold."));
			if(session.getAttribute("allMessages") != null) {
				ArrayList<String> previousMessage = new ArrayList<String>(session.getAttribute("allMessages"));
				System.out.println("previous message was: " + previousMessage);
			}
			session.setAttribute("allMessages", allMessages);
			model.addAttribute("allMessages", session.getAttribute("allMessages"));
			System.out.println("First message is: " + model.getAttribute("allMessages"));
			System.out.println("Visted " + questName + " and earned " + goldEarned + " gold.");
			System.out.println("Gold balance: " + session.getAttribute("goldBalance"));

		return "redirect:/";
	}
}
