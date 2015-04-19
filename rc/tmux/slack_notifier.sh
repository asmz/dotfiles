#!/bin/bash
#
# slack notifier on shell (all channel)
# @asmz
#
# Usage
#  ./slack_notifier_all.sh
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

ps=`pgrep -fo $0`
if [[ '' != ${ps} && $$ != ${ps} ]]; then
    exit 1
fi

if [[ -z ${SLACK_API_TOKEN} ]]; then
    exit 1
fi

# Get all channel you are a member
channel_list=`${HTTP_GET} "${API_URL_BASE}${API_CHANNELS_LIST}?token=${SLACK_API_TOKEN}&exclude_archived=1" | ${JQ} '.channels[] | select(.is_member == true) | "\(.name),\(.id)"'`
if [[ -z ${channel_list} ]]; then
    exit 1
fi

unread_label=""
for channel in ${channel_list}
do
    channel_name=`echo ${channel} | cut -d "," -f 1`
    channel_id=`echo ${channel} | cut -d "," -f 2`

    # Get unread count by channel id
    unread_count=`${HTTP_GET} "${API_URL_BASE}${API_CHANNELS_INFO}?token=${SLACK_API_TOKEN}&channel=${channel_id}" | ${JQ} '.channel.unread_count_display'`

    sleep 1

    if [[ ${unread_count} = 0 ]]; then
        continue
    fi
    unread_label="${unread_label} ${channel_name}:${unread_count}"
done

# Set label
echo ${unread_label}

exit 0
