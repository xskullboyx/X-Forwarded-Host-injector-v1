#tool by xskullboyx
# tool for checking X-Forwarded-Host is dynamically used in the application
#https://hackerone.com/reports/737315



#color
Bold="\033[1m"
purple='\033[1;35m'
OKBLUE='\033[94m'
OKRED='\033[91m'
OKGREEN='\033[92m'
OKYELLOW='\033[93m'
RESET='\e[0m'
Magenta="\033[35m"
LightRed="\033[91m"
LightGreen="\033[92m"
LightYellow="\033[93m"
LightBlue="\033[94m"
LightMagenta="\033[95m"
LightCyan="\033[96m"


#### Colors Output

RESET="\033[0m"         # Normal Colour
RED="\033[0;31m"        # Error / Issues
GREEN="\033[0;32m"      # Successful       
BOLD="\033[01;01m"          #  Highlight
WHITE="\033[1;37m"      # BOLD
YELLOW="\033[1;33m"     # Warning
PADDING="  "
DPADDING="\t\t"


#### Other Colors / Status Code

LGRAY="\033[0;37m"      # Light Gray
LRED="\033[1;31m"       # Light Red
LGREEN="\033[1;32m"     # Light GREEN
LBLUE="\033[1;34m"      # Light Blue
LPURPLE="\033[1;35m"        # Light Purple
LCYAN="\033[1;36m"      # Light Cyan
SORANGE="\033[0;33m"        # Standar Orange
SBLUE="\033[0;34m"      # Standar Blue
SPURPLE="\033[0;35m"        # Standar Purple      
SCYAN="\033[0;36m"      # Standar Cyan
DGRAY="\033[1;30m"      # Dark Gray


# Colors 2
red='\e[1;91m'
green='\e[1;92m'
yellow='\e[1;93m'
blue='\e[1;94m'
magenta='\e[1;95m'
cyan='\e[1;96m'
white='\e[1;97m'

# Colors 1
k="\033[93;1m"
m="\033[91;1m"
pu="\033[97;1m"
p="\033[96;1m"
b="\033[94;1m"
h="\033[92;1m"


clear

#loop start for fetching all domains from txt file

for k in $(cat subdomains.txt)
do

  echo -e "$LightMagenta $BOLD checking domain:$k $RESET"


if curl -v --connect-timeout 10 https://$k/ -H 'X-Forwarded-Host: exampleinject' 2>&1 | grep "exampleinject"  && curl -v https://$k/ -H 'X-Forwarded-For: exampleinject' 2>&1 | grep "exampleinject"
then

echo "maybe vulnerable! check before report "


elif curl -v https://$k/ --connect-timeout 10 https://$k/ -H 'X-Forwarded-Host: exampleinject' 2>&1 | grep 'curl failed to verify the legitimacy of the server' && curl -v https://$k/ -H 'X-Forwarded-For: exampleinject' 2>&1 | grep 'curl failed to verify the legitimacy of the server'
then
	
echo -e "$OKRED $BOLD https issue found.ignoring" $RESET


else

echo -e "$yellow $BOLD something went wrong" $RESET


fi

sleep 2s
done



    echo ""
    echo -e "$OKRED $BOLD[#]Scan finished!!!!!!" $RESET
 

#end
