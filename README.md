# Vue js boilerplate

# dev:
development environment - Docker
frontend - Vue-cli
backend - node.js

# production:
development environment - Docker
frontend - nginx
backend - node.js

___

# Initialize dev mode
```bash
docker-compose build
docker-compose up
```

# Initialize for production
```bash
./build.sh
```

# stop production server
```bash
docker-compose down --remove-orphans
```