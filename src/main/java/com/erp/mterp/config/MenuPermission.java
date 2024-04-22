package com.erp.mterp.config;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

import com.erp.mterp.repository.navmenupermission.NavMenuPermissionRepository;
import com.erp.mterp.vo.navmenu.NavSubMenuVo;

@Component
public final class MenuPermission implements ApplicationContextAware {

    private static ApplicationContext context;

    private static NavMenuPermissionRepository navMenuPermissionRepository;

    public static int havePermission(HttpSession session, String type, long action) {

        /*
         * System.err.println("session -> " + session.getAttribute("userType"));
         * System.err.println("type  -> "+type);
         * System.err.println("action -> "+action);
         */
        navMenuPermissionRepository = context.getBean(NavMenuPermissionRepository.class);
        List<NavSubMenuVo> list = ((List<NavSubMenuVo>) session.getAttribute("NavSubMenuPermission")).stream()
                .filter(p -> p.getType().equals(type)).collect(Collectors.toList());

        List<NavSubMenuVo> list2 = list.stream().filter(x -> x.getType().equalsIgnoreCase(type)).collect(Collectors.toList());
        System.out.println("uv-->>PERMISSINNNN---->>>SIZE" + list2.size());
        System.out.println("uv-->>PERMISSINNNN---->>>TYpe" + type);


        //list2.stream().forEach(y->Stream.of(y.getHideCompanyId()).anyMatch(z->z.equals("2")))
        boolean status = false;
        for (int i = 0; i < list2.size(); i++) {
            List<String> ss = new ArrayList<String>();
            if (list2.get(i).getHideCompanyId() != null) {
                //ss=(List<String>) Stream.of(list2.get(i).getHideCompanyId().split(","));
                ss = Arrays.asList(list2.get(i).getHideCompanyId().split(","));
                //ss.forEach(cc->System.out.println("--->>>UV"+cc));
                for (String sss : ss) {
                    if (sss.equals(session.getAttribute("companyId").toString())) {
                        status = true;
                    }
                }
            }
        }

        System.out.println("uv-->>PERMISSINNNN---->>>" + status);
        if (status) {
            return 0;

        } else {
            if (list.size() != 0 &&
                    navMenuPermissionRepository.findByTypeAndActionAndRole(type, action, Long.parseLong(session.getAttribute("userType").toString())).size() != 0) {
                return 1;
            } else {
                return 0;
            }
        }
    }

    //@Autowired
	/*private static
	UserRoleRepository userRoleRepository;
*/
    public static int getPermissionForGlobal(HttpSession session, String type, String action) {

	/*	System.err.println(type+ " "+session.getAttribute("userId").toString()+ " "+action);
		List checkList = userRoleRepository.getCheckList();
		System.err.println("LISSSSSSSST size----->"+checkList.size());


		List<NavMenuPermissionVo> list=userRoleRepository.getSubmenuListWithGlobalPermission("customers", 1,"create");
		System.out.println("=================PERMISSION LIST SIZE----->"+list.size());
		//List list=new UserRoleDao().getSubmenuListWithPermission(type, Long.parseLong(session.getAttribute("userType").toString()));
		//
		List<NavMenuPermissionVo> list = ((List<NavMenuPermissionVo>) session.getAttribute("NavSubMenuPermission"))
				.stream().filter(p -> p.getNavSubMenuVo().getType().equals(type)).collect(Collectors.toList());

		if(list.size() != 0)
			return 1;
		else*/
        return 0;

    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        context = applicationContext;
    }
}   
