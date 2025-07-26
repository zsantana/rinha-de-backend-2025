# Anibal Rinha 2025 - Payment Processing System

A high-performance payment processing system built for Rinha de Backend 2025.

## Stack

- **Rust** - Core language with Actix Web framework
- **PostgreSQL** - Payment records storage
- **Redis** - Message queuing and caching
- **Docker** - Containerization and orchestration

## Architecture

Microservices architecture with:
- Core payment processing services (producer)
- Consumer service for external payment processors
- Database layer with optimized PostgreSQL configuration
- Redis-based message queue for async processing 