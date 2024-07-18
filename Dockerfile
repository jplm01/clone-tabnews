# Use a imagem oficial do Node.js LTS Hydrogen como imagem base
FROM public.ecr.aws/docker/library/node:lts-hydrogen

# Defina o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copie o package.json e o package-lock.json (se existir)
COPY package*.json ./

# Instale as dependências do projeto
RUN npm install

# Copie todos os arquivos do projeto para o diretório de trabalho no contêiner
COPY . .

# Construa o projeto Next.js
RUN npm run build

# Defina a variável de ambiente para a produção
#ENV NODE_ENV=production

# Exponha a porta que a aplicação Next.js irá rodar
EXPOSE 3000

# Comando para rodar a aplicação Next.js
CMD ["npm", "start"]
