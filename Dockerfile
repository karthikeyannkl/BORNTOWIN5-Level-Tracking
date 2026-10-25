FROM node:20-alpine
WORKDIR /app
COPY . .
RUN if [ -d "/app/BORNTOWIN5" ]; then cp -rn /app/BORNTOWIN5/* /app/ 2>/dev/null || true; fi && \
    mkdir -p /app/src && \
    for f in d1-node-binding.js d1-repository.js b5-engine.js worker.js; do \
      if [ -f "/app/$f" ] && [ ! -f "/app/src/$f" ]; then cp "/app/$f" "/app/src/$f"; fi; \
    done && \
    npm install express nodemailer
EXPOSE 10000
CMD ["node","server.js"]
