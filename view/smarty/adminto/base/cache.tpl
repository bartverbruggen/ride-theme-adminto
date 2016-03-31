{extends file="base/index"}

{block name="head_title" prepend}{translate key="title.system"} - {/block}

{block name="content_title"}{translate key="title.system"}{/block}

{block name="content"}
    <div class="card-box">
        {include file="base/includes/system.tabs" active="cache"}
        {include file="base/helpers/form.prototype"}

        <div class="tab-content">
            <form id="{$form->getId()}" class="form-horizontal" action="{$app.url.request}" method="POST">
                <fieldset>
                    <div class="form-group">
                        <div class="col-lg-12">
                            {foreach $controls as $name => $control}
                                {call formWidget form=$form row=$name}
                            {/foreach}
                        </div>
                    </div>

                    <div class="form-actions">
                        <input type="submit" name="submit" class="btn btn-primary" value="{"label.`$action`"|translate}" />
                        {if $action == "enable"}
                            <a href="{url id="system.cache.clear"}" class="btn btn-default">{translate key="button.cache.clear"}</a>
                        {else}
                            <a href="{url id="system.cache"}" class="btn btn-link">{translate key="button.cancel"}</a>
                        {/if}
                    </div>
                </fieldset>
            </form>
        </div>
    </div>

{/block}
