<?php

$target_path = "/data/www/localhost/file_upload/resources/";  
$target_path = $target_path.basename( $_FILES['fileToUpload']['name']);   
// var_dump($target_path);
// var_dump($_FILES['fileToUpload']);
// var_dump($_FILES['fileToUpload']['tmp_name']);
if(move_uploaded_file($_FILES['fileToUpload']['tmp_name'], $target_path)) {  
    echo "File uploaded successfully!";  
} else{  
    echo "Sorry, file not uploaded, please try again!";  
}