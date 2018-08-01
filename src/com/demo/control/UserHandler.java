package com.demo.control;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.demo.po.Admin;
import com.demo.po.Flight;
import com.demo.po.Order;
import com.demo.po.Refund;
import com.demo.po.User;
import com.demo.service.AdminService;
import com.demo.service.UserService;
import com.demo.vo.SearchFlightVo;
import com.demo.vo.UserLoginVo;
import com.demo.vo.UserOrderVo;
import com.demo.vo.UserRefundVo;
import com.demo.vo.UserRegisterVo;
import com.demo.vo.UserSearchOrderVo;
import com.demo.vo.UserSearchRefundVo;

@Controller
public class UserHandler {
	@Autowired
	private UserService us;
	@Autowired
	private AdminService as;
	
	@RequestMapping("/login.action")
	public ModelAndView login(ModelAndView mv, UserLoginVo vo, HttpServletRequest req) throws Exception {
		System.out.println(vo.getUsername());
		System.out.println(vo.getPassword());
		System.out.println(vo.getLevel());
		if(vo.getLevel().equals("user")) {
			User u = us.userLogin(vo);
			HttpSession session = req.getSession();
			if(u!=null){
				System.out.println(u.getUsername());
				session.setAttribute("user", u);
				mv.setViewName("/main.jsp");
			} else {
				mv.setViewName("/login.jsp");
			}
		} else {
			Admin a = as.adminLogin(vo);
			HttpSession session = req.getSession();
			if(a!=null){
				System.out.println(a.getUsername());
				session.setAttribute("admin", a);
				mv.setViewName("/admin.jsp");
			} else {
				mv.setViewName("/login.jsp");
			}
		}
		return mv;
	}
	
	@RequestMapping("/register.action")
	public ModelAndView login(ModelAndView mv, UserRegisterVo vo, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		System.out.println(vo.getUsername());
		System.out.println(vo.getPassword());
		System.out.println(vo.getPassword1());
		boolean b = us.userSearch(vo);
		System.out.println(b);
		if(b){
			us.userRegister(vo);
			mv.setViewName("/login.jsp");
		} else {
			mv.setViewName("/register.jsp");
		}
		return mv;
	}
	
	@RequestMapping("/order.action")
	public ModelAndView userOrder(ModelAndView mv, HttpServletRequest req, Flight f) throws Exception {
		/*User u = (User)req.getSession().getAttribute("user");
		Order o = new Order();
		System.out.println(u.getUsername());
		Timestamp time = new Timestamp(System.currentTimeMillis());
		o.setUsername(u.getUsername());
		o.setFlightNo("123");
		o.setOrderNo("201807090001");
		o.setStartTime(time);
		o.setEndTime(time);
		o.setOrderTime(time);
		o.setCardNo("210727199712011516");
		o.setPhoneNo("18845787573");
		o.setPrice(300);
		o.setStatus(1);
		o.setType("U");
		
		us.userOrder(o);
		HttpSession session = req.getSession();
		session.setAttribute("user", u);
		mv.setViewName("main.jsp");*/
		System.out.println(req.getParameter("flightNo"));
		System.out.println(req.getParameter("startTime"));
		mv.addObject("f", f);
		mv.setViewName("userOrder.jsp");
		return mv;
	}
	
	@RequestMapping("/ordering.action")
	public ModelAndView userOrdering(ModelAndView mv, HttpServletRequest req, UserOrderVo vo) throws Exception {
		User user = (User)req.getSession().getAttribute("user");
		UserSearchOrderVo orderVo = new UserSearchOrderVo();
		orderVo.setUsername("");
		Date date = new Date();
		Timestamp time = new Timestamp(System.currentTimeMillis());
		DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		String s = sdf.format(date);
		s = s.replace("/", "");
		orderVo.setOrderNo(s);
		orderVo.setFlightNo("");
		orderVo.setFlag(1);
		System.out.println("s:"+s);
		List<Order> orders = us.searchOrdered(orderVo);
		int num = orders.size()+1;
		String num1 = String.valueOf(num);
		s = s.replace("/","");
		vo.setUsername(user.getUsername());
		if(num<10)
			vo.setOrderNo("D"+s+"000"+num1);
		else if(num<100)
			vo.setOrderNo("D"+s+"00"+num1);
		else if(num<1000)
			vo.setOrderNo("D"+s+"0"+num1);
		else
			vo.setOrderNo("D"+s+num1);
		vo.setStatus(1);
		System.out.println(vo.getType());
		if(vo.getType().equals("U")){
			vo.setPrice(Integer.parseInt(req.getParameter("priceU")));
		}else{
			vo.setPrice(Integer.parseInt(req.getParameter("priceP")));
		}
		System.out.println("type:"+vo.getType());
		us.updateFlight(vo);
		us.userOrder(vo);
		mv.setViewName("main.jsp");
		return mv;
	}
	
	@RequestMapping("/viewFlight.action")
	public ModelAndView viewFlight(ModelAndView mv, HttpServletRequest req) throws Exception {
		/*Flight f = new Flight();
		List<Flight> flights = us.viewFlight(f);
		mv.addObject("flights", flights);*/
		Flight f = new Flight();
		mv.addObject("f", f);
		mv.setViewName("userViewFlight.jsp");
		return mv;
	}
	
