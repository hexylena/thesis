# curl 'https://play.clickhouse.com/?add_http_cors_header=1&default_format=JSONCompact&max_result_rows=1000&max_result_bytes=10000000&result_overflow_mode=break' \
#   -H 'Accept: */*' \
#   -H 'Accept-Language: en-US,en;q=0.9' \
#   -H 'Authorization: Basic cGxheTo=' \
#   -H 'Connection: keep-alive' \
#   -H 'Content-Type: text/plain;charset=UTF-8' \
#   -H 'Cookie: _ga=GA1.1.1120117021.1729252614; _ga_KF1LLRTQ5Q=GS1.1.1729252614.1.1.1729252650.0.0.0' \
#   -H 'Origin: https://play.clickhouse.com' \
#   -H 'Referer: https://play.clickhouse.com/play?user=play' \
#   -H 'Sec-Fetch-Dest: empty' \
#   -H 'Sec-Fetch-Mode: cors' \
#   -H 'Sec-Fetch-Site: same-origin' \
#   -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36' \
#   -H 'sec-ch-ua: "Chromium";v="130", "Google Chrome";v="130", "Not?A_Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Linux"' \
#   --data-raw $'SELECT\n  created_at,\n  repo_name\nFROM\n  github_events\nWHERE\n  actor_login = \'hexylena\'\n  and event_type = \'PushEvent\'\n  and repo_name \u0021= \'usegalaxy-eu/usegalaxy-eu.github.io\' and repo_name \u0021= \'usegalaxy-eu/website\' \nORDER BY\n  created_at DESC\nLIMIT\n  10000\n  ' > commits.json
# curl 'https://play.clickhouse.com/?add_http_cors_header=1&default_format=JSONCompact&max_result_rows=1000&max_result_bytes=10000000&result_overflow_mode=break' \
#   -H 'Accept: */*' \
#   -H 'Accept-Language: en-US,en;q=0.9' \
#   -H 'Authorization: Basic cGxheTo=' \
#   -H 'Connection: keep-alive' \
#   -H 'Content-Type: text/plain;charset=UTF-8' \
#   -H 'Cookie: _ga=GA1.1.1120117021.1729252614; _ga_KF1LLRTQ5Q=GS1.1.1729252614.1.1.1729252650.0.0.0' \
#   -H 'Origin: https://play.clickhouse.com' \
#   -H 'Referer: https://play.clickhouse.com/play?user=play' \
#   -H 'Sec-Fetch-Dest: empty' \
#   -H 'Sec-Fetch-Mode: cors' \
#   -H 'Sec-Fetch-Site: same-origin' \
#   -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36' \
#   -H 'sec-ch-ua: "Chromium";v="130", "Google Chrome";v="130", "Not?A_Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Linux"' \
#   --data-raw $'SELECT\n  created_at,\n  repo_name\nFROM\n  github_events\nWHERE\n  actor_login = \'hexylena\'\n  and event_type = \'PushEvent\'\n  and repo_name \u0021= \'usegalaxy-eu/usegalaxy-eu.github.io\' and repo_name \u0021= \'usegalaxy-eu/website\' and  created_at < \'2020-03-25\'::date  \nORDER BY\n  created_at DESC\nLIMIT\n  10000\n  ' > commits2.json
#
# curl 'https://play.clickhouse.com/?add_http_cors_header=1&default_format=JSONCompact&max_result_rows=1000&max_result_bytes=10000000&result_overflow_mode=break' \
#   -H 'Accept: */*' \
#   -H 'Accept-Language: en-US,en;q=0.9' \
#   -H 'Authorization: Basic cGxheTo=' \
#   -H 'Connection: keep-alive' \
#   -H 'Content-Type: text/plain;charset=UTF-8' \
#   -H 'Cookie: _ga=GA1.1.1120117021.1729252614; _ga_KF1LLRTQ5Q=GS1.1.1729252614.1.1.1729252650.0.0.0' \
#   -H 'Origin: https://play.clickhouse.com' \
#   -H 'Referer: https://play.clickhouse.com/play?user=play' \
#   -H 'Sec-Fetch-Dest: empty' \
#   -H 'Sec-Fetch-Mode: cors' \
#   -H 'Sec-Fetch-Site: same-origin' \
#   -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36' \
#   -H 'sec-ch-ua: "Chromium";v="130", "Google Chrome";v="130", "Not?A_Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Linux"' \
#   --data-raw $'SELECT\n  created_at,\n  repo_name\nFROM\n  github_events\nWHERE\n  actor_login = \'erasche\'\n  and event_type = \'PushEvent\'\n  and repo_name \u0021= \'usegalaxy-eu/usegalaxy-eu.github.io\' and repo_name \u0021= \'usegalaxy-eu/website\' \nORDER BY\n  created_at DESC\nLIMIT\n  10000\n  ' > commits3.json
#
curl 'https://play.clickhouse.com/?add_http_cors_header=1&default_format=JSONCompact&max_result_rows=1000&max_result_bytes=10000000&result_overflow_mode=break' \
  -H 'Accept: */*' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  -H 'Authorization: Basic cGxheTo=' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: text/plain;charset=UTF-8' \
  -H 'Cookie: _ga=GA1.1.1120117021.1729252614; _ga_KF1LLRTQ5Q=GS1.1.1729252614.1.1.1729252650.0.0.0' \
  -H 'Origin: https://play.clickhouse.com' \
  -H 'Referer: https://play.clickhouse.com/play?user=play' \
  -H 'Sec-Fetch-Dest: empty' \
  -H 'Sec-Fetch-Mode: cors' \
  -H 'Sec-Fetch-Site: same-origin' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36' \
  -H 'sec-ch-ua: "Chromium";v="130", "Google Chrome";v="130", "Not?A_Brand";v="99"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Linux"' \
  --data-raw $'SELECT\n  created_at,\n  repo_name\nFROM\n  github_events\nWHERE\n  actor_login = \'erasche\'\n  and event_type = \'PushEvent\'\n  and repo_name \u0021= \'usegalaxy-eu/usegalaxy-eu.github.io\' and repo_name \u0021= \'usegalaxy-eu/website\' and  created_at < \'2013-03-13\'::date \nORDER BY\n  created_at DESC\nLIMIT\n  10000\n  ' > commits6.json
