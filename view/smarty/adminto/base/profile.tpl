{extends file="base/index"}

{block name="head_title" prepend}{translate key="title.profile"} - {/block}

{block name="content_title"}{translate key="title.profile"}{/block}

{block name="content" append}
    {include file="base/helpers/form.prototype"}

    <div class="card-box">
        <form id="{$form->getId()}" class="form-horizontal" action="{$app.url.request}" method="POST" enctype="multipart/form-data" role="form">
            <fieldset>
                <div class="tabbable">
                <ul class="nav nav-tabs">
                {foreach $hooks as $hookName => $hook}
                    <li{if $activeHook == $hookName} class="active"{/if}><a href="#hook-{$hookName}" data-toggle="tab">{translate key="profile.hook.`$hookName`"}</a></li>
                {/foreach}
                {if $form->hasRow('submit-unregister')}
                    <li><a href="#hook-unregister" data-toggle="tab">{translate key="button.unregister"}</a></li>
                {/if}
                </ul>

                <div class="tab-content">
                {foreach $hooks as $hookName => $hook}
                    <div id="hook-{$hookName}" class="tab-pane{if $activeHook == $hookName} active{/if}">
                        {$hookViews.$hookName}
                    </div>
                {/foreach}
                {if $form->hasRow('submit-unregister')}
                    <div id="hook-unregister" class="tab-pane{if $activeHook == 'unregister'} active{/if}">
                        <p>{translate key="label.unregister"}</p>

                        {call formRow form=$form row="submit-unregister"}
                    </div>
                {/if}
                </div>
            </fieldset>
        </form>
    </div>
{/block}

{block name="scripts" append}
    {script src="bootstrap/js/jquery-ui.js"}
    {script src="bootstrap/js/form.js"}
{/block}
