#!/bin/bash


# swap amount in megabytes
swap_size=512

printf "#### Creating Swap..."
/bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=${swap_size}
/sbin/mkswap /var/swap.1
/sbin/swapon /var/swap.1
