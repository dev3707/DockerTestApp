package com.harborhack.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Service;

import com.harborhack.model.Machine;

@Service
public class MachineService {

	private static List<Machine> machines = new ArrayList<>();
	static {
	}

	public List<Machine> retrieveMachines(String username) {
		List<Machine> userMachines = new ArrayList<>();
		for (Machine Machine : machines) {
			if (Machine.getUser().equalsIgnoreCase(username)) {
				userMachines.add(Machine);
			}
		}
		return userMachines;
	}

	public void addMachine(String user, String Machine, Date targetDate, boolean isDone) {
		int count = machines.size();
		 //JFN : machines.add(new Machine(++count, user.toLowerCase(), Machine, targetDate, isDone));
		// System.out.println(retrieveMachines(user));
	}

	public void deleteMachine(int id) {
		Iterator<Machine> iterator = machines.iterator();
		while (iterator.hasNext()) {
			Machine Machine = iterator.next();
			if (Machine.getId() == id) {
				iterator.remove();
			}
		}
	}

	public Machine retrieveMachine(int id) {
		for (Machine Machine : machines) {
			if (Machine.getId() == id) {
				return Machine;
			}
		}
		return null;
	}

	public void updateMachine(@Valid Machine Machine) {
		machines.remove(Machine);
		machines.add(Machine);
		
	}
}
