#!/bin/bash
# git clone https://github.com/rapid7/metasploit-framework.git
if [ -z $2 ];then printf "\nSyntax: $0 <msf_location|~/|/usr/share/> <cvedetails_url|https://www.cvedetails.com/vulnerability-list/vendor_id-45/product_id-66/version_id-40007/Apache-Http-Server-2.2.3.html>\n\n"
	else
for CVE in $(curl -A '' "$2" 2>/dev/null|egrep -o 'CVE-[0-9]{4}-[0-9]{4,5}'|sort -u|grep -v '2009-1234'|sed 's/CVE-//g;'); do
	echo "### CVE-$CVE"; grep -r "$CVE"  $1/modules/*;
done
fi
