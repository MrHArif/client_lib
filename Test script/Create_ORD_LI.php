<?php

$create_array = array(
  'description'                  => 'Test Organisation from API'
);

$response1 = $workbooks->assertCreate('accounting/quotations', $create_array);
$workbooks->log('Created Document Header', $response1, 'info');
$object_id = $workbooks->idVersions($response1);
$workbooks->log('Created Document Header', $object_id, 'info');
$doc_header = $object_id[0]['id'];
$doc_version = $object_id[0]['lock_version'];
$workbooks->log('lock version', $doc_version, 'info');

$create_line_array = array(
    'document_header_id'         => $doc_header,
    'description'         => 'Test Item Line',
    'unit_quantity'            => '2',
    'document_currency_unit_price_value'  => '50.00 GBP 0'
);
$response = $workbooks->assertCreate('accounting/quotation_line_items', $create_line_array);
$workbooks->log('Created line item', $response, 'info');

$response = $workbooks->assertGet('accounting/quotations', $object_id);
$workbooks->log('Created Document Header', $response, 'info');
$doc_header = $response['data'][0]['id'];
$workbooks->log('ID ', $doc_header, 'info');
$doc_version = $response['data'][0]['lock_version'];
$workbooks->log('lock version', $doc_version, 'info');

$updateArray = array(
'status' => 'POSTED',
'id' => $doc_header,
'lock_version' => $doc_version, 
'party_id' => '6'
);

$response = $workbooks->assertUpdate('accounting/quotations', $updateArray);
$workbooks->log('Document Header POSTED', $response, 'info');

?>