package com.demo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.mapper.UserMapper;
import com.demo.po.Flight;
import com.demo.po.Order;
import com.demo.po.Refund;
import com.demo.po.User;
import com.demo.service.UserService;
import com.demo.vo.UserLoginVo;
import com.demo.vo.UserOrderVo;
import com.demo.vo.UserRefundVo;
import com.demo.vo.UserRegisterVo;
import com.demo.vo.UserSearchOrderVo;
import com.demo.vo.UserSearchRefundVo;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper mapper;
	
	@Override
	public User userLogin(UserLoginVo vo) throws Exception {
		// TODO Auto-generated method stub
		List<User> users = mapper.userLogin(vo);
		if(users.isEmpty() || users.size()==0){
			return null;
		}else{
			return users.get(0);
		}
	}

	@Override
	public void userRegister(UserRegisterVo vo) throws Exception {
		// TODO Auto-generated method stub
		mapper.userRegister(vo);
	}

	@Override
	public boolean userSearch(UserRegisterVo vo) throws Exception {
		// TODO Auto-generated method stub
		List<User> users = mapper.userSearch(vo);
		if(users.isEmpty() || users.size()==0){
			return true;                      
		}
		return false;                         
	}

	
	
	
	
	
	@Override
	public void userOrder(UserOrderVo vo) throws Exception {
		// TODO Auto-generated method stub
		mapper.userOrder(vo);
	}

	@Override
	public List<Flight> viewFlight(Flight f) throws Exception {
		// TODO Auto-generated method stub
		List<Flight> flights = mapper.viewFlight(f);
		return flights;
	}

	@Override
	public List<Order> viewOrdered(User u) throws Exception {
		// TODO Auto-generated method stub
		List<Order> orders = mapper.viewOrdered(u);
		return orders;
	}

	@Override
	public void userRefund(Order o) throws Exception {
		// TODO Auto-generated method stub
		mapper.userRefund(o);		
	}

	@Override
	public void addRefund(Refund r) throws Exception {
		// TODO Auto-generated method stub
		mapper.addRefund(r);    
	}	
	
	@Override
	public List<Refund> viewRefunded(User u) throws Exception {
		// TODO Auto-generated method stub
		List<Refund> refunds = mapper.viewRefunded(u);
		return refunds;
	}

	@Override
	public List<Order> searchOrdered(UserSearchOrderVo vo) throws Exception {
		// TODO Auto-generated method stub
		List<Order> orders = mapper.searchOrdered(vo);
		return orders;
	}

	@Override
	public List<Refund> searchRefund(UserSearchRefundVo vo) throws Exception {
		// TODO Auto-generated method stub
		List<Refund> refunds = mapper.searchRefund(vo);
		return refunds;
	}

	@Override
	public void updateFlight(UserOrderVo vo) throws Exception {
		// TODO Auto-generated method stub
		mapper.updateFlight(vo);
	}

	@Override
	public void updateFlight1(Refund r) throws Exception {
		// TODO Auto-generated method stub
		mapper.updateFlight1(r);
	}
}
