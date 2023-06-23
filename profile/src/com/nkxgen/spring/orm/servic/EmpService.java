
package com.nkxgen.spring.orm.servic;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.nkxgen.spring.orm.dao.EmpDAO;
import com.nkxgen.spring.orm.model.Admin;
import com.nkxgen.spring.orm.model.Employee;

@Component
public class EmpService {

	@Autowired
	private EmpDAO empdao;
	private static final String HASH_ALGORITHM = "SHA-256";

	@Transactional
	public Employee getByEmail(String email) {
		return empdao.getDetailsByEmail(email);
	}

	public Admin getAdmin(String email) {
		Admin user = empdao.getDetailsByEmail_admin(email);
		return user;
	}

	@Transactional
	public boolean authenticateUser(String email, String password) {
		Employee user = empdao.getDetailsByEmail(email);

		if (user != null && user.getPassword().equals(hashPassword(password))) {
			return true;
		}
		return false;
	}

	@Transactional
	public boolean authenticateUser_admin(String email, String password) {
		Admin user = empdao.getDetailsByEmail_admin(email);

		if (user != null && user.getAusr_password().equals(hashPassword(password))) {
			return true;
		}
		return false;
	}

	public Employee getEmployee(String email) {
		Employee user = empdao.getDetailsByEmail(email);
		return user;
	}

	public String hashPassword(String password) {
		try {
			MessageDigest messageDigest = MessageDigest.getInstance(HASH_ALGORITHM);
			byte[] hashBytes = messageDigest.digest(password.getBytes(StandardCharsets.UTF_8));

			// Convert the byte array to a hexadecimal string
			StringBuilder hexString = new StringBuilder();
			for (byte b : hashBytes) {
				String hex = Integer.toHexString(0xff & b);
				if (hex.length() == 1) {
					hexString.append('0');
				}
				hexString.append(hex);
			}

			return hexString.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			// Handle the exception appropriately
		}

		return null;
	}

}
