FROM public.ecr.aws/docker/library/node:18.20.4-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

CMD npm run build

ENV NODE_ENV=production

EXPOSE 3000

CMD ["npm", "start"]
