#!/usr/bin/env bash
# Check UPS client connection to UPS server
# Exit 1 = problem (Task Scheduler sends email), Exit 0 = OK

DSM_VER="$(synogetkeyvalue /etc.defaults/VERSION majorversion)"

# Get UPS server's IP address
if [[ "$DSM_VER" -ge "7" ]]; then
    # DSM 7
    UPS_SERVER="ups@$(synogetkeyvalue /usr/syno/etc/ups/synoups.conf upsslave_server)"
else
    # DSM 6
    UPS_SERVER="ups@$(grep -E '^MONITOR ' /usr/syno/etc/ups/upsmon.conf | cut -d'@' -f2 | cut -d' ' -f1)"
fi
if [[ -z "$UPS_SERVER" ]]; then
    echo "Failed to get UPS server's IP address!"
    exit 2
fi

result=$(/usr/bin/upsc "$UPS_SERVER" ups.status 2>/dev/null)

if echo "$result" | grep -qE '^(OL|OB|LB|CHRG|DISCHRG|RB|BYPASS|CAL|OFF|OVER|TRIM|BOOST)'; then
    echo "UPS connection OK: $result"
    exit 0
else
    echo "ERROR: UPS connection to $UPS_SERVER failed!"
    echo "ERROR: Response: $result"
    grep -i 'upsmon' /var/log/messages | tail -2
    exit 1
fi

