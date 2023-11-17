package com.oracle.S202350102.dao.thDao;

import java.util.List;
import java.util.Map;

import org.springframework.data.repository.query.Param;

import com.oracle.S202350102.dto.User1;

public interface ThUser1Dao {

	int 				insertUser1(User1 user1);
	User1				login(User1 user1);
	int 				deleteUser(User1 user1);
	int 				updateUserPrem(int user_num);
	int					user1IdCheck(String user_id);
	int 				user1NickCheck(String nick);
	List<User1> 		findId(User1 user1);
	User1 				findUser1ByIdAndEmail(User1 user1);
	int 				user1PswdUpdate(Map<String, Object> map);
	int 				totalUser();
	List<User1> 		listUser(User1 user1);

}
