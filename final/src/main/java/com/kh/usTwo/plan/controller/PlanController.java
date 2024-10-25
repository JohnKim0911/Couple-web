package com.kh.usTwo.plan.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.usTwo.member.model.vo.Member;
import com.kh.usTwo.plan.model.vo.Calendar;
import com.kh.usTwo.plan.model.vo.Mindmap;
import com.kh.usTwo.plan.model.vo.Schedule;
import com.kh.usTwo.plan.model.vo.SelectSchedule;
import com.kh.usTwo.plan.service.PlanServiceImpl;

@Controller
public class PlanController {

	@Autowired
	private PlanServiceImpl pService;

	@RequestMapping("calendar")
	public String calendar(HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		ArrayList<Calendar> list = pService.selectCalendarList(loginUser.getCoupleCode());
		
		if(list.size() == 0) { // 기존에 캘린더가 없다면
			pService.insertCalendar(loginUser); // 공유캘린더, 내캘린더, 상대방캘린더 생성
		}
		
		return "plan/calendar";
	}

	@RequestMapping("mindmap")
	public String bucket() {
		return "plan/mindmap";
	}

	@ResponseBody
	@RequestMapping(value = "clist.pl", produces = "application/json; charset=utf-8")
	public String ajaxSelectCalendarList(String coupleCode) {
		ArrayList<Calendar> list = pService.selectCalendarList(coupleCode);
		return new Gson().toJson(list);
	}

	@ResponseBody
	@RequestMapping("cupdate.pl")
	public String ajaxUpdateCalendarColors(@RequestParam Map<String, Object> param, HttpSession session) {
		
		int ourCalNo = Integer.parseInt((String)param.get("ourCalNo"));
		int myCalNo = Integer.parseInt((String)param.get("myCalNo"));
		int partnerCalNo = Integer.parseInt((String)param.get("partnerCalNo"));
		
		String ourCalColor = (String)param.get("ourCalColor");
		String myCalColor = (String)param.get("myCalColor");
		String partnerCalColor = (String)param.get("partnerCalColor");

		ArrayList<Calendar> list = new ArrayList<Calendar>();
		list.add(new Calendar(ourCalNo, ourCalColor));
		list.add(new Calendar(myCalNo, myCalColor));
		list.add(new Calendar(partnerCalNo, partnerCalColor));
		
		int result = pService.updateCalendarColors(list);
		return result > 0 ? "success" : "fail";
	}
	
	@ResponseBody
	@RequestMapping(value = "slist.pl", produces = "application/json; charset=utf-8")
	public String ajaxSelectScheduleList(SelectSchedule ss) {
		ArrayList<Schedule> list = pService.selectScheduleList(ss);
		return new Gson().toJson(list);
	}

	@ResponseBody
	@RequestMapping("sinsert.pl")
	public String ajaxInsertSchedule(Schedule s) {
		int result = pService.insertSchedule(s);
		return result > 0 ? "success" : "fail";
	}

	@ResponseBody
	@RequestMapping("supdate.pl")
	public String ajaxUpdateSchedule(Schedule s) {
		int result = pService.updateSchedule(s);
		return result > 0 ? "success" : "fail";
	}

	@ResponseBody
	@RequestMapping("sdelete.pl")
	public String ajaxDeleteSchedule(int scheduleNo) {
		int result = pService.deleteSchedule(scheduleNo);
		return result > 0 ? "success" : "fail";
	}

	// 마인드맵 리스트 조회
	@ResponseBody
	@RequestMapping(value = "mlist.pl", produces = "application/json; charset=utf-8")
	public String ajaxSelectMindmapList(String coupleCode) {
		ArrayList<Mindmap> list = pService.selectMindmapList(coupleCode);
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping("mupdate.pl")
	public String ajaxUpdateMindmapList(@RequestBody ArrayList<Mindmap> mindmapList, HttpSession session) {
		System.out.println(mindmapList);
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String coupleCode = loginUser.getCoupleCode();
		
		for(Mindmap m : mindmapList) {
			m.setCoupleCode(coupleCode);
		}
		
		int result = pService.updateMindmapList(mindmapList, session);
		return result > 0 ? "success" : "fail";
	}

}
