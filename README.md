# ITCS4151Docker
A workspace to hold everything required to run code for ITCS4151

to get rviz to work:
Mac:
You need an X11 server **XQuartz**
Launch XQuartz and Settings > Security > Allow Connections from network clients (TURN ON)
relaucnh XQuartz for that to take effect
run the following to add localhost to the list of allowed connections: 
```bash
xhost + 127.0.0.1
```



Windos:
or **VcXsrv** on windows

Linux:
allow access to the X server with
```bash
xhost +local:docker
```