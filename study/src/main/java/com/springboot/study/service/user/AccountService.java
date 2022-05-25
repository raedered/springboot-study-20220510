package com.springboot.study.service.user;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.springboot.study.config.auth.PrincipalDetails;

@Service
public interface AccountService {
	public boolean updateProfileImg(MultipartFile file, PrincipalDetails principalDetails);
}
