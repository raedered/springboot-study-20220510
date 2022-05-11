package com.springboot.study.web.controller.api;

import java.util.HashMap;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.springboot.study.web.controller.api.data.User;
import com.springboot.study.web.dto.CMRespDto;
import com.springboot.study.web.dto.SigninReqDto;
import com.springboot.study.web.dto.SignupReqDto;

@RestController
public class UserController {
	
	@GetMapping("/user/{usercode}")
	public ResponseEntity<?> gerUser(@PathVariable int usercode){
		System.out.println(usercode);
		return new ResponseEntity<>(10, HttpStatus.BAD_REQUEST);
	}
	
	/*
	 * 1. 사용자이름 중복확인(/auth/signup/check/???) 
	 * ->	User객체에 존재하는 사용자이름과 같으면 사용할 수 없는 사용자 이름입니다.
	 * ->	사용할 수 있는 사용자이름입니다.
	 * 
	 * 2. 회원가입(/auth/siginup)
	 * ->	회원가입 정보 출력(console), 응답은 회원가입 완료.
	 * 
	 * 3. 로그인(/auth/signin)
	 * ->	User객체의 정보와 일치하면 (username, password) 로그인 성공, 로그인 실패
	 * 
	 * 4. 회원수정(/account/aaa)
	 * -> name, email 수정	-> 회원수정 완료, 회원 수정 실패
	 * 
	 * 5. 회원탈퇴(/account/aaa)
	 * -> 회원탈퇴 완료, 회원탈퇴 실패
	 */
	
	
	@GetMapping("/auth/signup/check/{username}")
	public ResponseEntity<?> checkUsername(@PathVariable String username) {
		CMRespDto<String> cmRespDto = null;
		HttpStatus status = null;
		
		User user = new User();
		
		if(user.getUsername().equals(username)) {
			cmRespDto = new CMRespDto<String>(-1, "사용 할 수 없는 사용자이름", username);
			status = HttpStatus.BAD_REQUEST;
		}else {
			cmRespDto = new CMRespDto<String>(1, "사용 할 수 있는 사용자이름", username); 
		}
		return new ResponseEntity<>(cmRespDto, status);
	}
	
	@PostMapping("/auth/signup")
	public ResponseEntity<?> signup(@Valid SignupReqDto signupReqDto, BindingResult bindingResult) {
		
		if(bindingResult.hasErrors()) {
			Map<String, String> errorMap = new HashMap<String, String>();
			for(FieldError error : bindingResult.getFieldErrors()) {
				errorMap.put(error.getField(), error.getDefaultMessage());
			}
			return new ResponseEntity<>(new CMRespDto<Map<String, String>>(-1, "필드 오류", errorMap), HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<>(new CMRespDto<SignupReqDto>(1, "회원가입 완료.", signupReqDto), HttpStatus.OK);
	}
	
	@PostMapping("/auth/signin")
	public ResponseEntity<?> signin(@Valid SigninReqDto signinReqDto, BindingResult bindingResult){
		
		if(bindingResult.hasErrors()) {
			Map<String, String> errorMap = new HashMap<String, String>();
			for(FieldError error : bindingResult.getFieldErrors()) {
				errorMap.put(error.getField(), error.getDefaultMessage());
			}
			return new ResponseEntity<>(new CMRespDto<Map<String, String>>(-1, "필드 오류", errorMap), HttpStatus.BAD_REQUEST);
		}
		User user = new User();
		
		if(signinReqDto.getUsername().equals(user.getUsername())
				&& signinReqDto.getPassword().equals(user.getPassword())) {
			return new ResponseEntity<>(new CMRespDto<User>(1, "로그인 성공.", user), HttpStatus.OK);
		}else {
			return new ResponseEntity<>(new CMRespDto<User>(-1, "로그인 실패", user), HttpStatus.BAD_REQUEST);
		}
	}
	
}
