package com.nkxgen.spring.orm.servic;


import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.springframework.stereotype.Component;

@Component
public class HashGenertor {

	private static final String HASH_ALGORITHM = "SHA-256";

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