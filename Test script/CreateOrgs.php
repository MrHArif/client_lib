<?php
$field_array = array(
array(
  'name'                   => 'Birkbeck Burgers',
  'industry' => 'Food',
  'main_location[country]' => 'United Kingdom'
),
array(
  'name'                   => 'Camden Cafe',
  'industry' => 'Food',
  'main_location[country]' => 'United Kingdom'
));

$response = $workbooks->assertCreate('crm/organisations', $field_array);
$workbooks->log('Orgs', $response, 'info');
$obj_id_lockV = $workbooks->idVersions($response);
$workbooks->log('OrgID', $obj_id_lockV, 'info');

$create_relArray = array(
  'source_id'        =>$obj_id_lockV[0]['id'],
  'source_type'      => 'Private::Crm::Organisation',
  'related_item_id'   => $obj_id_lockV[1]['id'],
  'related_item_type' => 'Private::Crm::Organisation');
$response = $workbooks->assertCreate('related_items', $create_relArray);
$workbooks->log('Created relationships', $response, 'info');


?>