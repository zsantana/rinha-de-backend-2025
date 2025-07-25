#!/bin/bash
k6 run --summary-export "./logs/k6-$(date +%Y-%m-%dH%H-%M-%S).log" ../../rinha-test/rinha.js
