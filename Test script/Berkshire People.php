<?php
/*
Purpose - retreive all people in Berkshire(county)
*/

$filter_array = array(

'_ff[]' => 'main_location[county_province_state]',  //form field where the value is held 
'_ft[]' => 'eg',  // comparison operator
'_fc[]' => 'Berkshire',  // value we are looking for 
'_select_columns[]' => array(   //creating the list of items we would like to return
'name', //field 1 we want to return
'id',)  // field 2 we want to return 
);

$response = $workbooks->assertGet('crm/people', $filter_array); //caputring the response 
?>