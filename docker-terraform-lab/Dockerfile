# ใช้ Node.js เวอร์ชัน 18 เป็น Base Image
FROM node:18

# กำหนด Working Directory ภายใน Container
WORKDIR /usr/src/app

# คัดลอก package.json และติดตั้ง Dependencies
COPY package.json ./
RUN npm install

# คัดลอกไฟล์ทั้งหมดไปยัง Container
COPY . .

# เปิดพอร์ต (หากแอปใช้ HTTP Server)
EXPOSE 3000

# คำสั่งสำหรับรันแอปพลิเคชัน
CMD ["npm", "start"]
