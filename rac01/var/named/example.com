$TTL 86400
@   IN  SOA     rac01.mydomain.com. root.mydomain.com. (
        2015033001  ;Serial
        3600        ;Refresh
        1800        ;Retry
        604800      ;Expire
        86400       ;Minimum TTL
)
; Specify our two nameservers
		IN	NS		rac01.example.com.
		IN	NS		rac02.example.com.
; Resolve nameserver hostnames to IP
rac01		IN	A		192.168.20.101
rac02		IN	A		192.168.20.102

; Define hostname -> IP pairs which you wish to resolve		
www		IN	A		192.168.20.150
clust01-scan	IN	A		192.168.20.110
		IN	A		192.168.20.111
		IN	A		192.168.20.112
