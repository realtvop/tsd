# Start tailscaled without tun
tailscaled --tun=userspace-networking &
sleep 10
tailscale up --auth-key=$TS_AUTHKEY --advertise-exit-node &
