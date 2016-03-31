{extends file="base/index"}

{block name="head_title" prepend}{translate key="title.parameters"} - {/block}

{block name="taskbar_panels" append}
    {call taskbarPanelSearch url=$app.url.request method="GET" query=$query}
{/block}

{block name="content_title"}{translate key="title.system"}{/block}

{block name="content" append}
    <div class="card-box">
        {include file="base/includes/system.tabs" active="parameters"}
        {include file="base/helpers/form.prototype"}

        <div class="tab-content">
            <form id="{$form->getId()}" class="form-horizontal" action="{$app.url.request}" method="POST" role="form">
                <fieldset>
                    {call formRows form=$form}

                    <div class="form-group">
                        <div class="col-lg-offset-2 col-lg-10">
                            <input type="submit" class="btn btn-primary" value="{translate key="button.submit"}" />
                            <a class="btn" href="{url id="system.parameters"}">{translate key="button.cancel"}</a>
                        </div>
                    </div>
                </fieldset>
            </form>

            <table class="table table-responsive table-striped">
                <thead>
                    <tr>
                        <th>{translate key="label.parameter"}</th>
                        <th>{translate key="label.value"}</th>
                    </tr>
                </thead>
                <tbody>
            {foreach $parameters as $key => $value}
                    <tr>
                        <td><a href="{url id="system.parameters.edit" parameters=["key" => $key]}">{$key}</a></td>
                        <td>{$value|escape}</td>
                    </tr>
            {/foreach}
                </tbody>
            </table>
        </div>
    </div>
{/block}
