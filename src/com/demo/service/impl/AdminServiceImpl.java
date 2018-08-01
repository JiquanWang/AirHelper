package com.demo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.mapper.AdminMapper;
import com.demo.mapper.UserMapper;
import com.demo.po.Admin;
import com.demo.po.AirPlane;
import com.demo.po.Flight;
import com.demo.po.Order;
import com.demo.po.Refund;
import com.demo.po.User;
import com.demo.service.AdminService;
import com.demo.vo.AddFlightVo;
import com.demo.vo.AdminViewUserVo;
import com.demo.vo.SearchFlightVo;
import com.demo.vo.UserLoginVo;
import com.demo.vo.UserRegisterVo;
import com.demo.vo.UserSearchOrderVo;
import com.demo.vo.UserSearchRefundVo;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminMapper am;

	@Override
	public Admin adminLogin(UserLoginVo vo) throws Exception {
		// TODO Auto-generated method stub
		List<Admin> admins = am.adminLogin(vo);
		if(admins.isEmpty() || admins.size()==0){
			return null;
		}
		return admins.get(0);
	}

	@Override
	public void addFlight(Flight f) throws Exception {
		// TODO Auto-generated method stub
		am.addFlight(f);
	}

	@Override
	public void deleteFlight(String flightNo) throws Exception { 
		// TODO Auto-generated method stub
		am.deleteFlight(flightNo);
	}

	@Override
	public List<Flight> viewFlight(SearchFlightVo vo) throws Exception { 
		// TODO Auto-generated method stub
		List<Flight> flights = am.viewFlight(vo);
		return flights;
	}

	@Override
	public List<Order> viewOrder(UserSearchOrderVo vo) throws Exception { 
		// TODO Auto-generated method stub
		List<Order> orders = am.viewOrder(vo);
		return orders;
	}

	@Override
	public List<Refund> viewRefund(UserSearchRefundVo vo) throws Exception {		
		// TODO Auto-generated method stub
		List<Refund> refunds = am.viewRefund(vo);
		return refunds;
	}

	@Override
	public List<User> viewUser(AdminViewUserVo vo) throws Exception {		
		// TODO Auto-generated method stub
		List<User> users = am.viewUser(vo);
		return users;
	}

	@Override
	public void resetUserPwd(User u) throws Exception {	
		// TODO Auto-generated method stub
		am.resetUserPwd(u);
	}

	@Override
	public void addPlane(AirPlane air) throws Exception {
		// TODO Auto-generated method stub
		am.addPlane(air);
	}

	@Override
	public List<AirPlane> viewPlane() throws Exception {
		// TODO Auto-generated method stub
		List<AirPlane> airs = am.viewPlane();
		return airs;
	}

	@Override
	public boolean searchFlight(Flight f) throws Exception {
		// TODO Auto-generated method stub
		List<Flight> flights = am.searchFlight(f);
		if(flights.isEmpty() || flights.size()==0) {
			return false;                
		}
		return true;
	}

	@Override
	public List<AirPlane> searchPlane(AirPlane air) throws Exception {
		// TODO Auto-generated method stub
		List<AirPlane> airs = am.searchPlane(air);
		return airs;
	}	
}
