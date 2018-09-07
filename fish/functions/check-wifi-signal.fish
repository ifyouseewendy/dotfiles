# based on the article http://shiroyasha.io/measuring-the-strength-of-a-wifi-connection.html
function check-wifi-signal
  while true
    set -l out (/System/Library/PrivateFrameworks/Apple*.framework/Versions/Current/Resources/airport -I)

    set -l rssi  (echo $out | rb -l split[1].strip) # range 0 - -100, 0 is the best
    set -l noise (echo $out | rb -l split[5].strip) # ragne 0 - ~120, -120 is the best

    echo RSSI: $rssi, Noise: $noise, Quality: (math $rssi - $noise) # the larger the better

    sleep 1
  end
end
