# E24 Development Environments Docker Project

This project demonstrates a modern containerized web application setup with advanced Docker features for automated updates and enhanced security.

## Key Features

### 🔄 Automatic Container Updates with Watchtower
Setup includes Watchtower for automated container updates:
- Automatically monitors and updates containers
- Checks for updates every 24 hours
- Zero-downtime updates for seamless operation

> **Important Note**
> While Watchtower is capable of automatic updates (when using `:latest` tags), this project intentionally uses fixed versions (e.g., `mongo:8.0.This decision was made to ensure:
> - **Predictability**
> - **Stability**
> - **Control**
>
> This choice makes sure the app works the same way during testing and on presentation day, so there are no surprises.

### 🛡️ Enhanced Security with Docker Socket Proxy
Implement a secure Docker daemon access through a proxy:
- Prevents direct access to Docker socket
- Limits container permissions to only necessary operations
- Reduces security risks by controlling Docker API access
- Enables safe container management

### 🌐 Network Isolation
The application uses a two-network architecture:
- Public network for web access
- Internal network for secure service communication
- MongoDB isolated from external access

## Quick Start

1. Ensure you have Docker and Docker Compose installed on your machine.
2. Clone repository or unzip the repository in your desired location
3. Start the application:
```bash
docker-compose up
```
4. Access the web app at http://localhost:3000

## Architecture Overview

```
├── Web App (Node.js)    → Public Access
├── MongoDB              → Internal Only
├── Docker Socket Proxy  → Security Layer
└── Watchtower          → Auto-Updates
```

## Resource Management
- Each service has defined resource limits:
  - CPU: 0.50 (50% of one core)
  - Memory: 512MB

## Security Notes
- MongoDB is only accessible within the internal network
- Docker operations are restricted through the socket proxy
- Regular security updates via Watchtower

## Technologies Used
- Node.js Application
- MongoDB Database
- Docker & Docker Compose
- Tecnativa Docker Socket Proxy
- Containrrr Watchtower

## Container Update Strategy
1. **Automatic Updates (Using :latest)**
   - Containers using the `:latest` tag will be automatically updated
   - Watchtower checks for new versions every 24 hours

2. **Fixed Versions**
   - Containers with specific version tags (e.g., `:8.0.1`) won't be automatically updated
   - This provides version stability but requires manual updates
