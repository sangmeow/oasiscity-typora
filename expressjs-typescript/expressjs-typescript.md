# Expressjs typescript

### Set nodeenv

```
pip install nodeenv
nodeenv --list
nodeenv --node=22.11.0 nodeenv-22.11.0
> nodeenv-18.20.0\Scripts\activate.bat
> nodeenv-18.20.0\Scripts\deactivate.bat
```

### Create a new project

```
npm init -y
npm install express dotenv uuid
npm install typescript ts-node @types/node @types/express @types/uuid --save-dev
npm install concurrently nodemon --save-dev
```

```
package name: (secretgarden-expressjs-api)
version: (1.0.0) 0.0.1
description: secretgarden-expressjs-api
entry point: (index.js) expressjs.ts
test command: npm run dev.mac
git repository:
keywords: secretgarden-expressjs-api
author: crywolf
license: (ISC)
```

#### Typescript configuration

```
{
  "compilerOptions": {
    "rootDirs": ["src"],
    "outDir": "./dist",
    "lib": ["es2020"],
    "target": "es5",
    "module": "CommonJS",
    "moduleResolution": "node",
    "strict": true,
    "esModuleInterop": true,
    "skipLibCheck": true,
    "forceConsistentCasingInFileNames": true,
    "types": ["node"],
  },
	"exclude": ["node_modules"],
	"include": ["./src/**/*.tsx", "./src/**/*.ts"]
}
```

- —watch : 변경을 감지할 파일을 지정한다.
- —exec : 실행할 명령어를 지정할 수 있다.

#### package.json

```
{
	// ...
  "main": "src/index.ts",
  "scripts": {
    "test-ts": "ts-node src/index.ts",
    "test-js": "tsc && nodemon dist/index.js",
    "build": "npx tsc",
    "start": "node dist/express.js",
    "build:start.mac": "npx tsc && node dist/express.js",
    "build:start.win": "npx tsc&& node dist/express.js",
    "dev.mac": "export NODE_ENV=dev && nodemon --watch './src/**/*.ts' --exec ts-node src/express.ts",
    "dev.win": "set NODE_ENV=dev&& nodemon --watch './src/**/*.ts' --exec ts-node src/express.ts"
  },
	// ...
}
```

#### src/express.ts

```typescript
import express, { Express, Request, Response } from 'express';
import dotenv from 'dotenv';

dotenv.config();

const app: Express = express();
const port = process.env.PORT;

app.get('/', (req: Request, res: Response) => {
  res.send('Express + TypeScript Server');
});

app.listen(port, () => {
  console.log(`⚡️[server]: Server is running at http://localhost:${port}`);
});
```

### Start server

```
> npm run dev.win
```

