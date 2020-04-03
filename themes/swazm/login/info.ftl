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
                <div class="text-center">
                    <#if skipLink??>
                    <#else>
                        <#if pageRedirectUri?has_content>

                            <p>
                                <a class="text-info"
                                   href="${url.pageRedirectUri}"><small>${kcSanitize(msg("backToApplication"))?no_esc}</small></a>
                            </p>
                        <#elseif actionUri?has_content>
                            <p>
                                <a class="text-info"
                                   href="${url.actionUri}"><small>${kcSanitize(msg("proceedWithAction"))?no_esc}</small></a>
                            </p>
                        <#elseif (client.baseUrl)?has_content>
                            <p>
                                <a class="text-info"
                                  href="${url.baseUrl}"><small>${kcSanitize(msg("backToApplication"))?no_esc}</small></a>
                            </p>
                        </#if>
                    </#if>
                </div>

            </div>


        </div>
    </#if>
</@layout.registrationLayout>