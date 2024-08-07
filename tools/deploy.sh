#!/bin/bash

# config 
repo_dir="${HOME}/sensor-data-release"
config_home="${HOME}/printer_data/config"
klipper_config="${config_home}/printer.cfg"
moonraker_config="${config_home}/moonraker.conf"

cd ~
ln -sf "${repo_dir}/sensor-data" "${config_home}"

# Add update in moonrkaer.conf
config_update_moonraker=$(grep -c '\[update_manager sensor-data-release\]' ${moonraker_config} || true)
if [ "${config_update_moonraker}" -eq 0 ]; then
    echo "" >> "${moonraker_config}"
    cat "${repo_dir}/tools/moonraker_update.conf" >> "${moonraker_config}"
    moonraker_restart=1
else
    echo -e "${WARNING} it have [update_manager sensor-data-release] in config file"
fi

if [ "${moonraker_restart}" -eq 1 ]; then
    sudo systemctl restart moonraker.service
fi
