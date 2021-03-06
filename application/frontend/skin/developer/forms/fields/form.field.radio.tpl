{**
 * 
 *}

{extends file='forms/fields/form.field.base.tpl'}

{block name='field_before'}
	{$bFieldNoLabel = true}
{/block}

{block name='field_holder' prepend}
	{if $sFieldLabel}<label>{/if}
	<input type="radio"
		   id="{if $sFieldId}{$sFieldId}{else}{$sFieldName}{/if}"
		   name="{$sFieldName}"
		   value="{if $sFieldValue}{$sFieldValue}{else}1{/if}"
		   {if $bFieldIsDisabled}disabled{/if}
		   {$sFieldInputAttributes}
		   {if $sFieldInputClasses}class="{$sFieldInputClasses}"{/if}
		   {if $bFieldChecked}checked{else}{if $_aRequest[$sFieldName] == 1}checked{/if}{/if} />
	{if $sFieldLabel}{$sFieldLabel}</label>{/if}
{/block}