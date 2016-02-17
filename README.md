# docker-stress-ng
Lighweight docker image for stress-ng


## stress-ng

![stress-ng](http://kernel.ubuntu.com/~cking/stress-ng/stress-ng-small.png)

The documentation is [here](http://kernel.ubuntu.com/~cking/stress-ng/)

## Build

```
$ docker build -t stress-ng .
```

## Run

Display usages :

```
$ docker run -it --rm stress-ng
stress-ng, version 0.03.11

Usage: stress-ng [OPTION [ARG]]
 --h,  --help             show help
...
```

Run stress workers :

```
$ docker run -it --rm stress-ng --cpu 4 --vm 2 --hdd 1 --fork 8 --switch 4 --timeout 15s --metrics-brief
stress-ng: info: [1] dispatching hogs: 4 cpu, 8 fork, 1 hdd, 4 switch, 2 vm
stress-ng: info: [1] successful run completed in 15.13s
stress-ng: info: [1] stressor      bogo ops real time  usr time  sys time   bogo ops/s   bogo ops/s
stress-ng: info: [1]                          (secs)    (secs)    (secs)   (real time) (usr+sys time)
stress-ng: info: [1] cpu                805     15.04      3.64      0.00        53.51       221.15
stress-ng: info: [1] fork              9306     14.99      0.02      0.38       620.66     23265.00
stress-ng: info: [1] hdd              28023     15.06      0.00      0.92      1861.10     30459.78
stress-ng: info: [1] switch        10512290     15.05      1.44      5.44    698329.59   1527949.13
```

## Docker hub

[Repository](https://hub.docker.com/r/lorel/docker-stress-ng/)

## License

[MIT](LICENSE)
