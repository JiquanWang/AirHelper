package com.demo.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.demo.po.Admin;
import com.demo.po.AirPlane;
import com.demo.po.Flight;
import com.demo.po.Order;
import com.demo.po.Refund;
import com.demo.po.User;
import com.demo.vo.AddFlightVo;
import com.demo.vo.AdminViewUserVo;
import com.demo.vo.SearchFlightVo;
import com.demo.vo.UserLoginVo;
import com.demo.vo.UserSearchOrderVo;
import com.demo.vo.UserSearchRefundVo;

public interface AdminService {
	public Admin adminLogin(UserLoginVo vo) throws Exception;
	public void addFlight(Flight f) throws Exception;
	public void deleteFlight(String flightNo) throws Exception;
	public List<Flight> viewFlight(SearchFlightVo vo) throws Exception;
	public List<Order> viewOrder(UserSearchOrderVo vo) throws Exception;
	public List<Refund> viewRefund(UserSearchRefundVo vo) throws Exception;
	public List<User> viewUser(AdminViewUserVo vo) throws Exception;
	public void resetUserPwd(User u) throws Exception;
	public void addPlane(AirPlane air) throws Exception;
	public List<AirPlane> viewPlane() throws Exception;
	public boolean searchFlight(Flight f) throws Exception;
	public List<AirPlane> searchPlane(AirPlane air) throws Exception;
}
