# Build Phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# /app/build <-- all the build stuff

# One Phase only contains one "FROM" statement

# Run Phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# Start of nginx will automatically start our container

