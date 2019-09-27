package com.harborhack.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "machine")
public class Machine {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;
	private String user;

	

	private String fqdn;

	private String ip;

	private String daemonport;

	/*
	 * @ManyToMany(mappedBy = "machines") private Set<User> users;
	 */
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFqdn() {
		return fqdn;
	}

	public void setFqdn(String fqdn) {
		this.fqdn = fqdn;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getDaemonport() {
		return daemonport;
	}

	public void setDaemonport(String daemonport) {
		this.daemonport = daemonport;
	}
	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}
	/*
	 * public Set<User> getUsers() { return users; } public void
	 * setUsers(Set<User> users) { this.users = users; }
	 */

}
