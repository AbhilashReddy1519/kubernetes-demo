#use a small base image
FROM node:20-alpine AS base
WORKDIR /app

COPY package*.json ./
RUN npm ci --omit=dev
#copy app source
COPY . .

# Run as non-root user (alpine node image includes user 'node' with uid 1000)
USER node
EXPOSE 3000
ENV NODE_ENV=production
CMD [ "npm", "start" ]