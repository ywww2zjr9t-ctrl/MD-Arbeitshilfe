#!/bin/zsh
cd "$(dirname "$0")"
PORT=8765
echo "Arbeitshilfe Begutachtung MD v001"
echo "Lokaler Webserver: http://localhost:$PORT"
python3 -m http.server $PORT >/tmp/arbeitshilfe_md_v001.log 2>&1 &
PID=$!
sleep 1
open "http://localhost:$PORT"
echo "Zum Beenden dieses Fensters Ctrl+C drücken."
trap "kill $PID 2>/dev/null" EXIT INT TERM
wait $PID
