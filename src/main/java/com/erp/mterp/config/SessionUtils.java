package com.erp.mterp.config;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.session.SessionInformation;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import lombok.extern.java.Log;

@Log
@Component
public class SessionUtils {
    @Autowired
    private HttpSession httpSession;

    @Autowired
    private SessionRegistry sessionRegistry;

    public void expireUserSessions(String username) {
        log.severe("expireUserSessions............");
        for (Object principal : sessionRegistry.getAllPrincipals()) {
            if (principal instanceof User) {
                UserDetails userDetails = (UserDetails) principal;
                if (userDetails.getUsername().equals(username)) {
                    log.severe("expireUserSessions............iffffffffff");

                    for (SessionInformation information : sessionRegistry.getAllSessions(userDetails, false)) {
                        log.severe("expireUserSessions............in loop");
                        log.severe("expireUserSessions............" + information.getSessionId());
                        log.severe("expireUserSessions............current session id " + httpSession.getId());

                        if (!information.getSessionId().equalsIgnoreCase(httpSession.getId())) {
                            information.expireNow();
                        }


                    }
                }
            }
        }
    }
}