package com.harborhack.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.harborhack.model.Machine;

public interface MachineRepository extends JpaRepository<Machine, Integer> {
	List<Machine> findByUser(String username);
}
