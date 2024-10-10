# ruyi-nvchecker

部署时定时运行 ``check_and_update.sh``。

参考 crontab 配置：

```
@hourly ~/workspace/ruyi-nvchecker/check_and_update.sh >/dev/null 2>&1
```

