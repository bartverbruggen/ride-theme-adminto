{extends file="base/index"}

{block name="content"}
    <h4 class="page-title">Preferences</h4>
    <div class="card-box">
        {include file="base/helpers/form.prototype"}

        <form id="{$form->getId()}" class="form-horizontal" action="{$app.url.request}" method="POST" role="form">

            {call formRows form=$form horizontal=true}

            <div class="form-group">
                <div class="col-lg-offset-2 col-lg-10">
                    <input type="submit" class="btn btn-primary btn-bordred" value="{translate key="button.save"}" />
                </div>
            </div>

        </form>
    </div>
{/block}
