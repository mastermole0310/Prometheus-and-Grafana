## ==Результат установки==
![grafana](https://user-images.githubusercontent.com/95876810/167167428-2081b90f-aec0-4eb5-bbdc-f31adb80d471.jpg)

**Визуализация поминутной температуры воздуха в Ливерпуле с помощью Pushgateway, Prometheus и Grafana**.

## ==ТРЕБОВАНИЯ==
- OC Linux Ubuntu 20.04 +
- установка docker 20.10.12 +
- установка docker-compose 1.29.2 +
## ==УСТАНОВКА И ЗАПУСК==
- скопировать данный репозиторий в Visual Studio Code или другой редактор кода
- выполнить команду terraform apply
- заходим в Grafana (public ip instance:8083)
- заходим в настройки и выбираем Data source, далее add data source
- выбираем prometheus и в окне url прописываем public ip instance:8081, далее save and exit
- переходим во вкладку Explore, далее выбираем созданный data source и во вкладке metrics browse вводим push_temprature_in_Liverpool
- на экране видим график отображающий температуру воздуха в Ливерпуле

## ==АВТОР==
- Smirnov Alexey
