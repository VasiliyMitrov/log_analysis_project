#!/bin/bash

# Подсчитать общее количество запросов
total_requests=$(wc -l < access.log)

# Подсчитать количество уникальных IP-адресов
unique_ips=$(awk '{print $1}' access.log | sort | uniq | wc -l)

# Подсчитать количество запросов по методам (GET, POST и т.д.)
methods=$(awk '{print $6}' access.log | tr -d '"' | sort | uniq -c | awk '{print $2, $1}')

# Найти самый популярный URL
popular_url=$(awk '{print $7}' access.log | sort | uniq -c | sort -rn | head -n 1)

# Создать отчет
echo "Отчет выполнен: Митров Василий" > report.txt
echo "Отчет о логе веб-сервера" >> report.txt
echo "=========================" >> report.txt
echo "Общее количество запросов: $total_requests" >> report.txt
echo "Уникальные IP-адреса: $unique_ips" >> report.txt
echo "Запросы по методам:" >> report.txt
echo "$methods" >> report.txt
echo "Самый популярный URL: $popular_url" >> report.txt
