<?php

/*
/data/nginx/logs/bao.huajiao.com/app/*log* {
    daily
    ratate 360 
    missingok
    copytruncate      
    compress   
}
date('Y-m-d H', strtotime($item.date|cat:" "|cat:$item.stime|cat:":00:00")) > date('Y-m-d H')


<span class="btn btn-primary showModal" data-batch="reject-reason" onclick="setValue(
                    <?= $val['family_name'] ?>,
                    <?= $val['corp_name'] ?>,
                    <?php FamilyContract::getContractTypeArr()[$val['contract_type']] ?>,
                    <?= $val['reason'] ?>)">驳回原因</span>

/usr/sbin/logrotate -d -f /etc/logrotate.d/test

# 每天5点执行，删除90天之前的日志
0 5 * * * find /data/nginx/logs/bao.huajiao.com/app/archive -type f -name "*log*" -mtime +90 -exec rm {} \;
 */


