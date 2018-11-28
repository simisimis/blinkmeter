#Blinkmeter

Electricity meter blink counter nodemcu lua code for ESP8266.

## What it does:
- Upon starting it establishes connection to provided wifi ssid
- It counts electricity meter flashes and stores them in counter variable
- It opens a socket and exposes counter.
- Once prometheus scrapes the value, counter gets reset to 0.

## Installation

### Download nodemcu firmware
- I use this site to build custom nodemcu firmware: [nodency-build,com](https://nodemcu-build.com)

### Flash your ESP8266 controller
```bash $ esptool.py --port /dev/ttyUSB0 --baud 115200 write_flash --flash_size=detect 0 /path/to/nodemcu.bin ```

### Download ESPlorer
- You can get it at [Esplorer site](https://esp8266.ru/esplorer/)
- Extract and launch with java 1.7+ ```bash $ java -jar ESPlorer.jar```

### Upload lua files
- move location_example.lua to location.lua and change to your ssid/psk
- upload files through esplorer.
