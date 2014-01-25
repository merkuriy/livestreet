{**
 * Категории блогов
 *
 * @styles css/blocks.css
 *}

{extends 'blocks/block.aside.base.tpl'}

{block 'block_title'}{$aLang.block_category_blog}{/block}
{block 'block_type'}blog-categories{/block}

{block 'block_header_end'}
	{if $oUserCurrent and $oUserCurrent->isAdministrator()}
		<a href="{router page="admin"}blogcategory/" title="{$aLang.admin_list_blogcategory}" class="icon-cog blog-categories-admin"></a>
	{/if}
{/block}

{block 'block_content'}
	{if $aBlogCategories}
		<ul class="nested-list">
			<li class="nested-list-item {if ! $oBlogCategoryCurrent}active{/if}">
				<a href="{router page='blogs'}">{$aLang.block_category_blog_all} ({$iCountBlogsAll})</a>
			</li>

			{foreach $aBlogCategories as $oCategory}
				<li class="nested-list-item {if $oBlogCategoryCurrent && $oBlogCategoryCurrent->getId() == $oCategory->getId()}active{/if}">
					<a style="margin-left: {$oCategory->getLevel() * 20}px;" href="{$oCategory->getUrlWeb()}">{$oCategory->getTitle()|escape} ({$oCategory->getCountBlogs()})</a>
				</li>
			{/foreach}
        </ul>
    {else}
    	{include 'alert.tpl' mAlerts=$aLang.blog.categories.empty sAlertStyle='empty'}
    {/if}
{/block}