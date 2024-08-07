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