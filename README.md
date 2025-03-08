# README

# Guild Manager

Guild Manager is a Ruby on Rails web application designed to help manage guilds, track member contributions, and set timers for various events.

## Features
- User authentication from Discord and roles (Admin, Ledger Manager)
- Player and guild membership tracking
- Event/Group scheduling and sign-ups (TODO)
- Guild bank/inventory tracking (TODO)
- Discord integration (TODO)
- Users can create timers to track various node/mob respawns.

## Installation

### Prerequisites
Ensure you have the following installed:
- Ruby (3.0+ recommended)
- Rails (6.0+ recommended)
- PostgreSQL or MySQL database

### Setup
```sh
# Clone the repository
git clone https://github.com/teknofire/guild.git
cd guild-manager

# Install dependencies
bundle install

# Setup the database
rails db:create
rails db:migrate
rails db:seed

# Start the server
bin/dev
```

## Configuration
- Copy `.env.example` to `.env` and update necessary environment variables.
- Setup credentials for discord token/secrets `rails credentials:edit`

## Deployment
For production deployment, consider using:
- **Heroku**: `git push heroku main`

## Contributing
1. Fork the repository.
2. Create a feature branch: `git checkout -b feature-name`
3. Commit your changes: `git commit -m 'Add new feature'`
4. Push to the branch: `git push origin feature-name`
5. Submit a pull request.

