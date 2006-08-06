{* 
TestLink Open Source Project - http://testlink.sourceforge.net/ 
$Id: resultsMoreBuilds_query_form.tpl,v 1.29 2006/08/06 05:52:39 kevinlevy Exp $
@author Francisco Mancardi - fm - start solving BUGID 97/98
20051022 - scs - removed ' in component id values
20051121 - scs - added escaping of tpname
20051203 - scs - added missing apo in lang_get
20060805 - kl - converting to 1.7 - listing the builds is slightly different
*}
{include file="inc_head.tpl"}

<body>
<h1>{lang_get s='test_plan_header'} {$testPlanName|escape}</h1>
<div class="workBack">	
<form action="lib/results/resultsMoreBuilds_buildReport.php" method='get'>
	<INPUT TYPE="HIDDEN" NAME="projectid" VALUE="{$projectid}"/>
	<INPUT TYPE="HIDDEN" NAME="testPlanName" VALUE="{$testPlanName|escape}" />
	<table class="simple" style="width: 100%; text-align: center; margin-left: 0px;">
		<tr><th>{lang_get s='select_builds_header'}</th><th>{lang_get s='select_components_header'}</th></tr>
		<tr>
			<td>
		
				<select name='build[]' size=10 multiple>
					{foreach key=row item=buildid from=$arrBuilds}
						{* by default select all builds*}
						<option value="{$arrBuilds[$row].id}" selected>{$arrBuilds[$row].name}</option>
					{/foreach}				
				</select>
		
			</td>
			<td>
        	       	<select name='component[]' size=10 multiple>
					{* by default select all components *}
					{foreach key=row item=component_name from=$arrComponents}
						<option value="{$arrComponents[$row].id}" selected>{$arrComponents[$row].name}</option>
					{/foreach}			
				</select>	
			</td>
		</tr>
    <tr><th>{lang_get s='select_keyword_header'}</th><th>{lang_get s='select_owner_header'}</th></tr>
		<tr>
			<td>
				   	<select name='keyword[]' size=10 multiple>
						{* by default select all components *}
						{foreach key=keyword_id item=keyword_name from=$arrKeywords}
							<option value="{$keyword_id}" selected>{$arrKeywords[$keyword_id]}</option>
						{/foreach}			
					</select>	
			</td>
			<td>
				<select name='owner' size=5 >
					<option value="" selected>{lang_get s='do_not_query_by_owner'}</option>
					{foreach key=owner item=ownerid from=$arrOwners}
						{* by default the owner should be the current user *}
						<option value="{$ownerid|escape}">{$ownerid|escape}</option>
					{/foreach}				
				</select>
			</td>
		</tr>
    <tr></tr>
		<tr>

		</tr>
    <tr><th>{lang_get s='select_report_format_header'}</th><th>{lang_get s='select_last_result_header'} </th></tr>	
		<tr><td> 
			<select name='format' size=2>
				<option selected>{lang_get s='html_format'}</option>
				<option>{lang_get s='excel_format'}</option>
			</select>
		</td>
		<td> 
			<select name='lastStatus' size=5>
				<option selected>{lang_get s='last_status_any'}</option>
				<option>{lang_get s='last_status_passed'}</option>
				<option>{lang_get s='last_status_failed'}</option>
				<option>{lang_get s='last_status_blocked'}</option>
				<option>{lang_get s='last_status_not_run'}</option>
			</select>
		</td></tr>
	<tr>
		<td>
			<INPUT TYPE=submit VALUE='{lang_get s='submit_query'}'/>
		</td>
	</tr>
</table>
</form>
</div>

</body>
</html>
