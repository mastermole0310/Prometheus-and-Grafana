#!/bin/bash
curl "https://api.openweathermap.org/data/2.5/weather?lat=53.4106&lon=-2.9779&appid=4a4cb45fd0745193707af3e5bea86d93&units=metric" | jq '.main.temp' | awk -F, '{print "push_temprature_in_Liverpool" gauge, $1}' | curl --data-binary @- "http://localhost:8082/metrics/job/prometheus/instance/my_instance"
