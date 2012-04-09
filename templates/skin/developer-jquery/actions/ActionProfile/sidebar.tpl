<section class="block block-type-profile">
	<a href="{$oUserProfile->getUserWebPath()}">
		<img src="{$oUserProfile->getProfileFotoPath()}" alt="photo" class="profile-photo" id="foto-img" />
	</a>
	{if $sAction=='settings' and $oUserCurrent and $oUserCurrent->getId() == $oUserProfile->getId()}
		<p><a href="#" id="foto-upload" class="link-dotted">{if $oUserCurrent->getProfileFoto()}{$aLang.settings_profile_avatar_change}{else}{$aLang.settings_profile_avatar_upload}{/if}</a>&nbsp;&nbsp;&nbsp;
			<a href="#" id="foto-remove" class="link-dotted" onclick="return ls.user.removeFoto();" style="{if !$oUserCurrent->getProfileFoto()}display:none;{/if}">{$aLang.settings_profile_avatar_delete}</a></p>

		<div id="foto-resize" style="display:none;">
			<p><img src="" alt="" id="foto-resize-original-img"></p>
			<button class="button button-primary" onclick="return ls.user.resizeFoto();">{$aLang.settings_profile_avatar_resize_apply}</button>
			<button class="button" onclick="return ls.user.cancelFoto();">{$aLang.settings_profile_avatar_resize_cancel}</button>
		</div>
	{/if}
</section>



{if $oUserCurrent && $oUserCurrent->getId()!=$oUserProfile->getId()}
	<section class="block block-type-profile-actions">
		<div class="block-content">
			<ul class="profile-actions" id="profile_actions">
				{include file='actions/ActionProfile/friend_item.tpl' oUserFriend=$oUserProfile->getUserFriend()}
				<li><a href="{router page='talk'}add/?talk_users={$oUserProfile->getLogin()}">{$aLang.user_write_prvmsg}</a></li>						
			</ul>
		</div>
	</section>
{/if}	



{if $oUserCurrent && $oUserCurrent->getId() != $oUserProfile->getId()}
	<section class="block block-type-profile-note">
		{if $oUserNote}
			<script type="text/javascript">
				ls.usernote.sText = {json var = $oUserNote->getText()};
			</script>
		{/if}

		<div id="usernote-note" class="profile-note" {if !$oUserNote}style="display: none;"{/if}>
			<p id="usernote-note-text">
				{if $oUserNote}
					{$oUserNote->getText()}
				{/if}
			</p>
			
			<ul class="actions">
				<li><a href="#" onclick="return ls.usernote.showForm();" class="link-dotted">{$aLang.user_note_form_edit}</a></li>
				<li><a href="#" onclick="return ls.usernote.remove({$oUserProfile->getId()});" class="link-dotted">{$aLang.user_note_form_delete}</a></li>
			</ul>
		</div>
		
		<div id="usernote-form" style="display: none;">
			<p><textarea rows="4" cols="20" id="usernote-form-text" class="input-text input-width-full"></textarea></p>
			<button onclick="return ls.usernote.save({$oUserProfile->getId()});" class="button button-primary">{$aLang.user_note_form_save}</button>
			<button onclick="return ls.usernote.hideForm();" class="button">{$aLang.user_note_form_cancel}</button>
		</div>
		
		<a href="#" onclick="return ls.usernote.showForm();" id="usernote-button-add" class="link-dotted" {if $oUserNote}style="display:none;"{/if}>{$aLang.user_note_add}</a>
	</section>
{/if}



<section class="block block-type-profile-nav">
	<ul class="nav nav-profile">
		<li {if $sAction=='profile' && ($aParams[0]=='whois' or $aParams[0]=='')}class="active"{/if}><a href="{$oUserProfile->getUserWebPath()}">{$aLang.user_menu_profile_whois}</a></li>
		<li {if $sAction=='profile' && $aParams[0]=='wall'}class="active"{/if}><a href="{$oUserProfile->getUserWebPath()}wall/">{$aLang.user_menu_profile_wall}{if ($iCountWallUser)>0} ({$iCountWallUser}){/if}</a></li>
		<li {if $sAction=='profile' && $aParams[0]=='created'}class="active"{/if}><a href="{$oUserProfile->getUserWebPath()}created/topics/">{$aLang.user_menu_publication}{if ($iCountCreated)>0} ({$iCountCreated}){/if}</a></li>
		<li {if $sAction=='profile' && $aParams[0]=='favourites'}class="active"{/if}><a href="{$oUserProfile->getUserWebPath()}favourites/topics/">{$aLang.user_menu_profile_favourites}{if ($iCountFavourite)>0} ({$iCountFavourite}){/if}</a></li>
		<li {if $sAction=='profile' && $aParams[0]=='friends'}class="active"{/if}><a href="{$oUserProfile->getUserWebPath()}friends/">{$aLang.user_menu_profile_friends}{if ($iCountFriendsUser)>0} ({$iCountFriendsUser}){/if}</a></li>
		<li {if $sAction=='profile' && $aParams[0]=='stream'}class="active"{/if}><a href="{$oUserProfile->getUserWebPath()}stream/">{$aLang.user_menu_profile_stream}</a></li>
		
		{if $oUserCurrent and $oUserCurrent->getId() == $oUserProfile->getId()}
			<li {if $sAction=='talk'}class="active"{/if}><a href="{router page='talk'}">{$aLang.talk_menu_inbox}{if $iUserCurrentCountTalkNew} ({$iUserCurrentCountTalkNew}){/if}</a></li>
			<li {if $sAction=='settings'}class="active"{/if}><a href="{router page='settings'}">{$aLang.settings_menu}</a></li>
		{/if}
	</ul>
</section>
