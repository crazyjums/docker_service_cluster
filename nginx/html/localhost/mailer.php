<?php
ini_set("sendmail_from", "zhuhonggen-hj@huafang.com");
$to = "15959963313@163.com"; //change receiver address  
$subject = "This is subject";
$message = "This is simple text message.";
$header = "From:maxsujaiswal@yiibai.com \r\n";

$result = mail($to, $subject, $message, $header);

if ($result == true) {
    echo "Message sent successfully...";
} else {
    echo "Sorry, unable to send mail...";
}
