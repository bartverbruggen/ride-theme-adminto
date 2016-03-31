{extends 'base/index'}

{block name="content_title"}{'title.user.switch'|translate}{/block}

{block name="content"}
    {include file="base/helpers/form.prototype"}

    <div class="card-box">
        <p>{"label.user.switch.description"|translate}</p>

        <form id="{$form->getId()}" class="form form-horizontal" action="{$app.url.request}" method="POST" role="form">
            <div class="form__group">
                <div class="grid">
                    <div class="grid__12 grid--bp-sml__8">
                        {call formRows form=$form}
                    </div>
                </div>

                {call formActions referer=$referer submit="button.switch"}
            </div>
        </form>
    </div>
{/block}

{block name="scripts" append}
    {$script = 'js/form.js'}
    {if !isset($app.javascripts[$script])}
        <script src="{$app.url.base}/asphalt/js/form.js"></script>
    {/if}
{/block}
