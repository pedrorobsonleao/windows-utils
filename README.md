# windows-utils
Scripts .bat utils to automate simple tasks in the windows environment


## freedisk.bat

* [freedisk](scrips/freedisk.bat) - show free bytes in disk


*usage*

```shell
c:\scripts>freedisk.bat

  usage: freedisk <driveletter> (eg.: freedisk c)
```

*sample*

```shell
c:\scripts>freedisk.bat c
volume c: - 49 GB total space / 11406028800 byte(s) free
```

## rmlist.bat

* [rmlist](scripts/rmlist.bat) - read a list with directories and find files with access periods more than period.

*usage*

```shell
c:\scripts>rmlist.bat

usage: rmlist <period> <file_list> (eg.: rmlist 10 c:\file_list.txt)
```

*sample*

```shell
c:\scripts>rmlist.bat 10 c:\scripts\list.txt >list.log
```

*sample list*

```shell
c:\scripts>type c:\scripts\list.txt
E:\LOG
E:\DetailedLog
C:\log\API.Service.Monitor.HourlyTasks
```

*sample output*

```shell

c:\scripts>type list.log
04/05/2020-22:59 find files in directory "E:\LOG" with a period longer than "10" days

04/05/2020-22:59 find files in directory "E:\DetailedLog" with a period longer than "10" days

04/05/2020-22:59 find files in directory "C:\log\API.Service.Monitor.HourlyTasks" with a period longer than "10" days

04/05/2020-22:59 remove "C:\log\API.Service.Monitor.HourlyTasks\api.service.monitor.hourly-tasks.log_error_2015.12.31.log"
04/05/2020-22:59 remove "C:\log\API.Service.Monitor.HourlyTasks\api.service.monitor.hourly-tasks.log_error_2016.01.26.log"
04/05/2020-22:59 remove "C:\log\API.Service.Monitor.HourlyTasks\api.service.monitor.hourly-tasks.log_error_2016.01.27.log"
04/05/2020-22:59 remove "C:\log\API.Service.Monitor.HourlyTasks\api.service.monitor.hourly-tasks.log_error_2016.01.29.log"
04/05/2020-22:59 remove "C:\log\API.Service.Monitor.HourlyTasks\api.service.monitor.hourly-tasks.log_error_2016.01.30.log"
```