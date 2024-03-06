npm init -y
npm install express
npm install @types/express --save-dev
npm install typescript --save-dev
npx tsc --init //typescript config file 
// set "rootDir": "./src" and "outDir": "./dist" 
npm install ts-node-dev --save-dev // nodemon for TS
// rimraf ./dist && tsc remove dist folder then transpile it.
docker compose -f docker-compose.prod.yml up --build -d
docker exec -it docker-ts-api-1 sh
"scripts": {
    "dev": "ts-node-dev --poll src/index.ts",
    "build": "rimraf ./dist && tsc", 
    "start": "npm run build && node dist/index.js"
},