s/+I3_STATUS_COMMAND+/status_command \/home\/alex\/.local\/bin\/bumblebee-status -m datetime shell:bitcoin amixer cpu memory battery nic traffic kernel -p interval="2" bitcoin.command="bitcoinprice +symbol" bitcoin.interval="15m" cpu.warning="25" cpu.critical="50" memory.usedonly="True" memory.warning="20" memory.critical="30" memory.interval="5s" nic.format="" nic.exclude="lo,enp,virbr" nic.interval="5s" traffic.showname="False" battery.interval="10s" kernel.interval="1h" -t dracula-powerline/
