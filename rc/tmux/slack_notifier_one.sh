#!/bin/bash
#
# slack notifier on shell (specified channel)
# @asmz
#
# Usage
#  ./slack_notifier.sh [channel_name]
#
# Configuration
#  Required SLACK_API_TOKEN environment variable before open tmux.
#  ex)
#   $ export SLACK_API_TOKEN=<your slack api token>
#   $ tmux
#
# requirement
#  *) curl
#  *) jq - command-line JSON processor
#     http://stedolan.github.io/jq/
#

API_URL_BASE="https://slack.com/api/"
API_CHANNELS_LIST="channels.list"
API_CHANNELS_INFO="channels.info"
HTTP_GET="$(which curl) -s -X GET"
JQ="$(which jq) -r"

if [[ -z $1 || -z ${SLACK_API_TOKEN} ]]; then
    exit 1
fi

channel_name=$1

# Get channel id by channel name
channel_id=`${HTTP_GET} "${API_URL_BASE}${API_CHANNELS_LIST}?token=${SLACK_API_TOKEN}&exclude_archived=1" | ${JQ} '.channels[] | select(.name == "'${channel_name}'") | .id'`
if [[ -z ${channel_id} ]]; then
    exit 1
fi

# Get unread count by channel id
unread_count=`${HTTP_GET} "${API_URL_BASE}${API_CHANNELS_INFO}?token=${SLACK_API_TOKEN}&channel=${channel_id}" | ${JQ} '.channel.unread_count_display'`

# Set label
unread_label=""
if [[ ${unread_count} != 0 ]]; then
    unread_label="[${channel_name}:${unread_count}]"
fi

echo ${unread_label}

exit 0

