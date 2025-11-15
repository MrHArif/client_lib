/*
Purpose - create all related records and docuemnts for a Service Incident
Author - Haider Arif
Date - Nov 2025
*/

<?php

//find the service incident record
$SiCase_array = array(
    '_limit' => 100,
    '_sort' => 'updated_at',
    '_dir' => 'DESC',
    '_ff[]' => 'cf_case_parent_si_case',
    '_ft[]' => 'eg',
    '_fc[]' => 'TRUE',
    '_select_columns[]' => array()
);

$response = $workbooks->assertGet('crm/cases',$SiCase_array);
$workbooks->log('Service Incident Case Search', $response);
$SiCase_record = $response['data'][0]['object_ref']; 
$workbooks->log('Service Incident CASE reference', $SiCase_record);

//This should point to relavent resources to review for SI creation
$workbooks->desktopMessage('Website?',
     '<a href ="https://automation.workbooks.com/metadata/types.html"target="_blank">Workbooks API Reference</a></br>
     <a href ="https://github.com/workbooks/client_lib"target="_blank">Workbooks GitHub</a></br>
     <a href ="https://www.workbooks.com/our-knowledge-base/scripts/"target="_blank">Scripts in Workbooks</a>'
    );

?>