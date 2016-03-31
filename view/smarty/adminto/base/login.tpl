{extends file="base/index"}

{block name="head_title" prepend}{translate key="title.login"} - {/block}

{block name="taskbar"}{/block}

{block name="main"}
    <div class="wrapper-page">
        <div class="text-center">
            <a href="index.html" class="logo">Ride</a>
        </div>
        <div class="m-t-40 card-box">
            <div class="text-center">
                <h4 class="text-uppercase font-bold m-b-0">Sign In</h4>
            </div>
            <div class="panel-body">
                {include file="base/helpers/form.prototype"}

                <form id="{$form->getId()}" class="form-horizontal" action="{url id="login"}{if $referer}?referer={$referer|urlencode}{/if}" method="POST" role="form">
                    <fieldset>
                        {$errors = $form->getValidationErrors('username')}
                        <div class="form-group{if $errors} has-error{/if}">
                            <div class="col-lg-12">
                                {call formWidget form=$form row="username"}
                                {call formWidgetErrors form=$form row="username"}
                            </div>
                        </div>

                        <div class="form-group{if $errors} has-error{/if}">
                            <div class="col-lg-12">
                                {call formWidget form=$form row="password"}
                                <a href="{url id="profile.password.request"}">{translate key="button.password.reset"}</a>
                            </div>
                        </div>

                        {call formRows form=$form}

                        <div class="form-group">
                            <div class="col-lg-12">
                                <input type="submit" class="btn btn-primary btn-bordred" value="{translate key="button.login"}" />
                                {if $referer}
                                    <a href="{$referer}" class="btn ">{translate key="button.cancel"}</a>
                                {/if}
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
        {if $urls}
        <ul class="list-unstyled">
            {foreach $urls as $service => $url}
            <li class="text-center"><a href="{$url}" class="btn btn-info btn-bordred">{translate key="button.login.`$service`"}</a></li>
            {/foreach}
        </ul>
        {/if}
    </div>
{/block}
