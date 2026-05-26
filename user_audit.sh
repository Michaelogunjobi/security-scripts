#!/bin/bash

echo "============================================"
echo "	    USER SECURITY AUDIT"
echo "	$(date)"
echo "============================================"

echo ""
echo "[*] ALL USERS ON SYTEM:"
echo "________________________"
cat /etc/passwd | cut -d: -f1, 3,7

echo ""
echo "[*] USERS WITH LOGIN SHELLS:"
echo "_____________________________"
grep "/bin/bash\|/bin/sh" /etc/passwd | cut -d: -f1

echo ""
echo "[*] USERS WITH SUDO PRIVILEGES:"
echo "_________________________________"
grep -v "^#" /etc/sudoers | grep "ALL"

echo ""
echo "[*] RECENTLY LOGGED IN USERS:"
echo "_________________________________"
last | head -10

echo ""
echo "[*] FAILED LOGIN ATTEMPTS:"
echo "____________________________"
grep "Failed password" /var/log/auth.log 2>/dev/null | tail -10

echo ""
echo "[*] CURRENTLY LOGGED IN:"
echo "__________________________"
who

echo ""
echo"=================================="
echo "      AUDIT COMPLETE"
echo "================================="
