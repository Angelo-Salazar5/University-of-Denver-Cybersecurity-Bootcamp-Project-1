#!/bin/bash
cd /home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis
cat 0312_Dealer_schedule | grep -i *'5:00:00 AM\|8:00:00 AM\|2:00:00 PM\|8:00:00 PM\|11:00:00 PM'* | awk '{print $1, $2, $5, $6}' >> Roulette_Losses
