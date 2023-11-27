package com.login.dto;

public class MemberDto {
	private String id;
	private String name;
	private String regidate;
	
	public MemberDto() {
		
	}
	
	public MemberDto(String id, String name, String regidate) {
		super();
		this.id = id;
		this.name = name;
		this.regidate = regidate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRegidate() {
		return regidate;
	}
	public void setRegidate(String regidate) {
		this.regidate = regidate;
	}


}