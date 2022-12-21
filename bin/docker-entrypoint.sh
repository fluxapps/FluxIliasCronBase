#!/usr/bin/env sh

set -e

getFileEnv() {
    name="$1"
    value=`printenv "$name"`
    if [ -n "$value" ]; then
        echo -n "$value"
    else
        name_file="${name}_FILE"
        value_file=`printenv "$name_file"`
        if [ -n "$value_file" ] && [ -f "$value_file" ]; then
            echo -n "`cat "$value_file"`"
        fi
    fi
}

ILIAS_COMMON_CLIENT_ID="${ILIAS_COMMON_CLIENT_ID:=default}"

ILIAS_CRON_USER_LOGIN="${ILIAS_CRON_USER_LOGIN:=cron}"

ILIAS_CRON_PERIOD="${ILIAS_CRON_PERIOD:=*/5 * * * *}"

if [ -f "$ILIAS_FILESYSTEM_INI_PHP_FILE" ]; then
    echo "ILIAS config found"
else
    echo "ILIAS not configured yet"
    exit 1
fi

echo "Generate cron config"
echo "$ILIAS_CRON_PERIOD php $ILIAS_WEB_DIR/cron/cron.php \"$ILIAS_CRON_USER_LOGIN\" \"$(getFileEnv ILIAS_CRON_USER_PASSWORD)\" \"$ILIAS_COMMON_CLIENT_ID\"" > /etc/crontabs/www-data

echo "Start cron"
exec crond -f
