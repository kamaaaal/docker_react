from node:alpine as builder
workdir /app
copy package.json .
run npm install
copy . /app
run npm run build

# new from instruction ends the previous from block, but can access files from its filesystem
from nginx:alpine
# --from=builder specifies the image to copy files from
copy --from=builder /app/build /usr/share/nginx/html 
#default start command start nginx here