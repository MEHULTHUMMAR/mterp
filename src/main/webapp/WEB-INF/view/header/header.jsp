<!-- BEGIN: Header -->
<style>
   #notificationNumber {
   left: 24%;
   top: 10px;
   background-color: #f4516c;
   color: #fff;
   font-weight: bold;
   }
   .payment {
   background-color: #f4516c;
   color: #111;
   font-weight: bold;
   }
   .stock {
   background-color: #34bfa3;
   color: #111;
   font-weight: bold;
   }
   <!--
      -->
</style>
<header id="m_header" class="m-grid__item    m-header "
   m-minimize-offset="200" m-minimize-mobile-offset="200">
   <div class="m-container m-container--fluid m-container--full-height">
      <div class="m-stack m-stack--ver m-stack--desktop">
         <!-- BEGIN: Brand -->
         <div class="m-stack__item m-brand  m-brand--skin-dark ">
            <div class="m-stack m-stack--ver m-stack--general">
               <div class="m-stack__item m-stack__item--middle"
                  id="m-logo_div_header">
                  <!--  m-brand__logo -->
                  <a href="/" class="m-brand__logo-wrapper"> <img alt=""
                     src="<%=request.getContextPath()%>/images/mterplogo.jpg"
                     style="height: 50px;"/>
                  </a>
                  <%-- <a href="#" class="m-brand__logo-wrapper " style="font-size: 2.9rem;color: white;font-weight: bold;" id="HeaderName">
                     <%=session.getAttribute("HeaderName").toString()%>
                     </a> --%>
               </div>
               <div class="m-stack__item m-stack__item--middle m-brand__tools">
                  <!-- BEGIN: Left Aside Minimize Toggle -->
                  <a href="javascript:;" id="m_aside_left_minimize_toggle"
                     onclick="ffff()"
                     class="m-brand__icon m-brand__toggler m-brand__toggler--left m--visible-desktop-inline-block  ">
                  <span></span>
                  </a>
                  <!-- END -->
                  <!-- BEGIN: Responsive Aside Left Menu Toggler -->
                  <a href="javascript:;" id="m_aside_left_offcanvas_toggle"
                     class="m-brand__icon m-brand__toggler m-brand__toggler--left m--visible-tablet-and-mobile-inline-block">
                  <span></span>
                  </a>
                  <!-- END -->
                  <!-- BEGIN: Responsive Header Menu Toggler -->
                  <a id="m_aside_header_menu_mobile_toggle" href="javascript:;"
                     class="m-brand__icon m-brand__toggler m--visible-tablet-and-mobile-inline-block">
                  <span></span>
                  </a>
                  <!-- END -->
                  <!-- BEGIN: Topbar Toggler -->
                  <a id="m_aside_header_topbar_mobile_toggle" href="javascript:;"
                     class="m-brand__icon m--visible-tablet-and-mobile-inline-block">
                  <i class="flaticon-more"></i>
                  </a>
                  <!-- BEGIN: Topbar Toggler -->
               </div>
            </div>
         </div>
         <!-- END: Brand -->
         <div class="m-stack__item m-stack__item--fluid m-header-head"
            id="m_header_nav">
            <!-- BEGIN: Horizontal Menu -->
            <button
               class="m-aside-header-menu-mobile-close  m-aside-header-menu-mobile-close--skin-dark "
               id="m_aside_header_menu_mobile_close_btn">
            <i class="la la-close"></i>
            </button>
            <div id="m_header_menu"
               class="m-header-menu m-aside-header-menu-mobile m-aside-header-menu-mobile--offcanvas  m-header-menu--skin-dark m-header-menu--submenu-skin-light m-aside-header-menu-mobile--skin-dark m-aside-header-menu-mobile--submenu-skin-dark ">
              <%-- <ul class="m-menu__nav ">
                  <li class="m-menu__item  m-menu__item--submenu m-menu__item--rel"
                     m-menu-submenu-toggle="click" m-menu-link-redirect="1"
                     aria-haspopup="true">
                     <a href="javascript:;"
                        class="m-menu__link m-menu__toggle"> <i
                        class="m-menu__link-icon flaticon-add"></i> <span
                        class="m-menu__link-text">Quick Action</span> <i
                        class="m-menu__hor-arrow la la-angle-down"></i> <i
                        class="m-menu__ver-arrow la la-angle-right"></i>
                     </a>
                     <div
                        class="m-menu__submenu  m-menu__submenu--fixed m-menu__submenu--left"
                        style="width: 1000px">
                        <div class="m-menu__subnav">
                           <ul class="m-menu__content">
                              <li class="m-menu__item">
                                 <h3 class="m-menu__heading m-menu__toggle">
                                    <span class="m-menu__link-text">Coupon</span> <i
                                       class="m-menu__ver-arrow la la-angle-right"></i>
                                 </h3>
                                 <ul class="m-menu__inner">
                                    <li class="m-menu__item " m-menu-link-redirect="1"
                                       aria-haspopup="true"><a
                                       href="<%=request.getContextPath()%>/coupon/new"
                                       class="m-menu__link "> <i
                                       class="m-menu__link-bullet m-menu__link-bullet--line"><span></span></i>
                                       <span class="m-menu__link-text">Coupon</span>
                                       </a>
                                    </li>
                                 </ul>
                              </li>
                           </ul>
                        </div>
                     </div>
                  </li>
               </ul>--%>
            </div>
            <!-- END: Horizontal Menu -->
            <!-- BEGIN: Topbar -->
            <div id="m_header_topbar"
               class="m-topbar  m-stack m-stack--ver m-stack--general">
               <div class="m-stack__item m-topbar__nav-wrapper">
                  <ul class="m-topbar__nav m-nav m-nav--inline">
                     <li class="m-nav__item m-topbar__user-profile  m-dropdown m-dropdown--medium m-dropdown--arrow  m-dropdown--align-right m-dropdown--mobile-full-width m-dropdown--skin-light">
                     </li>
                     <li class="m-nav__item m-topbar__user-profile  m-dropdown m-dropdown--medium m-dropdown--arrow  m-dropdown--align-right m-dropdown--mobile-full-width m-dropdown--skin-light" m-dropdown-toggle="click">
                        <a href="#" class="m-nav__link m-dropdown__toggle"> 
                           <span class="m-topbar__userpic"> <img src="" class="m--img-rounded m--marginless m--img-centered" alt=""/>
	                        <span class="m-type m--bg-brand"><span class="m--font-light"> <%=session.getAttribute("Name").toString().substring(0, 1)%></span></span>
	                       </span> 
                        <span class="m-nav__link-icon m-topbar__usericon  m--hide">
                        <span class="m-nav__link-icon-wrapper"><i
                           class="flaticon-user-ok"></i></span>
                        </span> <span class="m-topbar__username m--hide"><%=session.getAttribute("Name").toString()%></span>
                        </a>
                        <div class="m-dropdown__wrapper">
                           <span class="m-dropdown__arrow m-dropdown__arrow--right m-dropdown__arrow--adjust"></span>
                           <div class="m-dropdown__inner">
                              <div class="m-dropdown__header m--align-center">
                                 <div class="m-card-user m-card-user--skin-light">
                                    <div class="m-card-user__pic">
                                       <img src="" class="m--img-rounded m--marginless" alt=""/>
                                    </div>
                                    <div class="m-card-user__details">
                                       <span class="m-card-user__name m--font-weight-500"><%=session.getAttribute("Name").toString()%>
                                       </span> <span href=""
                                          class="m-card-user__email m--font-weight-300"><%=session.getAttribute("UserName").toString()%></span>
                                    </div>
                                 </div>
                              </div>
                              <div class="m-dropdown__body">
                                 <div class="m-dropdown__content">
                                    <ul class="m-nav m-nav--skin-light">
                                       <li class="m-nav__section m--hide"><span
                                          class="m-nav__section-text">Section</span></li>
                                       <c:if test="${sessionScope.userType<=0}">
                                          <li class="m-nav__item">
                                             <a
                                                href="<%=request.getContextPath()%>/profile"
                                                class="m-nav__link">
                                                <i
                                                   class="m-nav__link-icon flaticon-profile-1"></i> 
                                                <span
                                                   class="m-nav__link-title">
                                                   <span
                                                      class="m-nav__link-wrap">
                                                      <span
                                                         class="m-nav__link-text">My Profile</span>
                                                      <!-- <span class="m-nav__link-badge"><span class="m-badge m-badge--success">2</span></span> -->
                                                   </span>
                                                </span>
                                             </a>
                                          </li>
                                       </c:if>
                                      <%-- <li class="m-nav__item">
                                          <a
                                             href="<%=request.getContextPath()%>/changepassword"
                                             class="m-nav__link">
                                             <i
                                                class="m-nav__link-icon flaticon-profile"></i> 
                                             <span
                                                class="m-nav__link-title">
                                                <span
                                                   class="m-nav__link-wrap">
                                                   <span
                                                      class="m-nav__link-text">Change Password</span>
                                                   <!-- <span class="m-nav__link-badge"><span class="m-badge m-badge--success">2</span></span> -->
                                                </span>
                                             </span>
                                          </a>
                                       </li>--%>
                                       <li class="m-nav__separator m-nav__separator--fit"></li>
                                       <li class="m-nav__item"><a
                                          href="<%=request.getContextPath()%>/logout"
                                          class="btn m-btn--pill btn-secondary m-btn m-btn--custom m-btn--label-brand m-btn--bolder">Logout</a>
                                       </li>
                                    </ul>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </li>

                  </ul>
               </div>
            </div>
            <!-- END: Topbar -->
         </div>
      </div>
   </div>
</header>
<!-- END: Header -->
<script>
   function ffff() {
   
       if ($("#m_aside_left_minimize_toggle").hasClass(
           "m-brand__toggler--active")) {
           $("#m-logo_div_header").addClass("m--hide");
       } else {
           $("#m-logo_div_header").removeClass("m--hide");
       }
   }
   
   
</script>