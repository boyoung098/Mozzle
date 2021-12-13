package com.mozzle.web.comm;


import java.io.Serializable;
import java.util.Base64;

import java.util.Date;



import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.Authentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Component;


import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;


@Component
@RequiredArgsConstructor
public class JwtTokenProvider {

    private String secretKey = "secretkey";

    private final long ACCESS_TOKEN_VALID_TIME = 30 * 60 * 1000L;   // 30분
    private final long REFRESH_TOKEN_VALID_TIME = 60 * 60 * 24 * 14 * 1000L;   // 2주

    @Autowired
    private UserDetailsService userDetailsService;

//    @PostConstruct
//    protected void init() {
//        secretKey = Base64.getEncoder().encodeToString(secretKey.getBytes());
//    }

    // JWT ACCESS 토큰을 발급해준다
    public String createJwtAccessToken(String userId) {
        Claims claims = Jwts.claims().setSubject(userId);
        Date now = new Date();
        Date expiration = new Date(now.getTime() + ACCESS_TOKEN_VALID_TIME);

        return Jwts.builder()
                .setClaims(claims)
                .setIssuedAt(now)
                .setExpiration(expiration)
                .signWith(SignatureAlgorithm.HS256, secretKey)
                .compact();
    }

    // JWT REFRESH 토큰을 발급해준다
    // JWT ACCESS 토큰 만료 시 REFRESH 토큰 확인
    // value : 랜덤 스트링(or UUID)
    public String createJwtRefreshToken(String value) {
        Claims claims = Jwts.claims();
        claims.put("value", value);
        Date now = new Date();
        Date expiration = new Date(now.getTime() + REFRESH_TOKEN_VALID_TIME);

        return Jwts.builder()
                .setClaims(claims)
                .setIssuedAt(now)
                .setExpiration(expiration)
                .signWith(SignatureAlgorithm.HS256, secretKey)
                .compact();
    }
    
    // HTTP 헤더에 담긴 JWT 토큰을 가져옴
    public String resolveJwtToken(HttpServletRequest request) {
        return request.getHeader("Authorization");
    }
    // 토큰 검증을 위해 AuthenticationManager의 인스턴스로 전달
    public Authentication getAuthentication(String token) {
        UserDetails userDetails = userDetailsService.loadUserByUsername(this.getUserId(token));
        return new UsernamePasswordAuthenticationToken(userDetails, "", userDetails.getAuthorities());
    }
    
    // 토큰으로부터 사용자 ID를 가져옴 
    public String getUserId(String token) {
        return getClaimsFromJwtToken(token).getBody().getSubject();
    }

    // 토큰이 유효한지 확인
    public boolean isTokenValid(String jwtToken) {
        try {
            Jws<Claims> claims = getClaimsFromJwtToken(jwtToken);
            return !claims.getBody().getExpiration().before(new Date());
        } catch (Exception e) {
            return false;
        }
    }

    // 토큰으로부터 클레임들을 확인
    public Jws<Claims> getClaimsFromJwtToken(String jwtToken) throws JwtException {
        return Jwts.parser().setSigningKey(secretKey).parseClaimsJws(jwtToken);
    }
}