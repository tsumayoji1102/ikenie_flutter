.PHONY: help clean format analyze test build run

help:
	@echo "Available commands:"
	@echo "  build-web      - build web and move to docs folder for github pages"

build-web:
	flutter clean
	flutter pub get
	flutter build web --base-href /ikenie_flutter/
	rm -rf docs/*
	mv build/web docs/
