<?php

# $Id: CreateActivity.php 50648 2021-03-21 12:09:27Z nstevens $
# Version Location: $HeadURL: svn+ssh://dev.workbooks.com/customer/Rotary%20Corp/Activity_Case_Opportunity_Creation/CreateActivity.php $

declare(strict_types=1);

class CreateActivity extends CreateRecord
{
    const PRIORITY = 'Medium';

    function __construct($workbooks, $params, $form_fields)
    {
        parent::__construct($workbooks, $params, $form_fields, 'activity/tasks');
    }

    function SetAttributes(&$data)
    {
        // ensure consistent dates even for people working over midnight
        $now = date('Y-m-d H:i:s T'); 
        $today = substr($now, 0, 10);

        $data['activity_priority'] = self::PRIORITY;
        $data['activity_status'] = $this->ExpandString($this->params['Status']);
        $data['activity_type'] = $this->ExpandString($this->params['Type']);
        if (trim($this->params['Assigned to']) != '')
        {
            $data['assigned_to'] = $this->params['Assigned to'];
        }
        // else assigned to will default to current user
        if ($this->form_fields['type'] == 'Private::Crm::Opportunity')
        {
            $dealer_keys = ['linked_item_association_for_cf_opportunity_prospective_dealer', 
                'linked_item_association_for_cf_opportunity_dealer'];
            foreach ($dealer_keys as $key)
            {
                if (array_key_exists($key, $this->form_fields))
                {
                    $data['cf_task_company'] = $this->form_fields[$key];
                    break;
                }
            }
        }
        else
        {
            $data['cf_task_company'] = $this->form_fields['id'];
        }
        if ($data['activity_status'] == 'Completed')
        {
            $data['completed_date'] = $today;
        }
        if (strtoupper($this->params['Due Date']) == 'TRUE')
        {
            $data['due_date'] = $today;
        }
        $data['name'] = $this->ExpandString($this->params['Subject']);
        if (strtoupper($this->params['Continue editing']) != 'TRUE')
        {
            $this->edit = false;
        }
    }

    function PostCreate($id)
    {
        if ($this->form_fields['type'] == 'Private::Crm::Opportunity')
        {
            $create_activity_links[] = [
                'activity_type' =>  'Private::Activity::Task',
                'activity_id' => $id,
                'resource_type' => 'Private::Crm::Opportunity',
                'resource_id' => $this->form_fields['id'],
            ];
            $this->workbooks->assertCreate('activity/activity_links', $create_activity_links);
        }
    }

}

$ca = new CreateActivity($workbooks, $params, $form_fields);
$ca->run();

?>