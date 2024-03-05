# Docker-compose local development boilerplate for Laravel
This is a boilerplate to be used **only** in local environment for quick containerization. Use at your own risk.

## File structure
`src` => Main directory, where your project should be  
`config` => Configuration directory for different services to be used in `docker-compose.yml file`  
`.env.example` => Project global config file  
`init.sh` => Init script for the entire app (NB: Only for first time use! It will override `.env` if there's such file in project root)  
`docker-compose.yml` => Main docker-compose config for local environment



## Setup
1. Clone the repository
2. Copy/paste your Laravel project in `src` directory - this directory contents will be linked to containerized `app` service.
3. Add execution rights to `init.sh` file
4. Run `./init.sh` to copy `.env.example` to `.env` which will be used by Docker to name containers properly. It will also launch the containers.
5. Compare the database credentials throughout mysql init sql file, project root `.env` and your Laravel app `.env`
6. When all that is done, launch `http://localhost` to bless your eyes with your Laravel app.

## Running commands within containers
For now, if you want to run any commands through appropriate containers, you have to prefix your commands with `docker-compose exec [service] [command you want to run]`, for example, `docker-compose exec app php artisan migrate`.

There's also an option to just go into container with `bash` (or whatever shell the container posesses) and run commands you need, like `docker-compose exec bash` and in container `php artisan migrate`.

## To-do for now
- Command delegator script for running commands within appropriate containers