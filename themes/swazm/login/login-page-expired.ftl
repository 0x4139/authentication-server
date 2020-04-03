<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        <div class="card-header pb-1">
            <div class="card-title">
                <h4 class="text-center mb-2">${msg("pageExpiredTitle")}</h4>
            </div>
        </div>
    <#elseif section = "form">

        <div class="text-left"><small class="mr-25">
                ${msg("pageExpiredMsg1")}
            </small>
            <a class="text-info" id="loginRestartLink" href="${url.loginAction}"><small>${msg("doClickHere")}
                </small>
            </a>
        </div>

        <div class="text-left"><small class="mr-25">
                ${msg("pageExpiredMsg2")}
            </small>
            <a class="text-info" id="loginContinueLink" href="${url.loginAction}"><small>${msg("doClickHere")}
                </small>
            </a>
        </div>

    </#if>
</@layout.registrationLayout>
