<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Adminto - Responsive Admin Dashboard Template</title>

        {style src="adminto/css/bootstrap.min.css" media="screen"}
        {style src="adminto/css/core.css" media="screen"}
        {style src="adminto/css/components.css" media="screen"}
        {style src="adminto/css/icons.css" media="screen"}
        {style src="adminto/css/pages.css" media="screen"}
        {style src="adminto/css/menu.css" media="screen"}
        {style src="adminto/css/responsive.css" media="screen"}

        {styles}
    </head>

    <body>
        {block name="taskbar"}
            {if isset($app.taskbar)}
                {include file="base/includes/taskbar" title=$app.taskbar->getTitle() applicationsMenu=$app.taskbar->getApplicationsMenu() settingsMenu=$app.taskbar->getSettingsMenu()}
            {/if}
        {/block}

        <div class="wrapper">
            <div class="container">
                {block name="content"}
                {/block}
            </div>

        </div>
    </body>
</html>
