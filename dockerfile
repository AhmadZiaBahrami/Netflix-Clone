FROM node:20.10.0-alpine

WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy application files
COPY . .

# Build the application
RUN npm run build

# Run Prisma generate
RUN npx prisma generate

# Expose port
EXPOSE 3000

# Start the application
CMD ["npm", "start"]

