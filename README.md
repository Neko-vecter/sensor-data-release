# Sensor Data Release

### Deploy Configure File 

``` shell
cd ~
git clone https://github.com/Neko-vecter/sensor-data-release.git

bash ~/sensor-data-release/tools/deploy.sh
```

Add config below in `printer.cfg`

```
[include sensor-data/*.cfg]
```

The config in `moonraker.conf` should be automatically added if using deploy tool.
``` 
[update_manager sensor-data-release]
type: git_repo
path: ~/sensor-data-release
origin: 
primary_branch: main
managed_services: klipper
```

### About config in `sensor_type`

```
sensor_type: <sensor>
```
The sensor can be able found in `./sensor-data`. The file name without the `.cfg` is the sensor profile.
