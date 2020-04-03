<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        <div class="card-header pb-1">
            <div class="card-title">
                <h4 class="text-center mb-2">${msg("registerTitle")}</h4>
            </div>
        </div>
    <#elseif section = "form">
        <form id="kc-register-form" class="${properties.kcFormClass!}" action="${url.registrationAction}" method="post">
            <div class="form-row">

                <div class="form-group col-md-6 mb-50 ${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('firstName',properties.kcFormGroupErrorClass!)}">
                    <label for="firstName" class="text-bold-600 ${properties.kcLabelClass!}">${msg("firstName")}</label>
                    <input type="text" id="firstName" class="form-control ${properties.kcInputClass!}" name="firstName"
                           value="${(register.formData.firstName!'')}"/>
                </div>

                <div class="form-group col-md-6 mb-50 ${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('lastName',properties.kcFormGroupErrorClass!)}">
                    <label for="lastName" class="text-bold-600 ${properties.kcLabelClass!}">${msg("lastName")}</label>
                    <input type="text" id="lastName" class="form-control ${properties.kcInputClass!}" name="lastName"
                           value="${(register.formData.lastName!'')}"/>
                </div>

            </div>

            <div class="form-group ${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">
                <label for="email" class="text-bold-600 ${properties.kcLabelClass!}">${msg("email")}</label>
                <input type="text" id="email" class="form-control ${properties.kcInputClass!}" name="email"
                       value="${(register.formData.email!'')}" autocomplete="email"/>
            </div>

            <#if !realm.registrationEmailAsUsername>
                <div class="form-group ${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('username',properties.kcFormGroupErrorClass!)}">
                    <label for="username" class="text-bold-600 ${properties.kcLabelClass!}">${msg("username")}</label>
                    <input type="text" id="username" class="form-control ${properties.kcInputClass!}" name="username"
                           value="${(register.formData.username!'')}" autocomplete="username"/>
                </div>
            </#if>

            <div class="form-row">
                <#if passwordRequired??>
                    <div class="form-group col-md-6 mb-50  ${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password',properties.kcFormGroupErrorClass!)}">
                        <label for="password"
                               class="text-bold-600 ${properties.kcLabelClass!}">${msg("password")}</label>
                        <input type="password" id="password" class="form-control ${properties.kcInputClass!}"
                               name="password" autocomplete="new-password"/>
                    </div>

                    <div class="form-group col-md-6 mb-50  ${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password-confirm',properties.kcFormGroupErrorClass!)}">
                        <label for="password-confirm"
                               class="text-bold-600 ${properties.kcLabelClass!}">${msg("passwordConfirm")}</label>
                        <input type="password" id="password-confirm" class="form-control ${properties.kcInputClass!}"
                               name="password-confirm"/>
                    </div>
                </#if>
            </div>

            <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                <button class="btn btn-primary glow w-100 position-relative ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}"
                        type="submit">${msg("doRegister")}<i id="icon-arrow" class="bx bx-right-arrow-alt"></i></button>
            </div>
            <hr>
            <#if recaptchaRequired??>
                <div class="form-group">
                    <div class="${properties.kcInputWrapperClass!}">
                        <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                    </div>
                </div>
            </#if>
            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div class="text-center"><small class="mr-25"></small><a class="text-info" href="${url.loginUrl}"><small>${kcSanitize(msg("backToLogin"))?no_esc}</small></a></div>
                </div>

            </div>
        </form>
    </#if>
</@layout.registrationLayout>
