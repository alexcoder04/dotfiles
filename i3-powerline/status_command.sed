s/+I3_STATUS_COMMAND+/status_command \/home\/alex\/.local\/bin\/bumblebee-status -m datetime shell:bitcoin cpu sensors memory battery nic traffic amixer -p interval="3" bitcoin.command="bitcoinprice +symbol" bitcoin.interval="15m" cpu.warning="25" cpu.critical="50" memory.usedonly="True" memory.warning="20" memory.critical="30" memory.interval="5s" nic.format="" nic.exclude="lo,enp,virbr" nic.interval="5s" traffic.showname="False" battery.interval="10s" -t dracula-powerline/
