- Show all Wi-Fi profiles
```
netsh wlan show profiles
```

- Show Wi-Fi profile info
```
netsh wlan show profile name="name"
```

- Show Wi-Fi password
```
netsh wlan show profile name="name" key=clear
```

- Delete Wi-Fi profile
```
netsh wlan delete profile name="name"
```
