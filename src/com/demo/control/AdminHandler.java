package com.demo.control;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.demo.po.AirPlane;
import com.demo.po.Flight;
import com.demo.po.Order;
import com.demo.po.Refund;
import com.demo.po.User;
import com.demo.service.AdminService;
import com.demo.vo.AddFlightVo;
import com.demo.vo.AddPlaneVo;
import com.demo.vo.AdminViewUserVo;
import com.demo.vo.DeleteFlightVo;
import com.demo.vo.MessVo;
import com.demo.vo.SearchFlightVo;
import com.demo.vo.UserSearchOrderVo;
import com.demo.vo.UserSearchRefundVo;

@Controller
public class AdminHandler {
	@Autowired
	private AdminService as;
	
	
	@RequestMapping("/add.action")
	public ModelAndView add(ModelAndView mv, HttpServletRequest req) throws Exception {
		List<AirPlane> airs = as.viewPlane();
		mv.addObject("airs", airs);
		mv.setViewName("addFlight.jsp");
		return mv;
	}
	
	
	@RequestMapping("/addFlight.action")
	public ModelAndView addFlight(ModelAndView mv, AddFlightVo vo, HttpServletRequest req) throws Exception {
		System.out.println(vo.getFlightNo());
		Flight f = new Flight();
		f.setAirNo(vo.getAirNo());
		Timestamp startTime = new Timestamp(System.currentTimeMillis());
		startTime = Timestamp.valueOf(req.getParameter("startTime1"));
		f.setStartTime(startTime);
		Timestamp endTime = new Timestamp(System.currentTimeMillis());
		endTime = Timestamp.valueOf(req.getParameter("endTime1"));
		f.setEndTime(endTime);	
		f.setFrom(vo.getFrom());
		f.setTo(vo.getTo());
		f.setFlightNo(vo.getFlightNo());
		f.setPriceU(vo.getPriceU());
		f.setPriceP(vo.getPriceP());
		boolean b = as.searchFlight(f);
		if(b){
			System.out.println("航班已存在");
		} else {
			AirPlane air = new AirPlane();
			air.setAirNo(vo.getAirNo());
			List<AirPlane> airs = as.searchPlane(air);
			int remainU = airs.get(0).getColU() * airs.get(0).getRowU();
			int remainP = airs.get(0).getColP() * airs.get(0).getRowP();
			f.setRemainU(remainU);
			f.setRemainP(remainP);
			System.out.println(remainU);
			System.out.println(remainP);
			System.out.println(f.getRemainU());
			System.out.println(f.getRemainP());
			as.addFlight(f);
			System.out.println("添加航班成功");
		}
		mv.setViewName("admin.jsp");
		return mv;
	}
	
	@RequestMapping("/adminViewFlight.action")
	public ModelAndView adminViewFlight(ModelAndView mv, HttpServletRequest req, SearchFlightVo vo) throws Exception {
		if(req.getParameter("startTime1")!=""){
			Timestamp startTime = new Timestamp(System.currentTimeMillis());
			startTime = Timestamp.valueOf(req.getParameter("startTime1"));
			vo.setStartTime(startTime);
		}else{
			vo.setStartTime(null);
		}
		if(req.getParameter("endTime1")!=""){
			Timestamp endTime = new Timestamp(System.currentTimeMillis());
			endTime = Timestamp.valueOf(req.getParameter("endTime1"));
			vo.setEndTime(endTime);	
		}else{
			vo.setEndTime(null);
		}
		List<Flight> flights = as.viewFlight(vo);
		mv.addObject("flights", flights);
		mv.setViewName("adminViewFlight.jsp");
		return mv;
	}
	
	@RequestMapping("/adminDeleteFlight.action")
	public ModelAndView adminDeleteFlight(ModelAndView mv, DeleteFlightVo vo, HttpServletRequest req) throws Exception {
		as.deleteFlight(vo.getFlightNo());
		mv.setViewName("admin.jsp");
		return mv;
	}
	
	@RequestMapping("/adminViewOrdered.action")
	public ModelAndView adminViewOrdered(ModelAndView mv, HttpServletRequest req, UserSearchOrderVo vo) throws Exception {
		if(req.getParameter("startTime1")!=""){
			Timestamp startTime = new Timestamp(System.currentTimeMillis());
			startTime = Timestamp.valueOf(req.getParameter("startTime1"));
			vo.setStartTime(startTime);
		}else{
			vo.setStartTime(null);
		}
		if(req.getParameter("endTime1")!=""){
			Timestamp endTime = new Timestamp(System.currentTimeMillis());
			endTime = Timestamp.valueOf(req.getParameter("endTime1"));
			vo.setEndTime(endTime);
		}else{
			vo.setEndTime(null);
		}
		vo.setFlag(0);
		List<Order> orders = as.viewOrder(vo);
		mv.addObject("vo", vo);
		mv.addObject("orders", orders);
		mv.setViewName("adminViewOrder.jsp");
		return mv;
	}
	
	@RequestMapping("/adminViewRefunded.action")
	public ModelAndView adminViewRefunded(ModelAndView mv, HttpServletRequest req, UserSearchRefundVo vo) throws Exception {
		if(req.getParameter("startTime1")!=""){
			Timestamp startTime = new Timestamp(System.currentTimeMillis());
			startTime = Timestamp.valueOf(req.getParameter("startTime1"));
			vo.setStartTime(startTime);
		}else{
			vo.setStartTime(null);
		}
		if(req.getParameter("endTime1")!=""){
			Timestamp endTime = new Timestamp(System.currentTimeMillis());
			endTime = Timestamp.valueOf(req.getParameter("endTime1"));
			vo.setEndTime(endTime);
		}else{
			vo.setEndTime(null);
		}
		List<Refund> refunds = as.viewRefund(vo);
		mv.addObject("vo", vo);
		mv.addObject("refunds", refunds);
		mv.setViewName("adminViewRefund.jsp");
		return mv;
	}
	
	@RequestMapping("/viewUsers.action")
	public ModelAndView viewUsers(ModelAndView mv, HttpServletRequest req, AdminViewUserVo vo) throws Exception {
		List<User> users = as.viewUser(vo);
		/*System.out.println("用户："+users.get(0).getUsername());*/
		mv.addObject("vo", vo);
		mv.addObject("users", users);
		mv.setViewName("adminViewUser.jsp");
		return mv;
	}
	
	@RequestMapping("/resetPwd.action")
	public ModelAndView resetPwd(ModelAndView mv, HttpServletRequest req) throws Exception {
		User u = new User();
		u.setUsername(req.getParameter("username"));
		as.resetUserPwd(u);
		System.out.println("重置密码成功！");
		mv.setViewName("admin.jsp");
		return mv;
	}
	
	@RequestMapping("/addPlane.action")
	public ModelAndView addPlane(ModelAndView mv, HttpServletRequest req, AddPlaneVo vo) throws Exception {
		AirPlane air = new AirPlane();
		MessVo mess = new MessVo();
		air.setAirNo(vo.getAirNo());
		air.setColP(vo.getColP());
		air.setRowP(vo.getRowP());
		air.setColU(vo.getColU());
		air.setRowU(vo.getRowU());
		List<AirPlane> airs = as.searchPlane(air);
		if(airs.size()==0 || airs.isEmpty()) {
			mess.setMessage("该航班已存在！");
			mv.addObject("mess", mess);
			System.out.println("该航班已存在！");
		} else {
			mess.setMessage("添加航班成功！");
			mv.addObject("mess", mess);
			as.addPlane(air);
			System.out.println("添加成功");
		}
		mv.setViewName("admin.jsp");
		return mv;
	}
}
