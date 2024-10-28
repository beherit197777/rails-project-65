# README

[![hexlet-check](https://github.com/beherit197777/rails-project-64/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/beherit197777/rails-project-65/actions/workflows/hexlet-check.yml)
[![Rails](https://github.com/beherit197777/rails-project-64/actions/workflows/ci.yml/badge.svg)](https://github.com/beherit197777/rails-project-65/actions/workflows/ci.yml)

Deployed application link: https://rails-project-65-p78s.onrender.com

<!-- This is a . The project includes features such as . -->

## Prerequisites

Ruby version: 3.2.2
Rails version: 7.x
Development/Test Database: sqlite3
Production Database: PostgreSQL

## System Dependencies

Node.js and Yarn are required for managing frontend assets.

## Configuration

1. Clone the repository:
```bash
git clone https://github.com/beherit197777/rails-project-65.git
cd rails-project-65
```
2. Install required gems, install JavaScript dependencies:
```bash
make setup
```

## Database Setup

1. Create the database:
```bash
rails db:create
```
2. Run the migrations:
```bash
rails db:migrate
```
3. Seed the database:
```bash
rails db:seed
```

## Running the Application

1. Start the Rails server:
```bash
make start
```
2. Navigate to http://localhost:3000 to view the application.

## How to Run the Test Suite

The project uses minitest and power_assert for testing. To run the tests:
```bash
make test
```

## Linting

- Rubocop: Ensure your code adheres to the style guide.
- Slim Lint: Check your Slim templates for any issues.
```bash
make lint
```