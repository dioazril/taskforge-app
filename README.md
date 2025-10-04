# TaskForge App

A modern, local‑first Todo app built with Flutter, Riverpod 3 (codegen), and Drift for reactive, type‑safe persistence. It features rich task modeling (priority, status, dates, tags, reminders, subtasks), smooth UI with implicit animations, and a clean, testable architecture

## Features
  - Rich task model: title, description, dates (start/due/completed), status, priority, tags, reminders, recurrence, and checklists.
  
  - Reactive state with Riverpod 3 and generated providers for type-safe updates and composable filters/sorters.
  
  - Local persistence using Drift (SQLite) with DAOs, transactions, batch writes, and background database execution.
  
  - Simple, responsive UI with search, filters, bottom-sheet forms, AnimatedSwitcher transitions, and swipe-to-delete.
  
  - Linting and codegen pipeline: riverpod_lint, custom_lint, build_runner, and mapper generation for models.

## Tech stack
  - Flutter, Dart, Material 3 UI.
  
  - Riverpod 3, riverpod_annotation, codegen with riverpod_generator.
  
  - Drift (SQLite), drift_dev, drift_flutter, sqlite3_flutter_libs.
  
  - dart_mappable for model mapping (toJson/fromJson/copyWith/equality).
  
  - uuid for unique IDs.

## Getting Started

1. Prerequisites

  - Flutter SDK installed and configured (stable channel recommended).

  - Dart SDK compatible with the project’s constraints.

2. Clone and install

    ``
    git clone https://github.com/<username>/taskforge-app.git
    ``
    
    ``
    cd taskforge-app
    ``
    
    ``
    flutter pub get
    ``
    
    ``
    dart run build_runner watch -d
    ``
    
    ``flutter run``


## Scripts
  Generate once: ``dart run build_runner build --delete-conflicting-outputs``
  
  Continuous generation: ``dart run build_runner watch -d``
  
  Analyze and lint: flutter analyze and custom lint rules via riverpod_lint/custom_lint.


