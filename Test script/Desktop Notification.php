<?php

$user_id = $params['User ID'];
$workbooks->log('Notification will be created for User ID', $user_id, 'info');

$finding_online_activities = array(
    '_ff[]' => 'id',  
    '_ft[]' => 'eg',  
    '_fc[]' => '9',
    '_select_columns[]'    => array( 

    )
);
$response = $workbooks->assertGet('crm/online_activities', $finding_online_activities); //caputring the response 
$url = $response['object_url'];

$workbooks->log('Object URL found', $url, 'info');

//Change "Title" and 'Body' to your desired text
$workbooks->desktopMessage('Please see ', $object_url);
?>