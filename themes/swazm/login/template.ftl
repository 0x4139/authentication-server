<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false displayWide=false showAnotherWayIfPresent=true>
    <html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="robots" content="noindex, nofollow">

        <#if properties.meta?has_content>
            <#list properties.meta?split(' ') as meta>
                <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
            </#list>
        </#if>
        <title>${msg("loginTitle",(realm.displayName!''))}</title>
        <link rel="icon" href="${url.resourcesPath}/img/favicon.ico"/>
        <!-- or -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,600,700&display=swap" rel="stylesheet">

        <!-- BEGIN: Vendor CSS-->
        <link rel="stylesheet" type="text/css" href="${url.resourcesPath}/vendors/css/vendors.min.css">
        <link rel="stylesheet" type="text/css" href="${url.resourcesPath}/vendors/css/ui/prism.min.css">
        <!-- END: Vendor CSS-->

        <!-- BEGIN: Theme CSS-->
        <link rel="stylesheet" type="text/css" href="${url.resourcesPath}/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="${url.resourcesPath}/css/bootstrap-extended.css">
        <link rel="stylesheet" type="text/css" href="${url.resourcesPath}/css/colors.css">
        <link rel="stylesheet" type="text/css" href="${url.resourcesPath}/css/components.css">


        <link href="${url.resourcesPath}/css/custom.css" rel="stylesheet">

        <#if properties.scripts?has_content>
            <#list properties.scripts?split(' ') as script>
                <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
            </#list>
        </#if>
        <#if scripts??>
            <#list scripts as script>
                <script src="${script}" type="text/javascript"></script>
            </#list>
        </#if>
    </head>

    <body style="background: #F2F4F4"
          class="horizontal-layout horizontal-menu navbar-sticky 1-column   footer-static bg-full-screen-image  blank-page blank-page"
          data-open="hover" data-menu="horizontal-menu" data-col="1-column">
    <!-- BEGIN: Content-->
    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="content-wrapper">
            <div class="content-header row">
            </div>
            <div class="content-body">
                <!-- login page start -->
                <section id="auth-login" class="row flexbox-container">

                    <div class="col-11 col-md-10 col-lg-8 col-xl-6">
                        <div class="col-12 ">
                            <img class="mx-auto d-block mb-3" src="${url.resourcesPath}/img/swazm-logo.png"
                                 alt="login logo" width="300">
                        </div>
                        <div style="background: white" class="card bg-authentication mb-0">
                            <div class="row m-0">
                                <!-- left section-forgot password -->
                                <div class="col-md-6 col-12 px-0">
                                    <div class="card disable-rounded-right mb-0 p-2">
                                        <div class="${properties.kcLoginClass!}">
                                            <div class="${properties.kcFormCardClass!} <#if displayWide>${properties.kcFormCardAccountClass!}</#if>">
                                                <header class="${properties.kcFormHeaderClass!}">
                                                    <#if realm.internationalizationEnabled  && locale.supported?size gt 1>
                                                        <div id="kc-locale">
                                                            <div id="kc-locale-wrapper"
                                                                 class="${properties.kcLocaleWrapperClass!}">
                                                                <div class="kc-dropdown" id="kc-locale-dropdown">
                                                                    <a href="#"
                                                                       id="kc-current-locale-link">${locale.current}</a>
                                                                    <ul>
                                                                        <#list locale.supported as l>
                                                                            <li class="kc-dropdown-item"><a
                                                                                        href="${l.url}">${l.label}</a>
                                                                            </li>
                                                                        </#list>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </#if>
                                                    <#if !(auth?has_content && auth.showUsername() && !auth.showResetCredentials())>
                                                        <#if displayRequiredFields>
                                                            <div class="${properties.kcContentWrapperClass!}">
                                                                <div class="${properties.kcLabelWrapperClass!} subtitle">
                                                            <span class="subtitle"><span
                                                                        class="required">*</span> ${msg("requiredFields")}</span>
                                                                </div>
                                                                <div class="col-md-10">
                                                                    <h1 id="kc-page-title"><#nested "header"></h1>
                                                                </div>
                                                            </div>
                                                        <#else>
                                                            <h1 id="kc-page-title"><#nested "header"></h1>
                                                        </#if>
                                                    <#else>
                                                        <#if displayRequiredFields>
                                                            <div class="${properties.kcContentWrapperClass!}">
                                                                <div class="${properties.kcLabelWrapperClass!} subtitle">
                                                            <span class="subtitle"><span
                                                                        class="required">*</span> ${msg("requiredFields")}</span>
                                                                </div>
                                                                <div class="col-md-10">
                                                                    <#nested "show-username">
                                                                    <div class="${properties.kcFormGroupClass!}">
                                                                        <div id="kc-username">
                                                                            <label id="kc-attempted-username">${auth.attemptedUsername}</label>
                                                                            <a id="reset-login"
                                                                               href="${url.loginRestartFlowUrl}">
                                                                                <div class="kc-login-tooltip">
                                                                                    <i class="${properties.kcResetFlowIcon!}"></i>
                                                                                    <span class="kc-tooltip-text">${msg("restartLoginTooltip")}</span>
                                                                                </div>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        <#else>
                                                            <#nested "show-username">
                                                            <div class="${properties.kcFormGroupClass!}">
                                                                <div id="kc-username">
                                                                    <label id="kc-attempted-username">${auth.attemptedUsername}</label>
                                                                    <a id="reset-login"
                                                                       href="${url.loginRestartFlowUrl}">
                                                                        <div class="kc-login-tooltip">
                                                                            <i class="${properties.kcResetFlowIcon!}"></i>
                                                                            <span class="kc-tooltip-text">${msg("restartLoginTooltip")}</span>
                                                                        </div>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </#if>
                                                    </#if>
                                                </header>
                                                <div id="kc-content">
                                                    <div id="kc-content-wrapper">
                                                        <#-- App-initiated actions should not see warning messages about the need to complete the action -->
                                                        <#-- during login.

                                                                                                                                  -->

                                                        <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
                                                                <#if message.type = 'success'>
                                                        <div class="alert alert-success mb-2" role="alert">
                                                            <div class="d-flex align-items-center">
                                                                <i class="bx bx-like"></i>
                                                                </#if>
                                                                <#if message.type = 'warning'>
                                                                <div class="alert alert-warning mb-2" role="alert">
                                                                    <div class="d-flex align-items-center">
                                                                        <i class="bx bx-error-circle"></i>
                                                                </#if>
                                                                <#if message.type = 'error'>
                                                                <div class="alert alert-danger mb-2" role="alert">
                                                                    <div class="d-flex align-items-center">
                                                                        <i class="bx bx-error"></i>
                                                                </#if>
                                                                <#if message.type = 'info'>
                                                                        <div class="alert alert-info mb-2" role="alert">
                                                                            <div class="d-flex align-items-center">
                                                                                <i class="bx bx-star"></i>
                                                                </#if>
                                                                <span class="kc-feedback-text">${kcSanitize(message.summary)?no_esc}</span>
                                                                </div>
                                                            </div>
                                                        </#if>

                                                        <#nested "form">

                                                        <#if auth?has_content && auth.showTryAnotherWayLink() && showAnotherWayIfPresent>
                                                            <form id="kc-select-try-another-way-form"
                                                                  action="${url.loginAction}" method="post"
                                                                  <#if displayWide>class="${properties.kcContentWrapperClass!}"</#if>>
                                                                <div <#if displayWide>class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}"</#if>>
                                                                    <div class="${properties.kcFormGroupClass!}">
                                                                        <input type="hidden" name="tryAnotherWay"
                                                                               value="on"/>
                                                                        <a href="#" id="try-another-way"
                                                                           onclick="document.forms['kc-select-try-another-way-form'].submit();return false;">${msg("doTryAnotherWay")}</a>
                                                                    </div>
                                                                </div>
                                                            </form>
                                                        </#if>

                                                        <#if displayInfo>
                                                            <div id="kc-info" class="${properties.kcSignUpClass!}">
                                                                <div id="kc-info-wrapper"
                                                                     class="${properties.kcInfoAreaWrapperClass!}">
                                                                    <#nested "info">
                                                                </div>
                                                            </div>
                                                        </#if>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- right section image -->
                                <div style="background: #ffffff;border-left:1px solid #CDDCEC;"
                                     class="col-md-6 d-md-block d-none text-center align-self-center">
                                    <img class="img-fluid" src="${url.resourcesPath}/img/login_bg.png" alt="login logo"
                                         width="300">
                                </div>
                                <!-- END: Content-->

                            </div>
                        </div>
                    </div>
                </section>
                <!-- login page ends -->

            </div>
        </div>
    </div>
    </body>
    </html>
</#macro>
