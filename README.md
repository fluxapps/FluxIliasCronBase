# flux-ilias-cron-base

ILIAS base cron docker image

First look at [flux-ilias](https://github.com/fluxfw/flux-ilias)

The follow environment variables are available

| Variable | Description | Default value |
| -------- | ----------- | ------------- |
| ILIAS_CRON_PERIOD | Period the cron job is run<br>Default value means every 5th minute | */5 * * * * |

Minimal variables required to set are **bold**
