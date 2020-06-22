package com.psi.myapp.common.dto;

import org.springframework.stereotype.Component;

@Component
public class Common implements java.io.Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 32L;
	private String GUBUN;
	private String CODE;
	private String NAME;
	private String NOTE;
	public String getGUBUN() {
		return GUBUN;
	}
	public void setGUBUN(String gUBUN) {
		GUBUN = gUBUN;
	}
	public String getCODE() {
		return CODE;
	}
	public void setCODE(String cODE) {
		CODE = cODE;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getNOTE() {
		return NOTE;
	}
	public void setNOTE(String nOTE) {
		NOTE = nOTE;
	}
	@Override
	public String toString() {
		return "Common [GUBUN=" + GUBUN + ", CODE=" + CODE + ", NAME=" + NAME + ", NOTE=" + NOTE + "]";
	}
	public Common(String gUBUN, String cODE, String nAME, String nOTE) {
		super();
		GUBUN = gUBUN;
		CODE = cODE;
		NAME = nAME;
		NOTE = nOTE;
	}
	public Common() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
}
