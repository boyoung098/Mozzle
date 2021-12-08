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

       
    	if(token != null && token.startsWith("Bearer ")) {
    		token = token.substring(7);
			System.out.println("TOKEN USER IS : " + jwtTokenProvider.getUserId(token));
			if(jwtTokenProvider.isTokenValid(token) && SecurityContextHolder.getContext().getAuthentication() == null) {
				Authentication authentication = jwtTokenProvider.getAuthentication(token);
	            SecurityContextHolder.getContext().setAuthentication(authentication);
			}
			
    	}

        filterChain.doFilter(request, response);
    }
}