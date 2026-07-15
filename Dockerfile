# Menggunakan Alpine Linux untuk memperkecil ukuran image dan meminimalkan celah keamanan (vulnerability)
FROM node:18-alpine

WORKDIR /usr/src/app

# Menyalin package manager (jika ada dependensi tambahan nanti)
COPY package*.json ./
RUN npm ci --only=production || echo "No package.json found, skipping npm install"

# Menyalin kode aplikasi
COPY app.js .

# Menggunakan user non-root bawaan image Node demi keamanan runtime
USER node

EXPOSE 3000

CMD ["node", "app.js"]