package com.harborhack.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.util.UriComponentsBuilder;

import com.harborhack.model.Machine;
import com.harborhack.repository.MachineRepository;
import reactor.core.publisher.Flux;

@Service
public class RestTemplateService {

	@Autowired
	private MachineRepository machineRepository;

	@Autowired
	private RestTemplate restTemplate;

	public ResponseEntity<String> getImagesList(int machineId) {

		Machine machine = machineRepository.getOne(machineId);
		if (machine == null) {
			return null;
		}

		String imageUrl = "http://" + machine.getIp() + ":" + machine.getDaemonport() + "/images/json";

		ResponseEntity<String> response = restTemplate.getForEntity(imageUrl, String.class);
		System.out.println(response);
		if (response.getStatusCode().equals(HttpStatus.OK)) {
			return response;
		} else {
			return null;
		}
	}

	public ResponseEntity<String> getContainerList(int machineId) {

		Machine machine = machineRepository.getOne(machineId);
		if (machine == null) {
			return null;
		}

		String containerUrl = "http://" + machine.getIp() + ":" + machine.getDaemonport() + "/containers/json";

		ResponseEntity<String> response = restTemplate.getForEntity(containerUrl, String.class);
		System.out.println(response);
		if (response.getStatusCode().equals(HttpStatus.OK)) {
			return response;
		} else {
			return null;
		}
	}

	public ResponseEntity<String> getServiceNetworks(int machineId) {

		Machine machine = machineRepository.getOne(machineId);
		if (machine == null) {
			return null;
		}
		String networkUrl = "http://" + machine.getIp() + ":" + machine.getDaemonport() +"/networks";

		ResponseEntity<String> response = restTemplate.getForEntity(networkUrl, String.class);
		System.out.println(response);
		if (response.getStatusCode().equals(HttpStatus.OK)) {
			return response;
		} else {
			return null;
		}
	}
	
	public Flux<String> getEvents(int machineId)
	{
		Machine machine = machineRepository.getOne(machineId);
		if (machine == null) {
			return null;
		}
		
		String machineUrl = "http://" + machine.getIp() + ":" + machine.getDaemonport() + "/networks";

		return WebClient.create(machineUrl).get()
	            .uri("/events")
	            .retrieve()
	            .bodyToFlux(String.class);
	}
	public ResponseEntity<String> pullImageOnMachines(int machineId, String imageName){
		Machine machine = machineRepository.getOne(machineId);
		if (machine == null) {
			return null;
		}
		
		HttpHeaders headers = new HttpHeaders();
		headers.set("Accept", MediaType.APPLICATION_JSON_VALUE);

		String machineUrl = "http://" + machine.getIp() + ":" + machine.getDaemonport() + "/images/create";

		UriComponentsBuilder builder = UriComponentsBuilder.fromHttpUrl(machineUrl)
		        .queryParam("fromImage", imageName);
		        
		HttpEntity<?> entity = new HttpEntity<>(headers);

		HttpEntity<String> response = restTemplate.exchange(
		        builder.toUriString(), 
		        HttpMethod.POST, 
		        entity, 
		        String.class);
		
		System.out.println(response);
		return null;
		}
	

}
