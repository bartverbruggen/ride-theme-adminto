{extends file="base/index"}

{block name="head_title" prepend}{translate key="title.security"} - {/block}

{block name="content_title"}{translate key="title.security"}{/block}

{block name="content" append}
    {include file="base/helpers/form.prototype"}

    <div class="card-box">

        <form id="{$form->getId()}" class="form-horizontal" action="{$app.url.request}" method="POST" role="form">
            <div class="tabbable">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#tabpaths" data-toggle="tab">{translate key="label.paths"}</a>
                    </li>
                    {if $permissions && $roles}
                    <li>
                        <a href="#tabpermissions" data-toggle="tab">{translate key="label.permissions"}</a>
                    </li>
                    {/if}
                </ul>
                <div class="tab-content">
                    <div id="tabpaths" class="tab-pane active">
                        <h3>{$form->getRow('secured-paths')->getLabel()}</h3>
                        <p>{translate key="label.path.security.description"}</p>
                        <div class="form-group">
                            <div class="col-lg-12">
                                {call formWidget form=$form row="secured-paths"}
                            </div>
                        </div>

                        {if $form->hasRow('allowed-paths')}
                            <h3>{$form->getRow('allowed-paths')->getLabel()}</h3>
                            <ul>
                            {foreach $roles as $role}
                                <li class="role role-{$role->getId()}">
                                    <a href="#">{$role->getName()}</a>
                                    <div class="form-group">
                                        <div class="col-lg-12">
                                            {call formWidget form=$form row="allowed-paths" part=$role->getId()}
                                        </div>
                                    </div>
                                </li>
                            {/foreach}
                            </ul>
                        {/if}
                    </div>
                    {if $permissions && $roles}
                        <div id="tabpermissions" class="tab-pane">
                            <p>{translate key="label.permissions.description"}</p>
                            <table class="table">
                                <tr>
                                    <th></th>
                            {foreach $roles as $role}
                                    <th>{$role->getName()}</th>
                            {/foreach}
                                </tr>
                            {foreach $permissions as $permission}
                                <tr>
                                    <th>{translate key="permission.`$permission`"}<br/><small>{$permission}</small></th>
                                    {foreach $roles as $role}
                                        <td>{call formWidget form=$form row="role_`$role->getId()`" part=$permission->getCode()}</td>
                                    {/foreach}
                                </tr>
                            {/foreach}
                            </table>
                        </div>
                    {/if}
                    <div class="form-group">
                        <div class="col-lg-12">
                            <input type="submit" class="btn btn-primary" value="{translate key="button.save"}" />
                        </div>
                    </div>
                </div>
            </div>

        </form>
    </div>
{/block}

{block name="scripts" append}
    {script src="bootstrap/js/security.js"}
{/block}
