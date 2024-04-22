package com.erp.mterp.service.login;

import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.erp.mterp.config.RequestUserDetails;
import com.erp.mterp.constant.Constant;
import com.erp.mterp.repository.user.UserRepository;
import com.erp.mterp.vo.userfront.UserFrontVo;
import com.erp.mterp.vo.userrole.UserRoleVo;


@Service
@Transactional
public class UserDetailsServiceImpl implements UserDetailsService {
    
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private HttpServletRequest request;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        RequestUserDetails rd;
      
        UserFrontVo userFrontVo = userRepository.findByUserNameAndStatusAndIsDeleted(
                username, "active", 0);
        if (userFrontVo == null)
            throw new UsernameNotFoundException(username + " not found");

        // Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
        // grantedAuthorities.add(new SimpleGrantedAuthority("USERROLE"));
        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();

        for (UserRoleVo role : userFrontVo.getRoles()) {
            if (role.getUserRoleId() == Constant.URID_CORPORATE) {
                grantedAuthorities.add(new SimpleGrantedAuthority("ROLE_corporate"));
            } else if (role.getUserRoleId() == Constant.URID_BRANCH) {
                grantedAuthorities.add(new SimpleGrantedAuthority("ROLE_branch"));
            } else if (role.getUserRoleId() == Constant.URID_COMPANY) {
                grantedAuthorities.add(new SimpleGrantedAuthority("ROLE_company"));
            } else if (role.getUserRoleId() > 3) {
                grantedAuthorities.add(new SimpleGrantedAuthority("ROLE_user"));
            } else {
                grantedAuthorities.add(new SimpleGrantedAuthority("ROLE_" + role.getUserRoleId()));
            }
        }

        Long userFrontId = null;

        Long roleId = null;

        Long userType = null;

        Long corporateId = null;

        Long branchId = null;

        Long companyId = null;

        String stateCode = null;

        String countryCode = null;

        String name = null;

        userFrontId = userFrontVo.getUserFrontId();
        name = userFrontVo.getName();
        roleId = userFrontVo.getRoles().get(0).getUserRoleId();

        if (Constant.URID_CORPORATE == roleId) {

            corporateId = userFrontVo.getUserFrontId();
            userType = Constant.URID_CORPORATE;

        } else if (Constant.URID_COMPANY == roleId) {

            corporateId = userFrontVo.getUserFrontVo().getUserFrontId();
            branchId = userFrontVo.getUserFrontId();
            companyId = userFrontVo.getUserFrontId();
            userType = Constant.URID_COMPANY;

        } else if (Constant.URID_BRANCH == roleId) {

            corporateId = userFrontVo.getUserFrontVo().getUserFrontId();
            branchId = userFrontVo.getUserFrontId();
            companyId = userFrontVo.getUserFrontVo().getUserFrontId();
            userType = Constant.URID_BRANCH;

        } else {
            // coding for user as per requirement

            corporateId = userFrontVo.getUserFrontVo().getUserFrontId();
            branchId = userFrontVo.getUserFrontVo().getUserFrontId();
            companyId = userFrontVo.getUserFrontVo().getUserFrontId();
            userType = Constant.URID_USER;

        }
        System.out.println(roleId);
        // set financialYear and monthInterval
        if (Constant.URID_CORPORATE != roleId) {

            if (roleId > 3) {
                stateCode = userFrontVo.getUserFrontVo().getStateCode();
                countryCode = userFrontVo.getUserFrontVo().getCountriesCode();
            } else {
                stateCode = userFrontVo.getStateCode();
                countryCode = userFrontVo.getCountriesCode();
            }

        }

        rd = new RequestUserDetails(username, userFrontVo.getPassword(), userFrontId, roleId, userType, corporateId,
                branchId, companyId, stateCode, countryCode, name, grantedAuthorities);

        return rd;
    }

    @Transactional
    public void updateWhatsappTokenByUserFrontId(long userFrontId, String whatsappToken, String modifiedOn) {
        userRepository.updateWhatsappTokenByUserFrontId(userFrontId, whatsappToken, modifiedOn);

    }

}
