# X-Forwarded-Host-injector-v1


X-Forwarded-Host-injector-v1 is simple bash script for find dynamic X-Forwarded-Host-injection is possible or not on set of domains. this tool based on hackerone report https://hackerone.com/reports/737315 . 


# What this tool doing?

*)  tool use curl to send post request to server with  X-Forwarded-For header set to evil.com 
*)  check our injected header value is reflected in server response or not



# Usage:
---------

1) list out all subdomain to text file "subdomains.txt"
2) run bash X-Forwarded-Host-injector-v1.sh


