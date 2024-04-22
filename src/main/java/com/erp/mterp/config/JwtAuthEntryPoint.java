package com.erp.mterp.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class JwtAuthEntryPoint implements AuthenticationEntryPoint {

    private static final Logger logger = LoggerFactory.getLogger(JwtAuthEntryPoint.class);

//    @Override
//    public void commence(HttpServletRequest request,
//                         HttpServletResponse response,
//                         AuthenticationException e) 
//                             throws IOException, ServletException {
//      
//        logger.error("Unauthorized error. Message - {}", e.getMessage());
//        response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Error -> Unauthorized");
//    }


    @Override
    public void commence(HttpServletRequest httpServletRequest,
                         HttpServletResponse httpServletResponse,
                         AuthenticationException e) throws IOException, ServletException {
        logger.error("Responding with unauthorized error. Message - {}", e.getMessage());
        if (e instanceof BadCredentialsException) {
            httpServletResponse.setContentType(MediaType.APPLICATION_JSON_VALUE);

            httpServletResponse.getOutputStream().write(new ObjectMapper()
                    .writeValueAsBytes("Incorrect account or password"));

//            Result invalidUserNameOrPassword = ControllerUtils.buildErrorResult(101, "Incorrect account or password");
//            httpServletResponse.getOutputStream().write(new ObjectMapper()
//                    .writeValueAsBytes(invalidUserNameOrPassword));

        } else {
            httpServletResponse.sendError(HttpServletResponse.SC_UNAUTHORIZED,
                    "Unauthorized access");
        }
    }

}
