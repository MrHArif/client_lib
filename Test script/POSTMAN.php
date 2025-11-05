<?php
// Your Workbooks API key
$apiKey = '';

// Workbooks API endpoint
$url = 'https://secure.workbooks.com/login.api';

//intializing cURL session 
$ch=curl_init();

// Set URL and other appropriate options
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_HEADER, 0);

// Grab URL and pass it to the browser
curl_exec($ch);



?>