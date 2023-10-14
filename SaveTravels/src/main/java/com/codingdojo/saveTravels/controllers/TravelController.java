package com.codingdojo.saveTravels.controllers;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.codingdojo.saveTravels.models.Travel;
import com.codingdojo.saveTravels.services.TravelService;

import jakarta.validation.Valid;

@Controller
public class TravelController {
	
	@Autowired
	TravelService travelService;
	
	// Create
	@PostMapping("/expense")
	public String addTravel(
			@Valid @ModelAttribute("travel") Travel travel,
			BindingResult result ) {
		if (result.hasErrors()) {
			return "index.jsp";
		}
		travelService.createTravel(travel);
		return "redirect:/expenses";
	
	}
	
	// Read All
	@GetMapping("/expenses")
	public String index(@ModelAttribute("travel") Travel travel, Model model) {
		ArrayList<Travel> travels = travelService.getAllTravels();
		model.addAttribute("travels", travels);
		return "index.jsp";
	}
	
	@GetMapping("/")
	public String redirect() {
		return "redirect:/expenses";
	}
	
	// Read One
	@GetMapping("/expenses/{id}")
	public String getOne(Model model, @PathVariable("id") Long id) {
		Travel travel = travelService.findTravel(id);
		model.addAttribute("travel", travel);
		return "view.jsp";
	}
	
	// Update
	@GetMapping("/expenses/edit/{id}")
	public String editPage(Model model, @PathVariable("id") Long id) {
		Travel travel = travelService.findTravel(id);
		model.addAttribute("travel", travel);
		return "edit.jsp";
	}
	
	@RequestMapping(value="/expense/{id}", method=RequestMethod.PUT)
	public String edit(@Valid @ModelAttribute("travel") Travel travel, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("travel", travel);
			return "edit.jsp";
		} else {
			travelService.updateTravel(travel);
			return "redirect:/";
		}
	}
	
	// Delete
	@DeleteMapping("/expense/delete/{id}")
	public String delete(@PathVariable("id") Long id) {
		travelService.deleteTravel(id);
		return "redirect:/expenses";
	}
			
}
