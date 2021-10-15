#!/bin/bash

# ACC="5B6996AD1A5043BB98B59D31A37DC31B:6575637CC4714F87AD1183145E874205"
IFS=':' read -r -a PID <<< $ACC

# PID=( "5B6996AD1A5043BB98B59D31A37DC31B" "6575637CC4714F87AD1183145E874205" )
COUPONCODE=($1)

RESULT='{"resultCode":"COUPON_ALREADY_USE","couponSetting":null,"rewardItem":null,"resultMessage":"輸入的的序號已被使用或超過使用期限。","resultSubMessage":"請再次確認序號後輸入。"}'

for i in "${PID[@]}"
do
  echo "帳號:"$i
  for j in "${COUPONCODE[@]}"
  do
    echo -e "\t序號:"$j"\c"
    # RESULT=$(curl 'https://couponweb.netmarble.com/coupon/ennt/1324/apply' \
    # -H 'Connection: keep-alive' \
    # -H 'sec-ch-ua: "Chromium";v="94", "Google Chrome";v="94", ";Not A Brand";v="99"' \
    # -H 'sec-ch-ua-mobile: ?0' \
    # -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36' \
    # -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' \
    # -H 'Accept: application/json, text/javascript, */*; q=0.01' \
    # -H 'cache-control: no-cache' \
    # -H 'X-Requested-With: XMLHttpRequest' \
    # -H 'sec-ch-ua-platform: "Linux"' \
    # -H 'Origin: https://couponweb.netmarble.com' \
    # -H 'Sec-Fetch-Site: same-origin' \
    # -H 'Sec-Fetch-Mode: cors' \
    # -H 'Sec-Fetch-Dest: empty' \
    # -H 'Referer: https://couponweb.netmarble.com/coupon/ennt/1324' \
    # -H 'Accept-Language: zh-TW,zh;q=0.9,en-US;q=0.8,en;q=0.7,zh-CN;q=0.6' \
    # -H 'Cookie: _ga=GA1.2.220813182.1620094756; _gcl_au=1.1.219865550.1633076985; _fbp=fb.1.1633076986672.837927113' \
    # --data-raw "pid=${i}&channelCode=100&couponCode=${j}&worldId=20003012&nickname=&characterId=" \
    # --compressed)
    MSG=$(echo $RESULT | python3 -c "import sys, json; print(json.load(sys.stdin)['resultMessage'])")
    echo -e "\t${MSG}"

  done
done


