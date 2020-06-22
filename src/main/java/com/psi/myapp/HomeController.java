package com.psi.myapp;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.psi.myapp.common.dto.Common;
import com.psi.myapp.common.mapper.CommonMapper;
import com.psi.myapp.member.dto.Member;
import com.psi.myapp.member.mapper.MemberMapper;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	private MemberMapper memberMapper;

	@Autowired
	private CommonMapper commonMapper;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate);
		return "home";
	}

	@RequestMapping(value = "InputForm.do")
	public String InputForm(Locale locale, Model model) throws UnsupportedEncodingException {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);
		List<Common> commonList = commonMapper.getList();

		model.addAttribute("commonList", commonList);
		return "InputForm";
	}

	@RequestMapping(value = "UpdateForm.do")
	public String UpdateForm(Locale locale, Model model, Member member, HttpServletRequest request)
			throws UnsupportedEncodingException {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		member = memberMapper.selectMember(Integer.parseInt(request.getParameter("sabun")));

		List<Common> commonList = commonMapper.getList();

		model.addAttribute("commonList", commonList);
		model.addAttribute("member", member);
		return "UpdateForm";
	}

	@RequestMapping(value = "Update.do", method = RequestMethod.POST)
	public void Update(MultipartFile[] uploadFile, Locale locale, Model model, Member member,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		// String uploadFolder = "C:\\upload";
		String uploadFolder = "C:\\Users\\gocpm\\Documents\\workspace-spring-tool-suite-4-4.6.1.RELEASE\\PinoSpringVueInsa\\src\\main\\webapp\\resources\\img";

		request.setCharacterEncoding("UTF-8");
		if (uploadFile.length > 0) {
			List<String> fileIndex = new ArrayList<String>();
			int indexCount = 0;

			for (MultipartFile multipartFile : uploadFile) {
				String uploadFileName = multipartFile.getOriginalFilename();
				if (!uploadFileName.equals("")) {
					UUID uuid = UUID.randomUUID();

					uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
					uploadFileName = uuid.toString() + "_" + uploadFileName;

					System.out.println("test4" + indexCount + " : " + uploadFileName);
					if (indexCount == 0) {
						String fileName = member.getPROFILE(); // 지울 파일명
						String filePath = uploadFolder+"\\"+fileName; // 지울 파일이 존재하는 디렉토리
						File f = new File(filePath); // 파일 객체생성
						if (f.exists())
							f.delete(); // 파일이 존재하면 파일을 삭제한다.
						member.setPROFILE(uploadFileName);
					} else if (indexCount == 1) {
						String fileName = member.getCMP_REG_IMAGE(); // 지울 파일명
						String filePath = uploadFolder+"\\"+fileName;// 지울 파일이 존재하는 디렉토리
						File f = new File(filePath); // 파일 객체생성
						if (f.exists())
							f.delete(); 
						member.setCMP_REG_IMAGE(uploadFileName);
					} else {
						String fileName = member.getCARRIER(); // 지울 파일명
						String filePath = uploadFolder+"\\"+fileName;// 지울 파일이 존재하는 디렉토리
						File f = new File(filePath); // 파일 객체생성
						member.setCARRIER(uploadFileName);
					}
					File saveFile = new File(uploadFolder, uploadFileName);
					try {

						multipartFile.transferTo(saveFile);

					} catch (Exception e) {

					}
				}
				indexCount++;
			}

		}
		
		String[] salaryArray = member.getSALARY().split(",");
		String tmpSalary ="";
		List<String> salesTeamList = new ArrayList<>();
		for (int i = 0; i < salaryArray.length; i++) {
		    tmpSalary += salaryArray[i];
		}

		member.setSALARY(tmpSalary);
		int result = 0;
		result = memberMapper.updateMember(member);

		if (result > 0) {
			System.out.println("완료");
			model.addAttribute("message", "수정 완료하였습니다.");
			response.sendRedirect("/SearchForm");
		} else {
			model.addAttribute("message", "수정실패 하였습니다.");
			// response.sendRedirect("/konan/views/common/error.jsp");
			response.sendRedirect("/SearchForm");
		}
	}

	@RequestMapping(value = "/Insert")
	public void Insert(MultipartFile[] uploadFile, Member member, Locale locale, Model model,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		// String uploadFolder = "C:\\upload";
		String uploadFolder = "C:\\Users\\gocpm\\Documents\\workspace-spring-tool-suite-4-4.6.1.RELEASE\\PinoSpringVueInsa\\src\\main\\webapp\\resources\\img";

		request.setCharacterEncoding("UTF-8");
		if (uploadFile.length > 0) {
			List<String> fileIndex = new ArrayList<String>();
			int indexCount = 0;

			for (MultipartFile multipartFile : uploadFile) {
				String uploadFileName = multipartFile.getOriginalFilename();
				if (!uploadFileName.equals("")) {
					UUID uuid = UUID.randomUUID();

					uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
					uploadFileName = uuid.toString() + "_" + uploadFileName;

					System.out.println("test4" + indexCount + " : " + uploadFileName);
					if (indexCount == 0) {
						member.setPROFILE(uploadFileName);
					} else if (indexCount == 1) {
						member.setCMP_REG_IMAGE(uploadFileName);
					} else {
						member.setCARRIER(uploadFileName);
					}
					File saveFile = new File(uploadFolder, uploadFileName);
					try {

						multipartFile.transferTo(saveFile);

					} catch (Exception e) {

					}
				}
				indexCount++;
			}

		}
		String[] salaryArray = member.getSALARY().split(",");
		String tmpSalary ="";
		List<String> salesTeamList = new ArrayList<>();
		for (int i = 0; i < salaryArray.length; i++) {
		    tmpSalary += salaryArray[i];
		}

		member.setSALARY(tmpSalary);
		
		memberMapper.insertMember(member);
		List<Common> commonList = commonMapper.getList();

		model.addAttribute("commonList", commonList);
		response.sendRedirect("SearchForm.do");
	}

	@RequestMapping(value = "/SearchForm")
	public String SearchForm(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		List<Common> commonList = commonMapper.getList();
     
        JSONArray jsonArray1 = new JSONArray();
        JSONObject finalJsonObject1 = new JSONObject();
        
       for(int i =0; i<commonList.size(); i++) {
           JSONObject tmpObject = new JSONObject();
    	   tmpObject.put("CODE",(String)commonList.get(i).getCODE());
    	   tmpObject.put("GUBUN",(String)commonList.get(i).getGUBUN());
    	   tmpObject.put("NOTE",(String)commonList.get(i).getNOTE());
    	   tmpObject.put("NAME",(String)commonList.get(i).getNAME());
    	    jsonArray1.add(tmpObject);    	     
    	   
        	
        }
        finalJsonObject1.put("finals",jsonArray1);
        
		model.addAttribute("commonList", commonList);
		model.addAttribute("commonList2", finalJsonObject1); //vue converting 위한 json commonList
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "SearchForm";
	}

	@RequestMapping(value = "/Search")
	public String Search(Member member, Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "SearchForm";
	}

	@RequestMapping(value = "/SearchAjax.do")
	@ResponseBody
	public JSONObject[] SearchAjax(Member member, HttpServletResponse response) throws IOException {
		if (member.getSABUN() == null || member.getSABUN().equals("")) {
			member.setSABUN(null);
		}
		if (member.getNAME() == null || member.getNAME().equals("")) {
			member.setNAME(null);
		}
		if (member.getJOIN_GBN_CODE_NAME() == null || member.getJOIN_GBN_CODE_NAME().equals("")) {
			member.setJOIN_GBN_CODE_NAME(null);
		}
		if (member.getPUT_YN() == null || member.getPUT_YN().equals("")) {
			member.setPUT_YN(null);
		}
		if (member.getPOS_GBN_CODE_NAME() == null || member.getPOS_GBN_CODE_NAME().equals("")) {
			member.setPOS_GBN_CODE_NAME(null);
		}
		if (member.getJOIN_DAY() == null || member.getJOIN_DAY().equals("")) {
			member.setJOIN_DAY(null);
		}
		if (member.getJOB_TYPE() == null || member.getJOB_TYPE().equals("")) {
			member.setJOB_TYPE(null);
		}
		if (member.getRETIRE_DAY() == null || member.getRETIRE_DAY().equals("")) {
			member.setRETIRE_DAY(null);
		}

		List<Member> list = memberMapper.getList(member);
		response.setContentType("application/json; charset=utf-8");

		int size = list.size();
		JSONObject[] jsonObjArray = new JSONObject[size];

		for (int i = 0; i < size; i++) {
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("SABUN", list.get(i).getSABUN());
			jsonObj.put("NAME", list.get(i).getNAME());
			jsonObj.put("REG_NO", list.get(i).getREG_NO());
			jsonObj.put("HP", list.get(i).getHP());
			jsonObj.put("POS_GBN_CODE_NAME", list.get(i).getPOS_GBN_CODE_NAME());
			jsonObj.put("JOIN_DAY", list.get(i).getJOIN_DAY());
			jsonObj.put("RETIRE_DAY", list.get(i).getRETIRE_DAY());
			jsonObj.put("PUT_YN", list.get(i).getPUT_YN());
			jsonObj.put("SALARY", list.get(i).getSALARY());
			jsonObjArray[i] = jsonObj;

		}

		return jsonObjArray;
	}
	
	
	
	
	@RequestMapping(value = "/idChkAjax.do")
	@ResponseBody
	public JSONObject idChkAjax(Member member, HttpServletResponse response) throws IOException {
	

		int result = memberMapper.idChk(member);
		response.setContentType("application/json; charset=utf-8");
		
		JSONObject jsonObj = new JSONObject();
		if(result==0)
		{
			jsonObj.put("result", "중복되지않음");
		}
		else {
			jsonObj.put("result", "중복됨");
		}
		
		

		return jsonObj;
	}

}
