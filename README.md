# Example Docker Sails

This is an example of application/ service using Docker image auto builder. Feel free to fork, submit an issue, or whatever.

## Development

1. Make sure you have docker installed on your local environment, or just following the steps provided by [docker official website](https://www.docker.com/docker-toolbox).
2. Clone this repo and go inside the project root folder, or just type `git clone https://github.com/hellowin/example-docker-sails.git && cd example-docker-sails`
3. Run `./start-dependencies.sh` from Mac or Linux (for Windows you can mocking the steps inside `start-dependencies.sh` file, or do a pull request, sorry for not supporting Windows yet).
4. Now you already have `MongoDB` installed and running on your docker, check it by `docker ps` and see MongoDB container running.
5. Run `./start-dev.sh`, wait until sails lifted, and go to `localhost:1337` or your VM where docker run when using Mac or Windows, default is `192.168.99.100:1337`.
6. Enjoy developing, sails documentation related documentation are provided at their [official website](http://sailsjs.org/documentation/).

## Testing for Production

There are 2 ways for testing on `production` environment.

1. By using docker images that already uploaded or existing local images.
2. By using local modified source code (without docker image).

### Using docker image

1. Just run `docker-compose -f docker-compose-prod.yml up`.
2. Production app. running on port `8081` and development app. running on port `8080`.

### Using local modified source code

1. Prepare and start dependencies steps described at Development steps, but replace `./start-dev.sh` with `./start-prod.sh`.
2. Production app. running on port `1337`, just like development app. but with concated, minified, and uglified assets.

## Cleaning Dependencies

When we already done developing, just run `./stop-dependencies.sh` (again, not supporting Windows yet), it will take down all running containers and shutting down running default VM when using Mac.

# License

The MIT License (MIT)

Copyright (c) 2016 Andi N. Dirgantara

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
