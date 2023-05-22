#!/bin/sh
# Put a name on variable from argv
rootpassword=$1

# Run mysql_secure_installation and answer
mysql_secure_installation << EOF

y
$rootpassword
$rootpassword
y
n
y
y
EOF
