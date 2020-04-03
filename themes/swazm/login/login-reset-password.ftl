<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "header">
        <div class="card-header pb-1">
            <div class="card-title">
                <h4 class="text-center mb-2">${msg("emailForgotTitle")}</h4>
            </div>
        </div>
    <#elseif section = "form">
        <form id="kc-reset-password-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <div class="form-group ${properties.kcFormGroupClass!}">
                    <label for="username"
                           class="text-bold-600 ${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
                <#if auth?has_content && auth.showUsername()>
                    <input type="text" id="username" name="username" class="form-control ${properties.kcInputClass!}"
                           autofocus value="${auth.attemptedUsername}"/>
                <#else>
                    <input type="text" id="username" name="username" class="form-control ${properties.kcInputClass!}"
                           autofocus/>
                </#if>
            </div>
            <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <button class="btn btn-primary glow w-100 position-relative ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit">${msg("doSubmit")}
                        <i id="icon-arrow" class="bx bx-right-arrow-alt"></i>
                    </button>
                </div>
            </div>
        </form>
        <hr>
    <#elseif section = "info" >
        <div class="text-center"><small class="mr-25">${msg("emailInstruction")}</small></div>
        <br>
        <div class="text-center"><small class="mr-25"></small><a class="text-info"
                                                                                    href="${url.loginUrl}"><small>${kcSanitize(msg("backToLogin"))?no_esc}</small></a></div>
    </#if>
</@layout.registrationLayout>
