#!/bin/bash

# Heroku $PORT dynamically assign karta hai
/usr/local/bin/gotty --permit-write --reconnect --port ${PORT:-8080} /bin/bash