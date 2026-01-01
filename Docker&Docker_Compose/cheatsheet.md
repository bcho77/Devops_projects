# Docker & Docker Compose Cheatsheet

## Docker Basics

```bash
docker --version            # Show Docker version
docker info                 # Show system-wide information
docker help                 # Docker help
```

## Images

```bash
docker images               # List images
docker pull nginx           # Pull image
docker build -t myapp .     # Build image from Dockerfile
docker tag img:latest img:v1# Tag image
docker rmi img              # Remove image
docker image prune          # Remove unused images
```

## Containers

```bash
docker ps                   # Running containers
docker ps -a                # All containers
docker run nginx            # Run container
docker run -d -p 80:80 nginx# Run in background with port
docker exec -it ctn bash    # Enter container shell
docker logs ctn             # View logs
docker stop ctn             # Stop container
docker start ctn            # Start container
docker restart ctn          # Restart container
docker rm ctn               # Remove container
docker container prune      # Remove stopped containers
```

## Volumes

```bash
docker volume ls             # List volumes
docker volume create data    # Create volume
docker run -v data:/app nginx# Mount volume
docker volume inspect data   # Inspect volume
docker volume rm data        # Remove volume
docker volume prune          # Remove unused volumes
```

## Networks

```bash
docker network ls            # List networks
docker network create net1   # Create network
docker network inspect net1  # Inspect network
docker network connect net1 ctn # Connect container
docker network rm net1       # Remove network
```

## Dockerfile Essentials

```dockerfile
FROM node:18
WORKDIR /app
COPY . .
RUN npm install
CMD ["npm", "start"]
```

## Docker Compose Basics

```bash
docker compose version       # Show version
docker compose up            # Start services
docker compose up -d         # Detached mode
docker compose down          # Stop & remove services
docker compose ps            # List services
docker compose logs          # View logs
docker compose exec svc bash # Exec into service
docker compose pull          # Pull service images
docker compose build         # Build services
docker compose restart       # Restart services
```

## docker-compose.yml Example

```yaml
version: '3.9'
services:
  web:
    image: nginx
    ports:
      - "80:80"
  app:
    build: .
    volumes:
      - .:/app
    depends_on:
      - web
```

## Cleanup & Maintenance

```bash
docker system df             # Disk usage
docker system prune          # Remove unused data
docker system prune -a       # Aggressive cleanup
```

## Common Flags

| Flag | Meaning               |
| ---- | --------------------- |
| -d   | Detached mode         |
| -p   | Port mapping          |
| -v   | Volume mapping        |
| -it  | Interactive terminal  |
| --rm | Auto-remove container |

---

*This cheatsheet covers the most common Docker and Docker Compose commands used in DevOps and containerized environments.*
