{extends file="base/index"}

{block name="head_title" prepend}{translate key="title.dependencies"} - {/block}

{block name="taskbar_panels" append}
    {call taskbarPanelSearch url=$app.url.request method="GET" query=$query}
{/block}

{block name="content_title"}{translate key="title.system"}{/block}

{block name="content"}
    <div class="card-box">
        {include file="base/includes/system.tabs" active="dependencies"}

        <div class="tab-content">
            {foreach $dependencies as $interface => $interfaceDependencies}
                {if $urlClass}
            <h3><a href="{$urlClass}/{$interface|replace:'\\':'/'}">{$interface}</a></h3>
                {else}
            <h3>{$interface}</h3>
                {/if}
            <table class="table table-responsive table-striped">
                <thead>
                    <tr>
                        <th class="grid--bp-med__2">{translate key="label.id"}</th>
                        <th class="grid--bp-med__5">{translate key="label.class"}</th>
                        <th>{translate key="label.calls"}</th>
                    </tr>
                </thead>
                <tbody>
                {foreach $interfaceDependencies as $dependency}
                    <tr>
                        <td>{$dependency->getId()}</td>
                        <td>
                    {if $urlClass}
                            <a href="{$urlClass}/{$dependency->getClassName()|replace:'\\':'/'}">{$dependency->getClassName()}</a>
                    {else}
                            {$dependency->getClassName()}
                    {/if}
                        </td>
                        <td>
                    {assign var="arguments" value=$dependency->getConstructorArguments()}
                    {assign var="calls" value=$dependency->getCalls()}
                    {if $arguments || $calls}
                            <ul class="list-unstyled">
                        {if $arguments}
                                <li>
                            {if $urlClass}
                                    <a href="{$urlClass}/{$dependency->getClassName()|replace:'\\':'/'}#method__construct">
                                        <span class="method">__construct()</span>
                                    </a>
                            {else}
                                    <span class="method">__construct()</span>
                            {/if}
                                    <ul>
                            {foreach $arguments as $argument}
                                {assign var="properties" value=$argument->getProperties()}
                                        <li>${$argument->getName()} ({$argument->getType()})
                                {if $properties}
                                            <ul>
                                    {foreach $properties as $key => $value}
                                                <li>{$key}: {$value}</li>
                                    {/foreach}
                                            </ul>
                                {/if}
                                        </li>
                            {/foreach}
                                    </ul>
                                </li>
                        {/if}
                        {foreach $calls as $call}
                                <li>
                            {if $urlClass}
                                    <a href="{$urlClass}/{$dependency->getClassName()|replace:'\\':'/'}#method{$call->getMethodName()}">
                                        <span class="method">{$call->getMethodName()}()</span>
                                    </a>
                            {else}
                                    <span class="method">{$call->getMethodName()}()</span>
                            {/if}

                            {assign var="arguments" value=$call->getArguments()}
                            {if $arguments}
                                    <ul>
                                {foreach $arguments as $argument}
                                    {assign var="properties" value=$argument->getProperties()}
                                        <li>${$argument->getName()} ({$argument->getType()})
                                    {if $properties}
                                            <ul>
                                        {foreach $properties as $key => $value}
                                                {if !$value|is_array}
                                                    <li>{$key}: {$value}</li>
                                                {else}
                                                    <li>{$key}: Array</li>
                                                {/if}
                                                {* <li>{$key}: {$value}</li> *}
                                        {/foreach}
                                            </ul>
                                    {/if}
                                        </li>
                                {/foreach}
                                    </ul>
                            {/if}
                                </li>
                        {/foreach}
                            </ul>
                    {/if}
                        </td>
                    </tr>
                {/foreach}
                </tbody>
            </table>
            {/foreach}
        </div>
    </div>
{/block}
