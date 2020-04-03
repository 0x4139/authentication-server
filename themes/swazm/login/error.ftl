<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        <div class="card-header pb-1">
            <div class="card-title">
                <h4 class="text-center mb-2">
                    ${msg("errorTitle")}
                </h4>
            </div>
        </div>
    <#elseif section = "form">
        <div class="text-center"><small class="mr-25">${message.summary?no_esc}</small><a class="text-info"
                                                                                          href="${client.baseUrl}"><small>${kcSanitize(msg("backToApplication"))?no_esc}</small></a></div>
    </#if>
</@layout.registrationLayout>