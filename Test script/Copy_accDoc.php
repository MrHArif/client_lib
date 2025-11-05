<?php

$qte_id = $params['qte'];
$workbooks->log('params passed', $qte_id, 'info');


$createORD = array(
'create_from_id'=> $qte_id,
'description' => 'text'
); 

$response = $workbooks->assertCreate('accounting/sales_orders', $createORD);
$workbooks->log('Created', $response, 'info');
?>