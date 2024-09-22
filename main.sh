#!/bin/bash

# تعریف رنج آی‌پی قطر
START_IP=176.32.51.0
END_IP=176.32.51.255

# تابع برای تبدیل آی‌پی به عدد
ip_to_int() {
  local a b c d
  IFS=. read -r a b c d <<< "$1"
  echo "$((a * 256 ** 3 + b * 256 ** 2 + c * 256 + d))"
}

# تابع برای تبدیل عدد به آی‌پی
int_to_ip() {
  local ip dec=$1
  for e in {3..0}; do
    ip=$((dec / (256 ** e)))
    dec=$((dec % (256 ** e)))
    printf "%s%s" $ip ${e:+"."}
  done
  echo
}

# تبدیل آی‌پی شروع و پایان به اعداد
START_NUM=$(ip_to_int $START_IP)
END_NUM=$(ip_to_int $END_IP)

# تولید یک عدد تصادفی در این رنج
RANDOM_IP_NUM=$(shuf -i $START_NUM-$END_NUM -n 1)

# تبدیل عدد به آی‌پی
RANDOM_IP=$(int_to_ip $RANDOM_IP_NUM)

echo "Random Spain IPv4 IP: $RANDOM_IP"
