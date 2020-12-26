# Docker files for Debmatic
Running a virtual CCU3 in a docker container? Works.


# Running the software:
make build
docker-compose up
open http://localhost:8081


# Hardware:
``` sudo dmesg````

[63911.473432] usb 2-9: USB disconnect, device number 3
[69121.076958] usb 2-9: new full-speed USB device number 4 using xhci_hcd
[69121.231221] usb 2-9: New USB device found, idVendor=0403, idProduct=6f70, bcdDevice= 6.00
[69121.231225] usb 2-9: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[69121.231227] usb 2-9: Product: HB-RF-USB
[69121.231229] usb 2-9: Manufacturer: Alexander Reinert
[69121.231231] usb 2-9: SerialNumber: A94J21B5


# References:
- https://homematic-forum.de/forum/viewtopic.php?t=53514
- https://github.com/alexreinert/debmatic