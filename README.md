# GitOps Atlantis

Atlantis is a self-hosted golang application that listens for Terraform pull request events from GitHub. This guide will help you to set it up and use it.

## Installation

Start by running the `local-setup.sh` script:

```bash
./script/local-setup.sh
```

This script does the following:

Downloads the specified version of Atlantis.
Downloads ngrok, which will be used to expose your Atlantis instance to the web.
Generates a random secret string.

## Repository Setup
Next, you'll need to set up a webhook in your GitHub repository to point to your Atlantis server. Follow GitHub's documentation on how to create a webhook.

The payload URL of the webhook will be the /events endpoint on your Atlantis server e.g. http://your-atlantis-domain/events.

Ensure that the Content type is `application/json`

The secret should be the random string generated by local-setup.sh script.

## Atlantis Configuration
You'll need to modify the atlantis.var file with your specific configuration values. Once this is done, you can start Atlantis using the `start-atlantis.sh` script:
```
./script/start-atlantis.sh
```

## Expose Atlantis
Finally, expose your Atlantis instance with `ngrok`:
```
./ngrok http 4141
```

Your Atlantis server is now accessible over the internet and ready to receive webhooks from GitHub.