FROM mcr.microsoft.com/windows/servercore/iis:windowsservercore-ltsc2019
COPY startup.ps1 .

ENTRYPOINT ["powershell", "-file", "startup.ps1"]