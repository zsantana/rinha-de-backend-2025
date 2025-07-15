# Rinha 2025 - Crystal Version

A high-performance payment processing system built with Crystal, featuring circuit breaker pattern for resilient external API calls.

## Architecture

- **HTTP Server**: Handles payment creation and summary endpoints using Kemal
- **Consumer**: Watches MongoDB changes and processes payments with circuit breaker
- **Circuit Breaker**: Latency-based fallback mechanism using TPei/circuit_breaker shard
- **MongoDB Integration**: Stores requested and processed payments using Cryomongo

## Dependencies

- **Kemal**: HTTP server framework
- **Cryomongo**: MongoDB driver for Crystal
- **Circuit Breaker**: Resilient external API calls
