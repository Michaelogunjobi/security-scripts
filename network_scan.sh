#!/bin/bash
# Script: network_scan.sh
# Purpose: Scan network for live hosts and open ports
# Usage: ./network_scan.sh 192.168.1

NETWORK=$1

# Check if network was provided
if [ -z "$NETWORK" ]; then
    echo "Usage: ./network_scan.sh [network]"
    echo "Example: ./network_scan.sh 192.168.1"
    exit 1
fi

echo "=============================="
echo "    NETWORK SCAN REPORT"
echo "    Network: $NETWORK.0/24"
echo "    Date: $(date)"
echo "=============================="
echo ""
echo "[*] Scanning for live hosts..."
echo ""

# Loop through IP range
for i in $(seq 1 254)
do
    IP="$NETWORK.$i"
    
    # Ping each IP — 1 packet, 1 second timeout
    ping -c 1 -W 1 $IP > /dev/null 2>&1
    
    if [ $? -eq 0 ]; then
        echo "✅ HOST UP: $IP"
        
        # Check common security relevant ports
        for PORT in 22 80 443 3389 3306
        do
            timeout 1 bash -c "cat < /dev/null > \
            /dev/tcp/$IP/$PORT" 2>/dev/null
            
            if [ $? -eq 0 ]; then
                echo "   🚨 Port $PORT OPEN on $IP"
            fi
        done
    fi
done

echo ""
echo "=============================="
echo "        SCAN COMPLETE"
echo "=============================="
