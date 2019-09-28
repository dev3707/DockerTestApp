package com.harborhack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.harborhack.model.Machine;
import com.harborhack.service.RestTemplateService;
import reactor.core.publisher.Flux;

@Controller
public class AjaxController {

	@Autowired
	private RestTemplateService restTemplateService;
	
	
	@GetMapping(value="/getContainers", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> getDockerContainerList(@RequestParam("id") int machineId)
	{
		System.out.println("machineId received is"+machineId);
		return restTemplateService.getContainerList(machineId);
		
	}
	@GetMapping(value="/events", produces = MediaType.APPLICATION_STREAM_JSON_VALUE)
	public Flux<String> getEvents(@RequestParam("id") int machineId)
	{
		return restTemplateService.getEvents(machineId);
	}
	@GetMapping(value="/getImages", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> getDockerImageList(@RequestParam("id") int machineId)
	{
		return restTemplateService.getImagesList(machineId);
		
	}
	
	@GetMapping(value="/getNetworks",produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> getDockerNetworks(@RequestParam("id") int machineId)
	{
		return restTemplateService.getServiceNetworks(machineId);
	}
	
	@GetMapping(value = "/pullImage", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> pullImages(ModelMap model, @RequestParam("machineid") int id,@RequestParam("imageName") String imageName) {
		
		return restTemplateService.pullImageOnMachines(id,imageName);
		
	}
	
}
