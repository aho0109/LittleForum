package com.joyfulgarden.model;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.Where;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@SuppressWarnings("deprecation")
@Entity
@Table(name = "Sboards")
@SQLDelete(sql = "UPDATE product SET isDeleted = true WHERE id = ?")
@Where(clause = "isDeleted = false")
public class Sboards {
	
	@Id
	@Column(name = "SBOARDID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer sboardID;
	
	@Column(name = "SBOARDTITLE")
	private String sboardTitle;
	
	@Column(name = "SBULLETIN")
	private String sbulletin;
	
	@Column(name = "MBOARDID")
	private Integer mboardID;
	
//	@Column(name = "CREATETIME")
//	private String createTime;
	
	@Column(name = "CREATETIME")
	private LocalDateTime createTime;
	
	@Column(name = "ISDELETED")
	private boolean isDeleted = Boolean.FALSE;
	
	
	/*一對多 多對一 多對多*/
	
	//@JsonIgnoreProperties({ "" })
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "MBOARDID", insertable = false, updatable = false)
	private Mboards mboards;
	
	@OneToMany(mappedBy = "sboards",cascade = CascadeType.ALL)
	private List<Posts> posts;
	

	/*建構子
	 * 多對多
	 * 多對一
	 * 一對多*/
	
	public Sboards() {}


	public Integer getSboardID() {
		return sboardID;
	}

	public String getSboardTitle() {
		return sboardTitle;
	}

	public String getSbulletin() {
		return sbulletin;
	}

	public Integer getMboardID() {
		return mboardID;
	}

	public LocalDateTime getCreateTime() {
		return createTime;
	}

	public boolean isDeleted() {
		return isDeleted;
	}

	public Mboards getMboards() {
		return mboards;
	}

	public List<Posts> getPosts() {
		return posts;
	}

	public void setSboardID(Integer sboardID) {
		this.sboardID = sboardID;
	}

	public void setSboardTitle(String sboardTitle) {
		this.sboardTitle = sboardTitle;
	}

	public void setSbulletin(String sbulletin) {
		this.sbulletin = sbulletin;
	}
	
	public void setMboardID(Integer mboardID) {
		this.mboardID = mboardID;
	}

	public void setCreateTime(LocalDateTime createTime) {
		this.createTime = createTime;
	}

	public void setDeleted(boolean isDeleted) {
		this.isDeleted = isDeleted;
	}

	public void setMboards(Mboards mboards) {
		this.mboards = mboards;
	}

	public void setPosts(List<Posts> posts) {
		this.posts = posts;
	}
	
}
