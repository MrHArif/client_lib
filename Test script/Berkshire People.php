<?php

$filter_array = array(

'_ff[]' => 'main_location[county_province_state]',
'_ft[]' => 'eg',
'_fc[]' => 'Berkshire',
'_select_columns[]' => array(
'name', 
'id',)
);

$response = $workbooks->assertGet('crm/people', $filter_array);
?>