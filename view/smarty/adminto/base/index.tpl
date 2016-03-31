<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>{block name="head_title"}{if isset($app.taskbar)}{$app.taskbar->getTitle()}{/if}{/block}</title>

        {style src="https://fonts.googleapis.com/css?family=Leckerli+One"}
        {style src="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css"}
        {style src="adminto/css/bootstrap.min.css" media="screen"}
        {style src="adminto/css/core.css" media="screen"}
        {style src="adminto/css/components.css" media="screen"}
        {style src="adminto/css/icons.css" media="screen"}
        {style src="adminto/css/pages.css" media="screen"}
        {style src="adminto/css/menu.css" media="screen"}
        {style src="adminto/css/responsive.css" media="screen"}

        {block name="styles_app"}
            {if isset($app.styles)}
                {foreach $app.styles as $style => $dummy}
                    {if substr($style, 0, 7) == 'http://' || substr(style, 0, 8) == 'https://' || substr($style, 0, 2) == '//'}
                        {style src=$style media="screen"}
                    {else}
                        {style src="adminto/`$style`" media="screen"}
                    {/if}
                {/foreach}
            {/if}
        {/block}

        {styles}
    </head>

    <body data-translation-url="{url id="api.locales.translations.exposed" parameters=["locale" => $app.locale]}" {block name="body_attributes"}{/block}>
        {block name="taskbar"}
            {if isset($app.taskbar)}
                {include file="base/includes/taskbar" title=$app.taskbar->getTitle() applicationsMenu=$app.taskbar->getApplicationsMenu() settingsMenu=$app.taskbar->getSettingsMenu()}
            {/if}
        {/block}

        {block name="main"}
        <div class="wrapper">
            <div class="container">
                {capture assign="contentTitle"}{block "content_title"}{/block}{/capture}
                {if $contentTitle}
                   <div class="page-header">
                      <h1>{$contentTitle}</h1>
                   </div>
                {/if}

                {block name="messages"}
                    {if isset($app.messages)}
                        {$_messageTypes = ["error" => "danger", "warning" => "warning", "success" => "success", "information" => "info"]}
                        {foreach $_messageTypes as $_messageType => $_messageClass}
                            {$_messages = $app.messages->getByType($_messageType)}
                            {if $_messages}
                                <div class="alert alert-{$_messageClass}">
                                {if $_messages|count == 1}
                                    {$_message = $_messages|array_pop}
                                    <p>{$_message->getMessage()}</p>
                                {else}
                                    <ul>
                                    {foreach $_messages as $_message}
                                        <li>{$_message->getMessage()}</li>
                                    {/foreach}
                                    </ul>
                                {/if}
                                </div>
                            {/if}
                        {/foreach}
                    {/if}
                {/block}
                {block name="content"}
                {/block}
            </div>
        </div>
        {/block}

        {block name="scripts"}
            {script src="adminto/js/jquery.min.js"}
            {script src="adminto/js/bootstrap.min.js"}
            {script src="adminto/js/detect.js"}
            {script src="adminto/js/fastclick.js"}
            {script src="adminto/js/jquery.slimscroll.js"}
            {script src="adminto/js/jquery.blockUI.js"}
            {script src="adminto/js/waves.js"}
            {script src="adminto/js/wow.min.js"}
            {script src="adminto/js/jquery.nicescroll.js"}
            {script src="adminto/js/jquery.scrollTo.min.js"}
        {/block}

        {block name="scripts_app"}
        {if isset($app.javascripts)}
            {foreach $app.javascripts as $script => $dummy}
                {if substr($script, 0, 7) == 'http://' || substr(script, 0, 8) == 'https://' || substr($script, 0, 2) == '//' || substr($script, 0, 7) == '<script'}
                    {script src=$script}
                {else}
                    {script src="adminto/`$script`"}
                {/if}
            {/foreach}
        {/if}
        {/block}

        {scripts}

        {block name="scripts_inline"}
        {if isset($app.inlineJavascripts)}
            <script type="text/javascript">
                $(function() {
                {foreach $app.inlineJavascripts as $inlineJavascript}
                    {$inlineJavascript}
                {/foreach}
                });
            </script>
        {/if}
        {/block}

    </body>
</html>
