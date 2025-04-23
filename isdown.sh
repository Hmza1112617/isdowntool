#!/bin/bash

command -v curl >/dev/null 2>&1 || { echo >&2 "Error: curl is not installed. Aborting."; exit 1; }
command -v jq >/dev/null 2>&1 || { echo >&2 "Error: jq is not installed. Aborting."; exit 1; }
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${CYAN}======================${NC}"
echo -e "${CYAN}  \033[1mIs Down? Tool\033[0m ${CYAN}${NC}"
echo -e "${CYAN}======================${NC}"
echo ""

echo -e "${YELLOW}Enter website domain (e.g., example.com): ${NC}"
read dom

echo -e "${CYAN}Checking ${dom}...${NC}"

url1="https://www.isitdownrightnow.com/check.php?domain=${dom}"
res1=$(curl -s -A "Mozilla/5.0 (Linux; Android 11; SM-A307FN Build/RP1A.200720.012) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.7049.100 Mobile Safari/537.36" \
    -H "Accept-Encoding: gzip, deflate, br, zstd" \
    -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7" \
    -H "Cache-Control: max-age=0" \
    -H "sec-ch-ua: \"Android WebView\";v=\"135\", \"Not-A.Brand\";v=\"8\", \"Chromium\";v=\"135\"" \
    -H "sec-ch-ua-mobile: ?1" \
    -H "sec-ch-ua-platform: \"Android\"" \
    -H "Upgrade-Insecure-Requests: 1" \
    -H "sec-gpc: 1" \
    -H "dnt: 1" \
    -H "save-data: on" \
    -H "X-Requested-With: mark.via.gp" \
    -H "Sec-Fetch-Site: none" \
    -H "Sec-Fetch-Mode: navigate" \
    -H "Sec-Fetch-User: ?1" \
    -H "Sec-Fetch-Dest: document" \
    -H "Accept-Language: ar-DZ,ar;q=0.9,en-US;q=0.8,en;q=0.7,ar-AE;q=0.6,en-AU;q=0.5" \
    "$url1")

enc=$(echo "$res1" | jq -sRr @uri)

url2="http://hamzaddff.free.nf/api/down.php?promat=${enc}"
res2=$(curl -s -A "Mozilla/5.0 (Linux; Android 11; SM-A307FN Build/RP1A.200720.012) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.7049.100 Mobile Safari/537.36" \
    -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7" \
    -H "Accept-Encoding: gzip, deflate, br, zstd" \
    -H "Cache-Control: max-age=0" \
    -H "sec-ch-ua: \"Android WebView\";v=\"135\", \"Not-A.Brand\";v=\"8\", \"Chromium\";v=\"135\"" \
    -H "sec-ch-ua-mobile: ?1" \
    -H "sec-ch-ua-platform: \"Android\"" \
    -H "Upgrade-Insecure-Requests: 1" \
    -H "sec-gpc: 1" \
    -H "dnt: 1" \
    -H "save-data: on" \
    -H "X-Requested-With: mark.via.gp" \
    -H "Sec-Fetch-Site: none" \
    -H "Sec-Fetch-Mode: navigate" \
    -H "Sec-Fetch-User: ?1" \
    -H "Sec-Fetch-Dest: document" \
    -H "Accept-Language: ar-DZ,ar;q=0.9,en-US;q=0.8,en;q=0.7,ar-AE;q=0.6,en-AU;q=0.5" \
    -H "Cookie: __test=1d545aaa049502f82d69751f249aa871" \
    "$url2")

msg=$(echo "$res2" | jq -r .message)

echo ""

echo -e "${CYAN}Result:${NC}"
if [[ "$msg" == *"is UP"* ]]; then
    echo -e "${GREEN}${msg}${NC}"
elif [[ "$msg" == *"is DOWN"* ]]; then
    echo -e "${RED}${msg}${NC}"
else
    echo -e "${YELLOW}${msg}${NC}"
fi

echo ""
