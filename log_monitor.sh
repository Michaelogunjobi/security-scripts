#!/bin/bash
# Script: log_monitor.sh
# Purpose: Monitor logs for suspicious activity

LOG="/var/log/auth.log"
ALERT_THRESHOLD=3

echo "=============================="
echo "    LOG SECURITY MONITOR"
echo "    $(date)"
echo "=============================="

echo ""
echo "[*] Failed SSH login attempts:"
echo "───────────────────────────────"
grep "Failed password" $LOG 2>/dev/null | \
awk '{print $11}' | sort | uniq -c | sort -rn | \
while read COUNT IP
do
    if [ $COUNT -ge $ALERT_THRESHOLD ]; then
        echo "🚨 ALERT: $IP failed $COUNT times — possible brute force!"
    else
        echo "⚠️  $IP failed $COUNT times"
    fi
done

echo ""
echo "[*] Successful logins:"
echo "───────────────────────"
grep "Accepted password\|Accepted publickey" $LOG 2>/dev/null | \
tail -10

echo ""
echo "[*] New user accounts created:"
echo "───────────────────────────────"
grep "new user" $LOG 2>/dev/null | tail -5

echo ""
echo "[*] Sudo usage:"
echo "────────────────"
grep "sudo" $LOG 2>/dev/null | tail -10

echo ""
echo "=============================="
echo "     MONITORING COMPLETE"
echo "=============================="
