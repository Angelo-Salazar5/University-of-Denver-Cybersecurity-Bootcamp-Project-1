#!/bin/bash
#Switch to directory that holds employee schedules.
cd /home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis
#Cat will look for the file related to the user inputted date. Grep will search for the time inputted. Awk will pull the time, am/pm, employee first name and last name for roulette.
cat $1* | grep -i $2 | awk '{print $1, $2, $5, $6}'
