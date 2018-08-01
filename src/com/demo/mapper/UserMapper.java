package com.demo.mapper;

import java.util.List;
import org.apache.ibatis.annotations.*;

import com.demo.po.Flight;
import com.demo.po.Order;
import com.demo.po.Refund;
import com.demo.po.User;
import com.demo.vo.UserLoginVo;
import com.demo.vo.UserOrderVo;
import com.demo.vo.UserRefundVo;
import com.demo.vo.UserRegisterVo;
import com.demo.vo.UserSearchOrderVo;
import com.demo.vo.UserSearchRefundVo;

public interface UserMapper {
	public List<User> userLogin(UserLoginVo vo) throws Exception;
	public void userRegister(UserRegisterVo vo) throws Exception;
	public List<User> userSearch(UserRegisterVo vo) throws Exception;
	public void userOrder(UserOrderVo vo) throws Exception;
	public List<Flight> viewFlight(Flight f) throws Exception;
	public List<Order> viewOrdered(User u) throws Exception;
	public void userRefund(Order o) throws Exception;
	public void addRefund(Refund r) throws Exception;
	public List<Refund> viewRefunded(User u) throws Exception;
	public List<Order> searchOrdered(UserSearchOrderVo vo) throws Exception;
	public List<Refund> searchRefund(UserSearchRefundVo vo) throws Exception;
	public void updateFlight(UserOrderVo vo) throws Exception;
	public void updateFlight1(Refund r) throws Exception;
}
