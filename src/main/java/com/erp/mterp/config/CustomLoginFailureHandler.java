package com.erp.mterp.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import com.erp.mterp.repository.user.UserRepository;
import com.erp.mterp.vo.userfront.UserFrontVo;

@Component
public class CustomLoginFailureHandler implements AuthenticationFailureHandler {
    

    @Autowired
    GetClientInfo getClientInfo;

    @Autowired
    UserRepository userRepository;

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
                                        AuthenticationException exception) throws IOException, ServletException {
        String message = "";
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

        String username = (String) request.getParameter("userName");
        String password = (String) request.getParameter("password");

        UserFrontVo user = userRepository.findByUserName(username);
        boolean result = false;

        if (user != null) {
            result = passwordEncoder.matches(password, user.getPassword());

             if (user.getStatus().equals("inactive")) {
                message = "Your Trial is Expaired";
            } else if (result == false) {
                message = "Password is wrong";
            }
        } else {
            message = "Invalid User Name or Password";
        }

//		if (!user.getDomainname().contains(request.getParameter("hostName")+",")) 
//		{
//			message="Invalid domain...";
//		}else if(user.getStatus().equals("inactive"))
//		{
//			message="Your Trial is Expaired";
//		}else if(result==false)
//		{
//			message="Password is wrong";
//		}

        System.out.println("-----" + request.getParameter("userName"));
        response.sendRedirect(String.format("/login?error=%s", message));


    }

}
