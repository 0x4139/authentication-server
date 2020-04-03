<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "header">
        <div class="card-header pb-1">
            <div class="card-title">
                <h4 class="text-center mb-2">${msg("updatePasswordTitle")}</h4>
            </div>
        </div>
    <#elseif section = "form">
        <form id="kc-passwd-update-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <input type="text" id="username" name="username" value="${username}" autocomplete="username" readonly="readonly" style="display:none;"/>
            <input type="password" id="password" name="password" autocomplete="current-password" style="display:none;"/>

            <div class="form-group ${properties.kcFormGroupClass!}">
                    <label for="password-new" class="text-bold-600 ${properties.kcLabelClass!}">${msg("passwordNew")}</label>
                    <input type="password" id="password-new" name="password-new" class="form-control ${properties.kcInputClass!}" autofocus autocomplete="new-password" />
            </div>

            <div class="form-group ${properties.kcFormGroupClass!}">
                    <label for="password-confirm" class="text-bold-600 ${properties.kcLabelClass!}">${msg("passwordConfirm")}</label>
                    <input type="password" id="password-confirm" name="password-confirm" class="form-control ${properties.kcInputClass!}" autocomplete="new-password" />
            </div>

            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <#if isAppInitiatedAction??>
                    <button class="btn btn-primary glow w-100 position-relative ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit">${msg("doSubmit")}
                        <i id="icon-arrow" class="bx bx-right-arrow-alt"></i>
                        <button class="btn btn-danger glow w-100 position-relative ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit">${msg("doCancel")}
                            <i id="icon-arrow" class="bx bx-right-arrow-alt"></i>
                    <#else>
                            <button class="btn btn-primary glow w-100 position-relative ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit">${msg("doSubmit")}
                                <i id="icon-arrow" class="bx bx-right-arrow-alt"></i>
                    </#if>
                </div>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>
