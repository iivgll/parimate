FROM nginx:alpine

# Копирование собранных файлов в nginx
COPY build/web /usr/share/nginx/html

# Настройка nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"] 