{function name="taskbarMenuItems" items=null class=null}
    {$_taskbarIcons = ["content-menu" => "collection-text", "sites-menu" => "collection-item", "themes-menu" => "invert-colors"]}

    {foreach from=$items item="item"}
        {if $item === '-'}
            <li role="presentation" class="divider"></li>
        {elseif is_string($item)}
            <li role="presentation" class="dropdown-header">{$item}</li>
        {elseif !method_exists($item, 'hasItems')}
            <li><a href="{$item->getUrl()}">{$item->getLabel()}</a></li>
        {elseif $class}
            <li class="{$class}">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <i class="zmdi zmdi-{$_taskbarIcons[$item->__toString()|replace:'.':'-']}"></i>
                    {$item->getLabel()}
                    {* <i class="icon icon--angle-down"></i> *}
                </a>
                <ul class="dropdown-menu">
                {call taskbarMenuItems items=$item->getItems() class="dropdown-submenu"}
                </ul>
            </li>
        {else}
            <li role="presentation" class="dropdown-header">{$item->getLabel()}</li>
            {call taskbarMenuItems items=$item->getItems()}
        {/if}
    {/foreach}
{/function}

{function name="taskbarPanelSearch" url=null method=null query=null}
    {if !$method}
        {$method = "POST"}
    {/if}
    <li>
        <form action="{$url}" role="search" class="navbar-left app-search pull-left hidden-xs" method="{$method}">
             <input type="text" name="query" placeholder="{translate key="label.search"}" class="form-control" value="{$query|escape}">
             <a href=""><i class="zmdi zmdi-search"></i></a>
        </form>
    </li>
{/function}

{function name="taskbarPanelLocales" url=null locale=null locales=null}
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            {if strpos($locale, '_')}
                {$localeTokens = explode('_', $locale|upper)}
                {$localeTokens[0]} ({$localeTokens[1]})
            {else}
                {$locale|upper}
            {/if}
            <i class="icon icon--angle-down"></i>
        </a>
        <ul class="dropdown-menu">
        {foreach $locales as $code => $locale}
            <li>
                <a href="{$url|replace:"%25locale%25":$code}">
                    {translate key="language.`$code`"}
                </a>
            </li>
        {/foreach}
        </ul>
    </li>
{/function}


<header id="topnav">
    <div class="topbar-main">
        <div class="container">
            {* Logo *}
            <div class="topbar-left">
                {block name="taskbar_title"}<a class="logo" href="{$app.url.base}">Ride <small>{$title}</small></a>{/block}
            </div>

            <div class="topbar-right menu-extras">
                <ul class="nav navbar-nav navbar-right pull-right">
                    {block name="taskbar_panels"}{/block}

                    {block name="taskbar_menu"}
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle waves-effect waves-light profile " data-toggle="dropdown" aria-expanded="true">
                                {if $app.user}
                                    {if $app.user->getImage()}
                                       <img src="{image src=$app.user->getImage() transformation="crop" width=18 height=18}" class="img-circle user-img" />
                                    {/if}
                                    {$app.user->getDisplayName()}
                                {else}
                                    {translate key="label.user.anonymous"}
                                {/if}
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                {block name="taskbar_settings"}
                                    {if $settingsMenu->hasItems()}
                                        {call taskbarMenuItems items=$settingsMenu->getItems()}
                                    {/if}
                                {/block}
                            </ul>
                        </li>
                    {/block}
                </ul>
                <div class="menu-item">
                    <!-- Mobile menu toggle-->
                    <a class="navbar-toggle">
                        <div class="lines">
                            <span></span>
                            <span></span>
                            <span></span>
                        </div>
                    </a>
                    <!-- End mobile menu toggle-->
                </div>
            </div>
        </div>
    </div>
    <div class="navbar-custom">
        <div class="container">
            <div id="navigation">
                <ul class="nav navbar-nav navigation-menu">
                {block name="taskbar_applications"}
                    {if $applicationsMenu->hasItems()}
                        {call taskbarMenuItems items=$applicationsMenu->getItems() class="dropdown"}
                    {/if}
                {/block}
                </ul>
            </div>
        </div>
    </div>
</header>
