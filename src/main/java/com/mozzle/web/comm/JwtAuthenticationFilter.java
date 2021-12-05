package com.mozzle.web.comm;

import java.io.IOException;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;

@Component
public class JwtAuthenticationFilter extends OncePerRequestFilter {

	@Autowired
    private JwtTokenProvider jwtTokenProvider;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        // 헤더의 토큰을 가져옴
    	String token = jwtTokenProvider.resolveJwtToken(request);
    	System.out.println(token);
        // 토큰이 유효한지 확인
    	System.out.println("TOKEN IS : " + token);
    	System.out.println("TOKEN VERIFY RESULT IS : " + jwtTokenProvider.isTokenValid(token));
    	if (token != null && jwtTokenProvider.isTokenValid(token)) {
            Authentication authentication = jwtTokenProvider.getAuthentication(token);
            System.out.println("adlfjadofadfad;fkjadiojfoad" + authentication);
            SecurityContextHolder.getContext().setAuthentication(authentication);
        }
        filterChain.doFilter(request, response);
    }
}