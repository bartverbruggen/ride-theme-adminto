{extends file="base/index"}

{block name="head_title" prepend}{translate key="title.system"} - {/block}

{block name="taskbar_panels" append}
    {call taskbarPanelSearch url=$app.url.request method="GET" query=$query}
{/block}

{block name="content_title"}{translate key="title.system"}{/block}

{block name="content"}
    <div class="card-box">
        {include file="base/includes/system.tabs" active="routes"}

        <div class="tab-content">
            <table class="table table-responsive table-striped">
                <thead>
                    <tr>
                        <th>{translate key="label.path"}</th>
                        <th>{translate key="label.id"}</th>
                        <th>{translate key="label.methods"}</th>
                    </tr>
                </thead>
                <tbody>
            {foreach from=$routes item="route"}
                {$callback = $route->getCallback()}
                {$methods = $route->getAllowedMethods()}
                {$baseUrl = $route->getBaseUrl()}
                    <tr>
                        <td>
                            <a href="{if $baseUrl}{$baseUrl}{else}{$app.url.script}{/if}{$route->getPath()}">{$route->getPath()}</a>
                            {if $baseUrl}
                                <br />
                                <span class="help-block">{$baseUrl}</span>
                            {/if}
                            <br />
                            <span class="help-block">{$callback[0]}->{$callback[1]}()</span>
                        </td>
                        <td>{$route->getId()}</td>
                        <td>{if $methods}{$methods|@array_keys|@implode:', '}{else}*{/if}</td>
                    </tr>
            {/foreach}
                </tbody>
            </table>
        </div>
    </div>
{/block}
