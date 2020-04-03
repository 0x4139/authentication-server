<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        <div class="card-header pb-1">
            <div class="card-title">
                <h4 class="text-center mb-2">
                    <#if messageHeader??>
                        ${messageHeader}
                    <#else>
                        ${message.summary}
                    </#if>
                </h4>
            </div>
        </div>

    <#elseif section = "form">
        <div id="kc-info-message">
            <p class="instruction">${message.summary}<#if requiredActions??><#list requiredActions>:
                    <b><#items as reqActionItem>${msg("requiredAction.${reqActionItem}")}<#sep>, </#items></b></#list><#else></#if>
            </p>
            <hr>
            <br>
            <div class="text-center">
                <div class="text-center"><small class="mr-25">${msg("noAccount")}</small><a class="text-info"
                                                                                            href="${url.registrationUrl}"><small>${msg("doRegister")}</small></a></div>
                <#if skipLink??>
                <#else>
                    <#if pageRedirectUri?has_content>
                        <p><a href="${pageRedirectUri}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
                    <#elseif actionUri?has_content>
                        <p><a href="${actionUri}">${kcSanitize(msg("proceedWithAction"))?no_esc}</a></p>
                    <#elseif (client.baseUrl)?has_content>
                        <p><a href="${client.baseUrl}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
                    </#if>
                </#if>


            </div>


        </div>
    </#if>
</@layout.registrationLayout>