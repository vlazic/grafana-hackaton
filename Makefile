# Makefile

# Variables
COMPOSE_FILE=docker-compose.yml

# Docker Compose commands
up:
	docker compose -f $(COMPOSE_FILE) up -d

down:
	docker compose -f $(COMPOSE_FILE) down

build:
	docker compose -f $(COMPOSE_FILE) build

logs:
	docker compose -f $(COMPOSE_FILE) logs -f

ps:
	docker compose -f $(COMPOSE_FILE) ps

restart:
	docker compose -f $(COMPOSE_FILE) down
	docker compose -f $(COMPOSE_FILE) up -d

clean:
	docker compose -f $(COMPOSE_FILE) down --rmi all -v --remove-orphans

# Install dependencies (optional, if needed)
install-dependencies:
	npm install

# Display help
help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  up                Start Docker Compose services"
	@echo "  down              Stop Docker Compose services"
	@echo "  build             Build Docker Compose services"
	@echo "  logs              View logs of Docker Compose services"
	@echo "  ps                List Docker Compose services"
	@echo "  restart           Restart Docker Compose services"
	@echo "  clean             Remove all Docker Compose services and their data"
	@echo "  help              Display this help message"

# Default target
.DEFAULT_GOAL := help
