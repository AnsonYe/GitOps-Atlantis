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

# Atlantis with Ngrok Docker Setup

This project provides a local setup of Atlantis with Ngrok using Docker and Docker Compose. Ngrok provides a public URL to access the Atlantis server running locally. This is useful for development and testing scenarios.

## Environment Variables

First, you need to create a `.env.local` file to configure Atlantis and Ngrok. The content of the `.env.local` file should look like this:

```shell
ATLANTIS_GH_WEBHOOK_SECRET=<Your Github Webhook Secret>
ATLANTIS_GH_TOKEN=<Your Github Token>
ATLANTIS_ATLANTIS_URL=<Your-Random-Domain.ngrok-free.app>
ATLANTIS_GH_USER=<Your Github User>
ATLANTIS_REPO_ALLOWLIST=<Your Repo Allowlist>
ATLANTIS_REPO_CONFIG=<Your Repo Config>
AWS_ACCESS_KEY_ID=<Your AWS Access Key ID>
AWS_SECRET_ACCESS_KEY=<Your AWS Secret Access Key>
NGROK_AUTHTOKEN=<Your Ngrok Auth Token>
NGROK_DOMAIN=<Your-Random-Domain.ngrok-free.app>
```
Please replace <Your ...> with your actual information.

## Running the Containers
After setting up the environment variables, you can run the Docker containers using the following command:
```
docker compose --env-file ./.env.local up
```
To stop and remove the containers, you can use:
```
docker compose --env-file ./.env.local down
```