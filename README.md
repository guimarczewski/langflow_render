# Langflow on Render

This repository contains the configuration to deploy Langflow on Render using blueprints.

## Features
- PostgreSQL database integration
- Auto-deployment from main branch
- Health checks
- Environment variable configuration

## Deployment
1. Fork this repository
2. Connect to Render using the blueprint
3. Deploy and access your Langflow instance

## Environment Variables
- `LANGFLOW_HOST`: Host address (default: 0.0.0.0)
- `LANGFLOW_PORT`: Port number (default: 10000)
- `LANGFLOW_AUTO_LOGIN`: Enable auto-login (default: false)

## Database
The deployment includes a PostgreSQL database for storing flows and configurations.
