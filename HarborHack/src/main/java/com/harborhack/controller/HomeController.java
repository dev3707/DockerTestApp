package com.harborhack.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.harborhack.model.Machine;
import com.harborhack.repository.MachineRepository;

@Controller
public class HomeController {

	@Autowired
	private MachineRepository repository;
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String showListmachines(ModelMap model) {
		String name = getLoggedInUserName();
		model.put("name", getLoggedInUserName());
		model.put("machines", repository.findByUser(name));
		return "listmachines";
	}

	private String getLoggedInUserName() {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			return ((UserDetails) principal).getUsername();
		}
		return principal.toString();
	}


	@RequestMapping(value = "/addmachine", method = RequestMethod.POST)
	public String addmachine(ModelMap model, /* @ModelAttribute("machine") */ @Valid Machine machine,
			BindingResult result) {
		if (result.hasErrors()) {
			return "machine";
		}

		machine.setUser(getLoggedInUserName());
		repository.save(machine);
		return "redirect:/";
	}

	@RequestMapping(value = "/deletemachine", method = RequestMethod.GET)
	public String deletemachine(ModelMap model, @RequestParam int id) {
				repository.deleteById(id);
		return "redirect:/";
	}

	@RequestMapping(value = "/updatemachine", method = RequestMethod.GET)
	public String showUpdatemachine(@RequestParam int id, ModelMap model) {

		Machine machine = repository.findById(id).get();
		model.put("machine", machine);
		return "machine";
	}

	@RequestMapping(value = "/updatemachine", method = RequestMethod.POST)
	public String updatemachine(ModelMap model, @Valid Machine machine, BindingResult result) {
		machine.setUser(getLoggedInUserName());
		if (result.hasErrors()) {
			return "machine";
		}
		repository.save(machine);
		return "redirect:/";
	}
	
	@RequestMapping(value = "/getInfo", method = RequestMethod.GET)
	public String getMachinePage(ModelMap model, @RequestParam int id) {
		Machine machine = repository.getOne(id);
		model.put("machine", machine);
		return "mymachine";
		
	}
	
}
