package com.hofuqi.timeline.common.to;

import java.io.Serializable;
import java.util.Date;

/**
 * 用户实体类
 * @author fuqi
 * @date 2014-10-12
 */
public class UserTO implements Serializable {
	
	private static final long serialVersionUID = 1L;

	private Long id;
	
	private String username;
	
	private String password;
	
	private Date createdDate;
	
	private Integer status;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
	
	
}
