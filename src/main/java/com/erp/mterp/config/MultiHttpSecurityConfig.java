package com.erp.mterp.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.ServletListenerRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.authentication.session.RegisterSessionAuthenticationStrategy;
import org.springframework.security.web.session.HttpSessionEventPublisher;

@EnableWebSecurity
public class MultiHttpSecurityConfig {
    @Autowired
    private UserDetailsService userDetailsService;


    @Bean
    public PasswordEncoder passwordencoder() {
        return new BCryptPasswordEncoder();
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordencoder());

    }

    @Configuration
    @Order(1)
    public static class ApiWebSecurityConfigurationAdapter extends WebSecurityConfigurerAdapter {

        @Autowired
        private JwtAuthEntryPoint unauthorizedHandler;

        @Bean
        public JwtAuthTokenFilter authenticationJwtTokenFilter() {
            return new JwtAuthTokenFilter();
        }

        @Bean
        @Override
        public AuthenticationManager authenticationManagerBean() throws Exception {
            return super.authenticationManagerBean();
        }

        @Override
        protected void configure(HttpSecurity http) throws Exception {
            http.cors().and().csrf().disable().authorizeRequests().antMatchers("/api/**",
                    "/api/auth/**")
                    .permitAll().antMatchers("/shopifysetup/**").permitAll().antMatchers("/pos/pdf/**").permitAll().and().antMatcher("/api/**").authorizeRequests()
                    .anyRequest()
                    .access("hasRole('ROLE_Api')")
                    .and().exceptionHandling().authenticationEntryPoint(unauthorizedHandler);
            http.addFilterBefore(authenticationJwtTokenFilter(), UsernamePasswordAuthenticationFilter.class);

        }
    }

    @Configuration
    @Order(2)
    public static class FormLoginWebSecurityConfigurerAdapter extends WebSecurityConfigurerAdapter {
        @Autowired
        CustomizeAuthenticationSuccessHandler customizeAuthenticationSuccessHandler;

        @Autowired
        CustomLoginFailureHandler customLoginFailureHandler;

        @Override
        protected void configure(HttpSecurity http) throws Exception {
            http.headers().frameOptions().sameOrigin();
            http.authorizeRequests()
                    .antMatchers("/location/**", "/assets/**", "/image/**", "/img/**", "/css/**", "/images/**", "/fonts/**", "/public/**",
                            "/resources/public/**", "/resources/**", "/swagger-resources/**",
                            "/swagger-ui.html",
                            "/v2/api-docs")
                    .permitAll().antMatchers("/login", "/signup", "/signup/save", "/signup/findall", "/Industrytype/findall", "/admin/**", "/store").permitAll()
                    .antMatchers("/login/forgotpasssword").permitAll()
                    .antMatchers("/woocommerce/**").permitAll()
                    .antMatchers("/No-image-found.jpg").permitAll()
                    .antMatchers("/Payment/paytm").permitAll()
                    .antMatchers("/Payment/cashfree").permitAll()
                    .antMatchers("/Payment/instamojo").permitAll()
                    .antMatchers("/Payment/razorpay").permitAll()
                    .antMatchers("/sendotp", "/signup/otp/confirm").permitAll()
                    .antMatchers("/pospdf/**").permitAll()
                    .antMatchers("/json/**").permitAll()
                    .antMatchers("/shopifysetup/**").permitAll()
                    .antMatchers("/inventorytracking/**").permitAll()
                    .antMatchers("/ogoshops/**").permitAll()
                    .antMatchers("/ogoshops/api/**").permitAll()
                    .antMatchers("/selfcheckout/**").permitAll()
                    .antMatchers("/gs-guide-websocket").permitAll()
                    .antMatchers("/pos/pdf/**").permitAll()
                    .antMatchers("/newpassword").permitAll()
                    .antMatchers("/forgotpasssword", "/otp/confirm", "/signup/findallcompany", "/signup/checkdomain").permitAll()
                    .antMatchers("/accepturl/**").permitAll()
                    .antMatchers("/media/download/**").permitAll()
                    .antMatchers("/media/download/dailyreport/**").permitAll()
                    .antMatchers("/media/download/sales/{token}/feedback").permitAll()
                    .antMatchers("/salesfeedback/save").permitAll()
                    .antMatchers("/vasy/**").permitAll()
                    .antMatchers("/insertpermision").permitAll()
                    .antMatchers("/insertpermisionbranch").permitAll()
                    .antMatchers("/DataImport/**").permitAll()
                    .antMatchers("/checkusername").permitAll()
                    .antMatchers("/**").access("hasRole('ROLE_ADMIN') or hasRole('ROLE_corporate') or hasRole('ROLE_company') or hasRole('ROLE_branch') or hasRole('ROLE_user') ")
                    .anyRequest().authenticated().and().formLogin().loginPage("/login")
                    .successHandler(customizeAuthenticationSuccessHandler).usernameParameter("userName")
                    .failureHandler(customLoginFailureHandler)
                    .passwordParameter("password").and().logout().logoutSuccessUrl("/login?logout")
                    .deleteCookies("auth_code", "JSESSIONID").invalidateHttpSession(true).and().exceptionHandling()
                    .accessDeniedPage("/403").and().csrf().disable();

            http.headers().frameOptions().sameOrigin();
            http.sessionManagement().invalidSessionUrl("/login").maximumSessions(100).maxSessionsPreventsLogin(false).expiredUrl("/login?error=expired").sessionRegistry(sessionRegistry());
            http.sessionManagement().sessionFixation().migrateSession()
                    .sessionAuthenticationStrategy(registerSessionAuthStr());

//            http.sessionManagement().invalidSessionUrl("/login").maximumSessions(100).maxSessionsPreventsLogin(true);
//            http.sessionManagement().sessionFixation().migrateSession()
//                    .sessionAuthenticationStrategy(registerSessionAuthStr());
        }

        @Override
        public void configure(WebSecurity web) throws Exception {

            super.configure(web);
            web.ignoring().antMatchers("/static/**");
        }

        @Bean
        public SessionRegistry sessionRegistry() {
            return new SessionRegistryImpl();
        }

        @Bean
        public RegisterSessionAuthenticationStrategy registerSessionAuthStr() {
            return new RegisterSessionAuthenticationStrategy(sessionRegistry());
        }

        @Bean
        public ServletListenerRegistrationBean<HttpSessionEventPublisher> httpSessionEventPublisher() {
            return new ServletListenerRegistrationBean<>(new HttpSessionEventPublisher());
        }
    }

}
