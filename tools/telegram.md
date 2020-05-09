
## Telegram Bot

1) Create a bot using BotFather: https://core.telegram.org/bots#6-botfather

2) Get the API token using https://telegram.me/BotFather

It's something like `123123123:HJAFBBJAFHKJHSKAJHFKJHKAHSKFJHKHKASF`

3) Start a group chat, or 1:1 chat with the bot you just created

4) Get the Chat ID of that chat:
```
# Output is sorted from the oldest to the newest
# Chat ID may be a negative number
curl https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/getUpdates  | jq .result | jq 'map(.message.chat.id)'
```

5) Send message by running `./sendmessage.sh somemessage`

`sendmessage.sh` content:

```
#!/bin/bash

source ./CONFIG

TEXT_TO_SEND="Message: $1"

curl -X POST \
     -H 'Content-Type: application/json' \
     -d "{\"chat_id\": \"$CHAT_ID\", \"text\": \"$TEXT_TO_SEND\", \"disable_notification\": false}" \
     https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage
```



`./CONFIG` content:

```
TELEGRAM_BOT_TOKEN=123412341234:HAJKHFKJHJKHFKHAKFKH
CHAT_ID=-654654654
```
