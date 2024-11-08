# Stage 1: Build the React app
FROM node:14 AS build
WORKDIR /app

# Copy package files and update npm to latest for compatibility with lockfileVersion@3
COPY package.json package-lock.json ./
RUN npm install -g npm@latest  # Update npm to the latest version
RUN npm install

# Copy the rest of the application code and build the app
COPY . .
RUN npm run build

# Stage 2: Serve the app with Nginx
FROM nginx:alpine
# Copy the build output to Nginx's default directory
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 to access the app
EXPOSE 80

# Run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
