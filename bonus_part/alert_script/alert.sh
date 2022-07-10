#!/bin/bash

###########################################################################
# Author  : Ali Yigit Ogun                                                |      
# Date    : 26.05.2022                                                    |
# Version : 0.2                                                           |
# Usage   : This script alerts the specified emmail owner in case of      |
#	    	the the disk useage is more than %90.   					  |
###########################################################################

# Get partition name
PARTITION=$(df / | grep / | awk '{print $1}')

# Get current usage of selected partition
USE=$(df / | grep / | awk '{print int($5)}')

#Limit has been set to 90 arbitrarily.
LIMIT=90

#Hostname and date are collected in order to use in email content.
HOST=$(hostname)
NOW=$(date)

# If current space exceeds threshold level
if [ "$USE" -ge "$THRESHOLD" ]
then
    # Email headers
    SUBJECT="$HOST Disk Usage Alert: $USE% used"
    TO="proteindevops@gmail.com"

    # Body message of the email
    BODY="The partition $PARTITION on $HOST has used: $USE% at $NOW. This is above the threshold of $LIMIT%."
    
    # Sent an email to specified address with given information
    echo -e $BODY | mail -s "$SUBJECT" $TO
fi