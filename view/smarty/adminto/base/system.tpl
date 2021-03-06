{extends file="base/index"}

{block name="head_title" prepend}{translate key="title.system"} - {/block}

{block name="content_title"}{translate key="title.system"}{/block}

{block name="content"}
    <div class="card-box">
        <div class="tabbable">
            {include file="base/includes/system.tabs" active="system"}

            <div class="tab-content">
                <dl>
                    <dt>{translate key="label.php.version"}</dt>
                    <dd><a href="{url id="system.php"}">{$phpVersion}</a></dd>
                    <dt>{translate key="label.environment"}</dt>
                    <dd>{$environment}</dd>
                    <dt>{translate key="label.directory.public"}</dt>
                    <dd>{$publicDirectory}</dd>
                    <dt>{translate key="label.directory.application"}</dt>
                    <dd>{$applicationDirectory}</dd>
                    <dt>{translate key="label.directories.include"}</dt>
                    <dd>
                        <ul>
                        {foreach $includeDirectories as $directory}
                            <li>{$directory}</li>
                        {/foreach}
                        </ul>
                    </dd>
                </dl>
            </div>
        </div>
    </div>
{/block}
