<?php


    $timeout_val = getenv('TIMEOUT');
    echo('Process timeout value'. $timeout_val);

    $t1 = time();


    //finding cases that are awaiting customer repsonse and follow-up email sent is blank and retrieving all data for the selected records  
    $filter_limit_select = array(
      '_start'               => '0',                                     // Starting from the 'zeroth' record
      '_limit'               => '100',                                   //   fetch up to 100 records
      '_sort'                => 'id',                                    // Sort by 'id'
      '_dir'                 => 'ASC',                                   //   in ascending order
      '_ff[]'                => 'case_status[value]', 'cf_case_followup_email', 'id', // Filter by this column
      '_ft[]'                => 'bg', 'bg','eq',                            
      '_fc[]'                => 'Awaiting customer response', '', $form_fields['id'],                    
      '_select_columns[]'    => array(                                   // An array, of columns to select
      )
    );
    $response = $workbooks->assertGet('crm/cases', $filter_limit_select);
    $workbooks->log('Cases found', $response, 'info');

    //finding the primairy contact's email on the Case

    $contactEmail = $response['data'][0]['contact_email'];
    $workbooks->log('Primary Contact Email', $contactEmail, 'info');

    //retrieving case id
    $case_id = $response['data'][0]['id'];
    $workbooks->log('Case id', $case_id, 'info');

    //retrieving case lock version
    $case_lockV = $response['data'][0]['lock_version'];
    $workbooks->log('Case lock version', $case_lockV, 'info');

    //retrieving information for emails.api

    $send_from_address = 'harifian.technologies@gmail.com';

    $create_emails = array(
        'from_address' => $send_from_address,
        'to_addresses' => $contactEmail,
        'render_with_template_id' => '19',
        'render_with_resource_type' => 'Private::Crm::Case',
        'render_with_resource_id' => $case_id,
        //'subject' => 'Follow-up email from WB Support', 
        //'synopsis' => 'text',
        'status' => 'DRAFT'
    );

    $workbooks->log('Create Email array', $create_emails, 'info');

    //$dataType = var_dump($create_emails['synopsis']);
    //echo $dataType;

    $response = $workbooks->assertCreate('email/emails', $create_emails);

    $safety_timeoutVal = getenv('TIMEOUT');

    $i = 0;
    while($i < 100){
        echo('looping for timeout');
        //sleep(1);
        $i++;
        $t2 = time(); //time at end of the loop
        $duration = $t2-$t1; //time taken each loop 
        if($duration > $safety_timeoutVal -5 ){ //exiting loop 5s before timeout this can be a parameter on the process
            break;
        }
    }


    

?>