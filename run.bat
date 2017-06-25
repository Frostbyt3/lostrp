@echo off
rmdir /s /q cache
TIMEOUT /T 1
start CitizenMP.Server.exe %*