	@RequestMapping("/searFlight.action")
	public ModelAndView searFlight(ModelAndView mv, HttpServletRequest req) throws Exception {
		/*Flight f = new Flight();
		List<Flight> flights = us.viewFlight(f);
		mv.addObject("flights", flights);*/
		Flight f = new Flight();
		System.out.println(req.getParameter("startTime"));
		if(req.getParameter("startTime")!=""){
			Timestamp startTime = new Timestamp(System.currentTimeMillis());
			startTime = Timestamp.valueOf(req.getParameter("startTime"));
			f.setStartTime(startTime);
		}
		if(req.getParameter("endTime")!=""){
			Timestamp endTime = new Timestamp(System.currentTimeMillis());
			endTime = Timestamp.valueOf(req.getParameter("endTime"));
			f.setEndTime(endTime);
		}				
		f.setFlightNo(req.getParameter("flightNo"));
		f.setFrom(req.getParameter("from"));
		f.setTo(req.getParameter("to"));
		System.out.println(f.getStartTime());
		System.out.println(f.getEndTime());
		List<Flight> flights = us.viewFlight(f);
		mv.addObject("flights", flights);
		mv.addObject("f", f);
		mv.setViewName("userViewFlight.jsp");
		return mv;
	}
	
	@RequestMapping("/viewOrdered.action")
	public ModelAndView viewOrdered(ModelAndView mv, HttpServletRequest req) throws Exception {
		User u = (User)req.getSession().getAttribute("user");
		UserSearchOrderVo vo = new UserSearchOrderVo();
		mv.addObject("vo", vo);
		HttpSession session = req.getSession();
		session.setAttribute("user", u);
		mv.setViewName("ordered.jsp");
		return mv;
	}
	
	@RequestMapping("/searOrder.action")
	public ModelAndView searOrdered(ModelAndView mv, HttpServletRequest req, UserSearchOrderVo vo) throws Exception {
		User u = (User)req.getSession().getAttribute("user");
		Order o = new Order();
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
		System.out.println(u.getUsername());
		vo.setUsername(u.getUsername());
		vo.setFlag(0);
		List<Order> orders = us.searchOrdered(vo);
		mv.addObject("orders", orders);
		HttpSession session = req.getSession();
		session.setAttribute("user", u);
		mv.addObject("vo", vo);
		mv.setViewName("ordered.jsp");
		return mv;
	}
	
	@RequestMapping("/refund.action")
	public ModelAndView userRefund(ModelAndView mv, Order o, HttpServletRequest req) throws Exception {
		User u = (User)req.getSession().getAttribute("user");
		Refund r = new Refund();
		Timestamp time = new Timestamp(System.currentTimeMillis());
		System.out.println(u.getUsername());
		
		UserSearchRefundVo refundVo = new UserSearchRefundVo();
		Date date = new Date();
		DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		String s = sdf.format(date);
		s = s.replace("/", "");
		refundVo.setRefundNo(s);
		refundVo.setFlightNo("");
		refundVo.setUsername("");
		System.out.println("s:"+s);
		List<Refund> refunds = us.searchRefund(refundVo);
		int num = refunds.size()+1;
		String num1 = String.valueOf(num);
		s = s.replace("/","");
		if(num<10)
			r.setRefundNo("T"+s+"000"+num1);
		else if(num<100)
			r.setRefundNo("T"+s+"00"+num1);
		else if(num<1000)
			r.setRefundNo("T"+s+"0"+num1);
		else
			r.setRefundNo("T"+s+num1);
		
		if(req.getParameter("startTime1")!=""){
			Timestamp startTime = new Timestamp(System.currentTimeMillis());
			startTime = Timestamp.valueOf(req.getParameter("startTime1"));
			r.setStartTime(startTime);
		}else{
			r.setStartTime(null);
		}
		if(req.getParameter("endTime1")!=""){
			Timestamp endTime = new Timestamp(System.currentTimeMillis());
			endTime = Timestamp.valueOf(req.getParameter("endTime1"));
			r.setEndTime(endTime);
		}else{
			r.setEndTime(null);
		}
		
		r.setUsername(u.getUsername());
		r.setFlightNo(o.getFlightNo());
		r.setRefundTime(time);
		r.setCardNo(o.getCardNo());
		r.setPhoneNo(o.getPhoneNo());
		r.setPrice(o.getPrice());
		r.setType(o.getType());
		
		us.updateFlight1(r);
		us.userRefund(o);
		us.addRefund(r);
		HttpSession session = req.getSession();
		session.setAttribute("user", u);
		mv.setViewName("main.jsp");
		return mv;
	}
	
	@RequestMapping("/viewRefunded.action")
	public ModelAndView viewRefunded(ModelAndView mv, HttpServletRequest req) throws Exception {
		User u = (User)req.getSession().getAttribute("user");
		System.out.println(u.getUsername());
		UserSearchRefundVo vo = new UserSearchRefundVo();
		mv.addObject("vo", vo);
		mv.setViewName("refunded.jsp");
		return mv;
	}
	
	@RequestMapping("/searRefund.action")
	public ModelAndView searRefund(ModelAndView mv, HttpServletRequest req, UserSearchRefundVo vo) throws Exception {
		User u = (User)req.getSession().getAttribute("user");
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
		vo.setUsername(u.getUsername());
		List<Refund> refunds = us.searchRefund(vo);
		mv.addObject("refunds", refunds);
		mv.addObject("vo", vo);
		mv.setViewName("refunded.jsp");
		return mv;
	}
}
