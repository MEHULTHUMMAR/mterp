package com.erp.mterp.config;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;

import com.erp.mterp.repository.user.UserRepository;

public class JWTAuthorizationFilter extends BasicAuthenticationFilter {
	 @Autowired
	 private UserRepository userRepository;
	 
    public JWTAuthorizationFilter(AuthenticationManager authManager) {
        super(authManager);
    }

    private String getSecretKey(HttpServletRequest request) {
		return request.getHeader("SecretKey");
	}

	private String getAccessKey(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return request.getHeader("AccessKey");
	}
    // Reads the JWT from the Authorization header, and then uses JWT to validate the token
    private UsernamePasswordAuthenticationToken getAuthentication(HttpServletRequest request) {
        //String token = request.getHeader(HEADER_STRING);
        String accessKey = getAccessKey(request);
        String secretKey = getSecretKey(request);


//        if (accessKey != null && secretKey!=null ) {
//            //String username = tokenProvider.getUserNameFromJwtToken(jwt);
//        	
//            //System.out.println("---------------------------------" + username);
//        	UserFrontVo frontVo=userRepository.findByAccessKeyAndSecretKey(accessKey,secretKey);
//        	
//        	if(frontVo!=null) {
//        	
//        	Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
//                  grantedAuthorities.add(new SimpleGrantedAuthority("ROLE_Api"));
//              
//        	RequestUserDetails rd;
//        	 rd = new RequestUserDetails( accessKey,  secretKey,  frontVo.getUserFrontId(),frontVo.getUserFrontId(),
//        			 grantedAuthorities);
//            UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(
//            		rd, null, rd.getAuthorities());
//            authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
//
//            SecurityContextHolder.getContext().setAuthentication(authentication);
//            return new UsernamePasswordAuthenticationToken(frontVo.getAccessKey(), frontVo.getSecretKey(), new ArrayList<>());
//        	}
//        }
       

        return null;
    }
}
