package com.erp.mterp.config;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.web.filter.OncePerRequestFilter;

import com.erp.mterp.repository.user.UserRepository;

public class JwtAuthTokenFilter extends OncePerRequestFilter {
    private static final Logger logger = LoggerFactory.getLogger(JwtAuthTokenFilter.class);
    @Autowired
    private JwtProvider tokenProvider;
    @Autowired
    private UserDetailsService userDetailsService;
    @Autowired
    private UserRepository userRepository;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
            throws ServletException, IOException {
        try {

            String jwt = getJwt(request);
            String accessKey = getAccessKey(request);
            String secretKey = getSecretKey(request);


            if (accessKey != null && secretKey!=null ) {
                //String username = tokenProvider.getUserNameFromJwtToken(jwt);
            	
                //System.out.println("---------------------------------" + username);
            	long userFrontId=userRepository.findByAccessKeyAndSecretKey(accessKey,secretKey);

            	if(userFrontId!=0) {
            	
            	Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
                      grantedAuthorities.add(new SimpleGrantedAuthority("ROLE_Api"));
                  
            	RequestUserDetails rd;
            	 rd = new RequestUserDetails( accessKey,  secretKey,  userFrontId,userFrontId,
            			 grantedAuthorities);
                UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(
                		rd, null, rd.getAuthorities());
                authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));

                SecurityContextHolder.getContext().setAuthentication(authentication);
            	}
            }
        } catch (Exception e) {
            logger.error("Can NOT set user authentication -> Message: {}", e);
        }

        filterChain.doFilter(request, response);
    }

    private String getSecretKey(HttpServletRequest request) {
		return request.getHeader("SecretKey");
	}

	private String getAccessKey(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return request.getHeader("AccessKey");
	}

	private String getJwt(HttpServletRequest request) {
        String authHeader = request.getHeader("Authorization");

        if (authHeader != null && authHeader.startsWith("Bearer ")) {
            return authHeader.replace("Bearer ", "");
        }

        return null;
    }

}
