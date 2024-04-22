<%-- <!-- BEGIN: Left Aside -->
<button class="m-aside-left-close  m-aside-left-close--skin-dark " id="m_aside_left_close_btn"><i class="la la-close"></i></button>

<div id="m_aside_left" class="m-grid__item	m-aside-left  m-aside-left--skin-dark ">	
	<!-- BEGIN: Aside Menu -->
	<div id="m_ver_menu" class="m-aside-menu  m-aside-menu--skin-dark m-aside-menu--submenu-skin-dark " m-menu-vertical="1" m-menu-scrollable="1" m-menu-dropdown-timeout="500">		
		<ul class="m-menu__nav ">			
			
		<c:forEach items="${sessionScope.NavMenuPermission}" var="NavMenuPermission">	
		
			<c:choose>
					<c:when test="${NavMenuPermission.menuURL!='#'}">
			            <li class="m-menu__item " aria-haspopup="true" >
			            	<a  href="${NavMenuPermission.menuURL}" class="m-menu__link "><span class="m-menu__item-here"></span><i class="m-menu__link-icon flaticon-line-graph"></i>
			            		<span class="m-menu__link-text">${NavMenuPermission.title}</span>
			            	</a>
			            </li>		
            		</c:when>
            		<c:otherwise>
            			<li class="m-menu__item  m-menu__item--submenu " aria-haspopup="true" >
			            	<a  href="javascript:;" class="m-menu__link m-menu__toggle">
			            		<span class="m-menu__item-here"></span>
			            		<i class="m-menu__link-icon flaticon-layers"></i>
			            		<span class="m-menu__link-text">${NavMenuPermission.title}</span>
			            		<i class="m-menu__ver-arrow la la-angle-right"></i>
			            	</a>
			            	<div class="m-menu__submenu ">
			            		<span class="m-menu__arrow"></span>
			            		<ul class="m-menu__subnav">
			            			<c:forEach items="${sessionScope.NavSubMenuPermission}" var="NavSubMenuPermission">	
				            			<c:if test="${NavMenuPermission.navMenuId==NavSubMenuPermission.navMenuVo.navMenuId}">
					            			<li class="m-menu__item " aria-haspopup="true"  m-menu-link-redirect="1">
												<a  href="${NavSubMenuPermission.menuURL}" class="m-menu__link ">
													<i class="m-menu__link-bullet m-menu__link-bullet--dot">
													<span></span>
													</i>
													<span class="m-menu__link-text">${NavSubMenuPermission.title}</span>
												</a>
											</li>
				            			</c:if>			            			
				            		
				            		</c:forEach>
	            				</ul>	
	            			</div>
	            		</li>		
	            	</c:otherwise>
            	</c:choose>
            </c:forEach>
          </ul>
          </div>
          
	</div>
	<!-- END: Aside Menu -->

<!-- END: Left Aside --> --%>

<div id="m_aside_left" class="m-grid__item	m-aside-left  m-aside-left--skin-dark ">
    <!-- BEGIN: Aside Menu -->
    <div id="m_ver_menu" class="m-aside-menu  m-aside-menu--skin-dark m-aside-menu--submenu-skin-dark "
         m-menu-vertical="1"
         m-menu-scrollable="1" m-menu-dropdown-timeout="500">
        <ul class="m-menu__nav ">

            <c:forEach items="${sessionScope.NavMenuPermission}" var="NavMenuPermission">

                <c:set var="availableMain" value="true" scope="page"/>
                <c:if test="${not empty NavMenuPermission.hideCompanyId}">
                    <c:set var="arrayofmsgMain" value="${uvfn:split( NavMenuPermission.hideCompanyId,',')}"/>
                    <c:forEach var="i" begin="0" end="${uvfn:length(arrayofmsgMain)-1}">
                        <c:if test="${arrayofmsgMain[i]==sessionScope.companyId}">
                            <c:set var="availableMain" value="false" scope="page"/>
                        </c:if>
                    </c:forEach>
                </c:if>
                <c:if test="${availableMain==true}">
                    <c:choose>
                        <c:when test="${NavMenuPermission.menuURL!='#'}">
                            <li class="m-menu__item " aria-haspopup="true">
                                <a href="<%=request.getContextPath() %>/${NavMenuPermission.menuURL}"
                                   <c:if test="${NavMenuPermission.menuURL=='pos/new'}">target="_blank"</c:if>
                                   class="m-menu__link "><span class="m-menu__item-here"></span><i
                                        class="m-menu__link-icon ${NavMenuPermission.iconClass}"></i>
                                    <span class="m-menu__link-text">${NavMenuPermission.title}</span>
                                </a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="m-menu__item  m-menu__item--submenu " aria-haspopup="true">
                                <a href="javascript:;" class="m-menu__link m-menu__toggle">
                                    <span class="m-menu__item-here"></span>
                                    <i class="m-menu__link-icon ${NavMenuPermission.iconClass}"></i>
                                    <span class="m-menu__link-text">${NavMenuPermission.title}</span>
                                    <i class="m-menu__ver-arrow la la-angle-right"></i>
                                </a>
                                <div class="m-menu__submenu ">
                                    <span class="m-menu__arrow"></span>
                                    <ul class="m-menu__subnav">
                                        <c:forEach items="${sessionScope.NavSubMenuPermission}"
                                                   var="NavSubMenuPermission">

                                            <c:if test="${NavMenuPermission.navMenuId==NavSubMenuPermission.navMenuVo.navMenuId }">
                                                <c:set var="available" value="true" scope="page"/>
                                                <c:if test="${not empty NavSubMenuPermission.showCompanyId}">
                                                    <c:set var="available" value="false" scope="page"/>
                                                    <c:set var="arrayofmsg"
                                                           value="${uvfn:split( NavSubMenuPermission.showCompanyId,',')}"/>
                                                    <c:forEach var="i" begin="0" end="${uvfn:length(arrayofmsg)-1}">
                                                        <c:if test="${arrayofmsg[i]==sessionScope.companyId}">
                                                            <c:set var="available" value="true" scope="page"/>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${not empty NavSubMenuPermission.hideCompanyId}">
                                                    <c:set var="arrayofmsgHide"
                                                           value="${uvfn:split( NavSubMenuPermission.hideCompanyId,',')}"/>
                                                    <c:forEach var="i" begin="0" end="${uvfn:length(arrayofmsgHide)-1}">
                                                        <c:if test="${arrayofmsgHide[i]==sessionScope.companyId}">
                                                            <c:set var="available" value="false" scope="page"/>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${available==true}">
                                                    <li class="m-menu__item " aria-haspopup="true"
                                                        m-menu-link-redirect="1">
                                                        <a href="<%=request.getContextPath() %>/${NavSubMenuPermission.menuURL}"
                                                           class="m-menu__link ">
                                                            <i class="m-menu__link-bullet m-menu__link-bullet--dot">
                                                                <span></span>
                                                            </i>
                                                            <span class="m-menu__link-text">${NavSubMenuPermission.title}</span>
                                                        </a>
                                                    </li>
                                                </c:if>
                                            </c:if>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:if>
            </c:forEach>
        </ul>
    </div>
    <!-- END: Aside Menu -->
</div>
<!-- END: Left Aside -->