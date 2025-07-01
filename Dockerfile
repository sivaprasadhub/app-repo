FROM node:18-alpine
COPY app.js .
CMD ["node", "app.js"]
