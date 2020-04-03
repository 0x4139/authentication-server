<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        <div class="card-header pb-1">
            <div class="card-title">
                <h4 class="text-center mb-2">${msg("emailVerifyTitle")}</h4>
            </div>
        </div>
    <#elseif section = "form">
        <div class="text-center"><small class="mr-25">${msg("emailVerifyInstruction1")}</small></div>
        <hr>
        <p class="instruction">

        <div class="text-center"><small class="mr-25">${msg("emailVerifyInstruction2")}</small><a class="text-info"
                                                                                    href="${url.loginAction}"><small>${msg("doClickHere")} ${msg("emailVerifyInstruction3")}</small></a></div>

        </p>
    </#if>
</@layout.registrationLayout>