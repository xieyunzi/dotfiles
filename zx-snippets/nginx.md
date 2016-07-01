http proxy
==========

    ```
    server {
        listen 8080;
        resolver 8.8.8.8;
        location / {
            proxy_pass http://$http_host$request_uri;
            # allow 127.0.0.1;
            # deny all;
        }
    }
    ```

注意: 必须加上resolver 8.8.8.8,
给nginx指定dns，否则会报告 "nginx 502 bad gateway" 错误,
可以通过allow和deny来设置只有指定IP能够访问

use case: 例如公司把 QQ 封掉了; aws 被墙了
