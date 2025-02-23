#!/bin/bash

# Собираем образ для правильной платформы
docker build --platform linux/amd64 -t parimate-web .

# Сохраняем образ
docker save parimate-web > parimate-web.tar

# Копируем на сервер
scp parimate-web.tar root@185.112.102.11:/root/

# Выполняем команды на сервере
ssh root@185.112.102.11 '
    echo "Останавливаем старые контейнеры..."

    # Останавливаем конкретный контейнер parimate-web
    if docker ps -a | grep -q parimate-web; then
        echo "Принудительно останавливаем и удаляем parimate-web..."
        docker rm -f parimate-web
    fi

    # Дополнительно проверяем и останавливаем все контейнеры на порту 8080
    if docker ps -q --filter publish=8080 | grep -q .; then
        echo "Останавливаем контейнеры на порту 8080..."
        docker stop $(docker ps -q --filter publish=8080)
        echo "Удаляем остановленные контейнеры..."
        docker rm $(docker ps -aq --filter publish=8080)
    fi

    echo "Загружаем новый образ..."
    docker load < parimate-web.tar

    echo "Запускаем новый контейнер..."
    docker run -d --name parimate-web -p 8080:80 parimate-web

    echo "Проверяем статус нового контейнера..."
    docker ps | grep parimate-web
'

# Удаляем локальный архив
rm parimate-web.tar

# Добавляем права на выполнение
chmod +x deploy.sh