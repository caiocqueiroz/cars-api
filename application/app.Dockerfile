FROM node:14 
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .


# RUN apt-get update && apt-get install -y default-mysql-client
# COPY wait-for-db.sh /usr/wait-for-db.sh
# RUN chmod +x /usr/wait-for-db.sh

EXPOSE 3000 
CMD ["node", "index.js"]
