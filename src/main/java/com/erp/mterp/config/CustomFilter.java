package com.erp.mterp.config;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;

@Configuration
@Order(Ordered.HIGHEST_PRECEDENCE)
public class CustomFilter implements Filter {


    private static final Logger LOGGER = LoggerFactory.getLogger(CustomFilter.class);

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // LOGGER.info("########## Initiating Custom filter ##########");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession(false);
        Object login = null;
        if (session != null) {
            login = session.getAttribute("userId");
        }
        boolean isLoggedIn = (login != null);
        // LOGGER.info("IS LOGGED IN {}", isLoggedIn);
        // LOGGER.info("Logging Request {} : {}", request.getMethod(),
        // request.getRequestURI());

        if (request.getRequestURI().equals("/login")) {
            if (isLoggedIn) {
//				 Redirect to landing or home page

                response.sendRedirect("/success");
            } else {
//				 Otherwise, nothing to do if he has not logged in
//				 pass the request along the filter chain
                filterChain.doFilter(request, response);
            }
        } else {
//			 For all other pages,
            filterChain.doFilter(request, response);
        }

        // LOGGER.info("Logging Response :{}", response.getContentType());
    }

    @Override
    public void destroy() {
        // TODO: 7/4/18
    }

}
