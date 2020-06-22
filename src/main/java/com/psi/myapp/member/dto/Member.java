package com.psi.myapp.member.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Member implements java.io.Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 31L;
	private String SABUN;
	private String JOIN_DAY;
	private String RETIRE_DAY;
	private String PUT_YN;
	private String NAME;
	private String REG_NO;
	private String ENG_NAME;
	private String PHONE;
	private String HP;
	private String CARRIER;
	private String POS_GBN_CODE;
	private String POS_GBN_CODE_NAME;
	private String CMP_REG_NO;
	private String CMP_REG_IMAGE;
	private String SEX;
	private String YEARS;
	private String EMAIL;
	private String ZIP;
	private String ADDR1;
	private String ADDR2;
	private String DEPT_CODE;
	private String JOIN_GBN_CODE;
	private String JOIN_GBN_CODE_NAME;
	private String ID;
	private String PWD;
	private String SALARY;
	private String KOSA_REG_YN;
	private String KOSA_CLASS_CODE;
	private String MIL_YN;
	private String MIL_TYPE;
	private String MIL_LEVEL;
	private String MIL_STARTDATE;
	private String MIL_ENDDATE;
	private String JOB_TYPE;
	private String GART_LEVEL;
	private String SELF_INTRO;
	private String CRM_NAME;
	private String PROFILE;
	
	public Member() {
		super();
	}

	public String getSABUN() {
		return SABUN;
	}

	public void setSABUN(String sABUN) {
		SABUN = sABUN;
	}

	public String getJOIN_DAY() {
		return JOIN_DAY;
	}

	public void setJOIN_DAY(String jOIN_DAY) {
		JOIN_DAY = jOIN_DAY;
	}

	public String getRETIRE_DAY() {
		return RETIRE_DAY;
	}

	public void setRETIRE_DAY(String rETIRE_DAY) {
		RETIRE_DAY = rETIRE_DAY;
	}

	public String getPUT_YN() {
		return PUT_YN;
	}

	public void setPUT_YN(String pUT_YN) {
		PUT_YN = pUT_YN;
	}

	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}

	public String getREG_NO() {
		return REG_NO;
	}

	public void setREG_NO(String rEG_NO) {
		REG_NO = rEG_NO;
	}

	public String getENG_NAME() {
		return ENG_NAME;
	}

	public void setENG_NAME(String eNG_NAME) {
		ENG_NAME = eNG_NAME;
	}

	public String getPHONE() {
		return PHONE;
	}

	public void setPHONE(String pHONE) {
		PHONE = pHONE;
	}

	public String getHP() {
		return HP;
	}

	public void setHP(String hP) {
		HP = hP;
	}

	public String getCARRIER() {
		return CARRIER;
	}

	public void setCARRIER(String cARRIER) {
		CARRIER = cARRIER;
	}

	public String getPOS_GBN_CODE() {
		return POS_GBN_CODE;
	}

	public void setPOS_GBN_CODE(String pOS_GBN_CODE) {
		POS_GBN_CODE = pOS_GBN_CODE;
	}

	public String getCMP_REG_NO() {
		return CMP_REG_NO;
	}

	public void setCMP_REG_NO(String cMP_REG_NO) {
		CMP_REG_NO = cMP_REG_NO;
	}

	public String getCMP_REG_IMAGE() {
		return CMP_REG_IMAGE;
	}

	public void setCMP_REG_IMAGE(String cMP_REG_IMAGE) {
		CMP_REG_IMAGE = cMP_REG_IMAGE;
	}

	public String getSEX() {
		return SEX;
	}

	public void setSEX(String sEX) {
		SEX = sEX;
	}

	public String getYEARS() {
		return YEARS;
	}

	public void setYEARS(String yEARS) {
		YEARS = yEARS;
	}

	public String getEMAIL() {
		return EMAIL;
	}

	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}

	public String getZIP() {
		return ZIP;
	}

	public void setZIP(String zIP) {
		ZIP = zIP;
	}

	public String getADDR1() {
		return ADDR1;
	}

	public void setADDR1(String aDDR1) {
		ADDR1 = aDDR1;
	}

	public String getADDR2() {
		return ADDR2;
	}

	public void setADDR2(String aDDR2) {
		ADDR2 = aDDR2;
	}

	public String getDEPT_CODE() {
		return DEPT_CODE;
	}

	public void setDEPT_CODE(String dEPT_CODE) {
		DEPT_CODE = dEPT_CODE;
	}

	public String getJOIN_GBN_CODE() {
		return JOIN_GBN_CODE;
	}

	public void setJOIN_GBN_CODE(String jOIN_GBN_CODE) {
		JOIN_GBN_CODE = jOIN_GBN_CODE;
	}

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public String getPWD() {
		return PWD;
	}

	public void setPWD(String pWD) {
		PWD = pWD;
	}

	public String getSALARY() {
		return SALARY;
	}

	public void setSALARY(String sALARY) {
		SALARY = sALARY;
	}

	public String getKOSA_REG_YN() {
		return KOSA_REG_YN;
	}

	public void setKOSA_REG_YN(String kOSA_REG_YN) {
		KOSA_REG_YN = kOSA_REG_YN;
	}

	public String getKOSA_CLASS_CODE() {
		return KOSA_CLASS_CODE;
	}

	public void setKOSA_CLASS_CODE(String kOSA_CLASS_CODE) {
		KOSA_CLASS_CODE = kOSA_CLASS_CODE;
	}

	public String getMIL_YN() {
		return MIL_YN;
	}

	public void setMIL_YN(String mIL_YN) {
		MIL_YN = mIL_YN;
	}

	public String getMIL_TYPE() {
		return MIL_TYPE;
	}

	public void setMIL_TYPE(String mIL_TYPE) {
		MIL_TYPE = mIL_TYPE;
	}

	public String getMIL_LEVEL() {
		return MIL_LEVEL;
	}

	public void setMIL_LEVEL(String mIL_LEVEL) {
		MIL_LEVEL = mIL_LEVEL;
	}

	public String getMIL_STARTDATE() {
		return MIL_STARTDATE;
	}

	public void setMIL_STARTDATE(String mIL_STARTDATE) {
		MIL_STARTDATE = mIL_STARTDATE;
	}

	public String getMIL_ENDDATE() {
		return MIL_ENDDATE;
	}

	public void setMIL_ENDDATE(String mIL_ENDDATE) {
		MIL_ENDDATE = mIL_ENDDATE;
	}

	public String getJOB_TYPE() {
		return JOB_TYPE;
	}

	public void setJOB_TYPE(String jOB_TYPE) {
		JOB_TYPE = jOB_TYPE;
	}

	public String getGART_LEVEL() {
		return GART_LEVEL;
	}

	public void setGART_LEVEL(String gART_LEVEL) {
		GART_LEVEL = gART_LEVEL;
	}

	public String getSELF_INTRO() {
		return SELF_INTRO;
	}

	public void setSELF_INTRO(String sELF_INTRO) {
		SELF_INTRO = sELF_INTRO;
	}

	public String getCRM_NAME() {
		return CRM_NAME;
	}

	public void setCRM_NAME(String cRM_NAME) {
		CRM_NAME = cRM_NAME;
	}

	public String getPROFILE() {
		return PROFILE;
	}

	public void setPROFILE(String pROFILE) {
		PROFILE = pROFILE;
	}

	public String getJOIN_GBN_CODE_NAME() {
		return JOIN_GBN_CODE_NAME;
	}

	public void setJOIN_GBN_CODE_NAME(String jOIN_GBN_CODE_NAME) {
		JOIN_GBN_CODE_NAME = jOIN_GBN_CODE_NAME;
	}
	public String getPOS_GBN_CODE_NAME() {
		return POS_GBN_CODE_NAME;
	}

	public void setPOS_GBN_CODE_NAME(String pOS_GBN_CODE_NAME) {
		POS_GBN_CODE_NAME = pOS_GBN_CODE_NAME;
	}

}
