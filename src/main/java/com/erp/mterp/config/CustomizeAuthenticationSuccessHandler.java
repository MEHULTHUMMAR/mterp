package com.erp.mterp.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.erp.mterp.constant.Constant;
import com.erp.mterp.repository.user.UserRepository;
import com.erp.mterp.vo.userfront.UserFrontVo;


@Component
public class CustomizeAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
    /*	@Autowired	//(required=true)
        UserRepository userRepository;
    */
    //Urvich
    @Autowired
    SessionUtils sessionUtils;
    @Autowired
    UserRepository userRepository;
    
    @Autowired
    GetClientInfo getClientInfo;
    
    @Value("${single.user.session}")
    private String SINGLE_USER_SESSION;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws IOException, ServletException {
        if (StringUtils.equals(SINGLE_USER_SESSION, "true")) {
            sessionUtils.expireUserSessions(authentication.getName());
        } else {

            System.err.println("SINGLE_USER_SESSION is false" + authentication.getName());
        }

        response.setStatus(HttpServletResponse.SC_OK);
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        UserFrontVo userFrontVo = userRepository.findByUserName(auth.getName());
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.setAttribute("UserName", userFrontVo.getUserName());
            session.setAttribute("Name", userFrontVo.getName());
            session.setAttribute("companyEmail", userFrontVo.getEmail());
            try {
                String s[] = userFrontVo.getName().split(" ");
                if (s.length >= 1) {
                    session.setAttribute("HeaderName", s[0].substring(0, 1) + "" + s[1].substring(0, 1));
                } else {
                    session.setAttribute("HeaderName", s[0].substring(0, 2));
                }
            } catch (Exception e) {
                String s[] = userFrontVo.getName().split(" ");
                session.setAttribute("HeaderName", s[0].substring(0, 2));
            }
        }

        boolean admin = false;

        for (GrantedAuthority auth1 : authentication.getAuthorities()) {

            System.out.println("autority ronak = " + auth1.getAuthority());
            if ("ROLE_ADMIN".equals(auth1.getAuthority())) {
                admin = true;
                session.setAttribute("userrole", "ROLE_ADMIN");
            } else {
                long corporateUserFrontId = 0;
                if (Constant.CORPORATES.equals(auth1.getAuthority())) {
                    corporateUserFrontId = userFrontVo.getUserFrontId();
                    session.setAttribute("corporateId", userFrontVo.getUserFrontId());
                    session.setAttribute("branchId", userFrontVo.getUserFrontId());
                    session.setAttribute("companyId", userFrontVo.getUserFrontId());
                    session.setAttribute("userType", Constant.URID_CORPORATE);
                    session.setAttribute("userId", userFrontVo.getUserFrontId());

                } else if (Constant.CONTACT_COMPANY.equals(auth1.getAuthority())) {
                    corporateUserFrontId = userFrontVo.getUserFrontVo().getUserFrontId();
                    session.setAttribute("userId", userFrontVo.getUserFrontId());
                    session.setAttribute("corporateId", userFrontVo.getUserFrontVo().getUserFrontId());
                    session.setAttribute("branchId", userFrontVo.getUserFrontId());
                    session.setAttribute("companyId", userFrontVo.getUserFrontVo().getUserFrontId());
                    session.setAttribute("userType", Constant.URID_COMPANY);


                } else if (Constant.CONTACT_BRANCH.equals(auth1.getAuthority())) {
                    corporateUserFrontId = userFrontVo.getUserFrontVo().getUserFrontVo().getUserFrontId();
                    session.setAttribute("userId", userFrontVo.getUserFrontId());
                    session.setAttribute("corporateId", userFrontVo.getUserFrontVo().getUserFrontVo().getUserFrontId());
                    session.setAttribute("branchId", userFrontVo.getUserFrontId());
                    session.setAttribute("companyId", userFrontVo.getUserFrontId());
                    session.setAttribute("userType", Constant.URID_BRANCH);
                    /*
                     * session.setAttribute("companySetting", new
                     * CompanySettingDao().getCompanySettings(userFrontVo.getUserFrontId()));
                     * session.setAttribute("branchList", new LoginDao()
                     * .getBranchListFromCompany(userFrontVo.getUserFrontId(),
                     * Constant.URID_BRANCH));
                     */
                } else {
                    session.setAttribute("userId", userFrontVo.getUserFrontId());
                    // coding for user as per requirement
                }


            }
        }


        if (request.isUserInRole("ROLE_ADMIN")) {
            response.sendRedirect("/dashboard");
        } else {
            response.sendRedirect("/success");
        }

    }
}
