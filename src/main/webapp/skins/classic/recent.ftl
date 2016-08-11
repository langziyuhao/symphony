<#include "macro-head.ftl">
<#include "macro-list.ftl">
<#include "macro-pagination.ftl">
<!DOCTYPE html>
<html>
    <head>
        <@head title="${symphonyLabel}">
        <meta name="description" content="${symDescriptionLabel}"/>
        </@head>
        <link type="text/css" rel="stylesheet" href="${staticServePath}/css/index${miniPostfix}.css?${staticResourceVersion}" />
    </head>
    <body>
        <#include "header.ftl">
        <div class="tabs fn-clear">
            <div class="wrapper fn-clear">
                <#list domains as domain>
                <a href="${servePath}/domain/${domain.domainURI}">${domain.domainIconPath}&nbsp;${domain.domainTitle}</a>
                </#list>
                <a href="${servePath}/recent" class="selected">
                    <svg height="16" viewBox="0 0 14 16" width="14">${timeIcon}</svg>&nbsp;${latestLabel}</a>
                <a href="${servePath}/hot">
                    <svg height="16" viewBox="0 0 12 16" width="12">${hotIcon}</svg>&nbsp;${hotLabel}</a>
                <#if isLoggedIn && "" != currentUser.userCity>
                <a href="${servePath}/city/my">
                    <svg height="16" viewBox="0 0 12 16" width="12">${localIcon}</svg>&nbsp;${currentUser.userCity}</a>
                </#if>
                <a href="${servePath}/timeline">
                    <svg height="14" viewBox="0 0 16 14" width="16">${timelineIcon}</svg>&nbsp;${timelineLabel}</a>
                <a href="${servePath}/community">
                    <svg height="16" viewBox="0 0 14 16" width="16">${noticeIcon}</svg>&nbsp;${communityGroupLabel}</a>
            </div>
        </div>
        <div class="main">
            <div class="wrapper">
                <div class="content fn-clear">
                    <@list listData=latestArticles/>
                    <@pagination url="${servePath}/recent"/>
                    <#if domains?size != 0>
                    <br/> <br/> <br/> <br/>

                    <div class="module">
                        <div class="module-header">
                            <h2>${domainLabel}${navigationLabel}</h2>
                            <a href="${servePath}/domains" class="ft-gray fn-right">All Domains</a>
                        </div>
                        <div class="module-panel">
                            <ul class="module-list domain">
                                <#list domains as domain>
                                <#if domain.domainTags?size gt 0>
                                <li>
                                    <a rel="nofollow" class="slogan" href="${servePath}/domain/${domain.domainURI}">${domain.domainTitle}</a>
                                    <div class="title">
                                        <#list domain.domainTags as tag>
                                        <a class="tag" rel="nofollow" href="${servePath}/tag/${tag.tagTitle?url('utf-8')}">${tag.tagTitle}</a>
                                        </#list>
                                    </div>
                                </li>
                                </#if>
                                </#list>
                            </ul>
                        </div>
                    </div>
                    </#if>
                </div>

                <div class="side">
                    <#include "side.ftl">
                </div>
            </div>
        </div>
        <#include "footer.ftl">
        <@listScript/>
    </body>
</html>
