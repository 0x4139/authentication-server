<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo displayWide=(realm.password && social.providers??); section>
    <#if section = "header">
        <div class="card-header pb-1">
            <div class="card-title">
                <h4 class="text-center mb-2">${msg("doLogIn")}</h4>
            </div>
        </div>
    <#elseif section = "form">
        <div id="kc-form" <#if realm.password && social.providers??>class="${properties.kcContentWrapperClass!}"</#if>>
            <div id="kc-form-wrapper"
                 <#if realm.password && social.providers??>class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}"</#if>>
                <#if realm.password>
                    <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}"
                          method="post">
                        <div class="form-group ${properties.kcFormGroupClass!}">
                            <label for="username" class="text-bold-600 ${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>

                            <#if usernameEditDisabled??>
                                <input tabindex="1" id="username" class="form-control ${properties.kcInputClass!}" name="username"
                                       value="${(login.username!'')}" type="text" disabled/>
                            <#else>
                                <input tabindex="1" id="username" class="form-control ${properties.kcInputClass!}" name="username"
                                       value="${(login.username!'')}" type="text" autofocus autocomplete="off"/>
                            </#if>
                        </div>

                        <div class="form-group ${properties.kcFormGroupClass!}">
                            <label for="password" for="password" class="text-bold-600 ${properties.kcLabelClass!}">${msg("password")}</label>
                            <input tabindex="2" id="password" class="form-control ${properties.kcInputClass!}" name="password" type="password" autocomplete="off"/>
                        </div>
                        <div class="container ${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                            <div class="form-group row">
                                <div class="pull-left text-left col-6">
                                    <#if realm.rememberMe && !usernameEditDisabled??>
                                        <div class="checkbox checkbox-sm">
                                            <#if login.rememberMe??>
                                                <input class="form-check-input" tabindex="3" id="rememberMe"
                                                       name="rememberMe" type="checkbox" checked>
                                                <label class="checkboxsmall"
                                                       for="rememberMe"><small>${msg("rememberMe")}</small></label>

                                            <#else>
                                                <input class="form-check-input" tabindex="3" id="rememberMe"
                                                       name="rememberMe" type="checkbox">
                                                <label class="checkboxsmall"
                                                       for="rememberMe"><small>${msg("rememberMe")}</small></label>
                                            </#if>
                                        </div>
                                    </#if>
                                </div>

                                <div class="pull-right text-right col-6 ${properties.kcFormOptionsWrapperClass!}">
                                    <#if realm.resetPasswordAllowed>
                                        <a  tabindex="5" class="card-link text-info"
                                           href="${url.loginResetCredentialsUrl}"><small>${msg("doForgotPassword")}</small></a>
                                    </#if>
                                </div>
                            </div>
                        </div>
                        <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                            <input type="hidden" id="id-hidden-input" name="credentialId"
                                   <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                            <button
                                    class="btn btn-primary glow w-100 position-relative ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}"
                                    name="login" id="kc-login" type="submit">${msg("doLogIn")}<i id="icon-arrow"
                                                                                                 class="bx bx-right-arrow-alt"></i>
                            </button>
                        </div>

                    </form>
                </#if>
            </div>
            <#if realm.password && social.providers??>
                <div class="divider">
                    <div class="divider-text text-uppercase text-muted"><small>or login with
                            email</small>
                    </div>
                </div>
                <div class="container">
                    <div id="kc-social-providers"
                         class="row ${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}">
                        <#list social.providers as p>
                            <div class="col-12 col-sm-6 mt-1">
                                <a href="${p.loginUrl}" class="btn text-center btn-social btn-${p.alias} col-12">
                                    <i class="bx bxl-google font-medium-3"></i><span
                                            class="pl-50 text-center">${p.displayName}</span>
                                </a>
                            </div>

                        </#list>
                    </div>

                </div>


            </#if>
        </div>
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <br>
            <div class="text-center"><small class="mr-25">${msg("noAccount")}</small><a class="text-info"
                        href="${url.registrationUrl}"><small>${msg("doRegister")}</small></a></div>
        </#if>
    </#if>

</@layout.registrationLayout>
