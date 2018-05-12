set -e

red='\e[21;31m%s\e[0m\n'
green='\e[21;32m%s\e[0m\n'
yellow='\e[21;33m%s\e[0m\n'
blue='\e[21;34m%s\e[0m\n'
magenta='\e[21;35m%s\e[0m\n'
cyan='\e[21;36m%s\e[0m\n'
white='\e[21;97m%s\e[0m\n'

printf "$yellow"  "[1/5] >> removing node_modules/ folder"
printf "$white" "===================================="
cd frontend/
rm -rf node_modules/

printf "$yellow" "[2/5] >> install dependencies via npm install"
printf "$white" "===================================="
npm i --log-level warn

printf "$yellow" "[3/5] >> build static files, and copy them to dist/ folder"
printf "$white" "===================================="
npm run build --silent

printf "$yellow" "[4/5] >> run docker-compose"
printf "$white" "===================================="
cd ..
docker-compose down && docker-compose -f docker-compose-production.yml build

printf "$green" "[5/5] >> Starting HTTP Server on port 8080"
printf "$green" "done: >> Navigate to http://localhost:8080 to see your app running in Docker"
printf "$green" "done: >> Starting backend Server on http://localhost:3333"
docker-compose -f docker-compose-production.yml up -d