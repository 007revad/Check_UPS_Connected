# Check UPS Connected

<a href="https://github.com/007revad/Check_UPS_Connected/releases"><img src="https://img.shields.io/github/release/007revad/Check_UPS_Connected.svg"></a>
[![Github Releases](https://img.shields.io/github/downloads/007revad/Check_UPS_Connected/total.svg)](https://github.com/007revad/Check_UPS_Connected/releases)
![Badge](https://hitscounter.dev/api/hit?url=https%3A%2F%2Fgithub.com%2F007revad%2FCheck_UPS_Connected&label=Visitors&icon=github&color=%23198754&message=&style=flat&tz=Australia%2FSydney)
[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.com/paypalme/007revad)
[![](https://img.shields.io/static/v1?label=Sponsor&message=%E2%9D%A4&logo=GitHub&color=%23fe8e86)](https://github.com/sponsors/007revad)
<!--- [![committers.top badge](https://user-badge.committers.top/australia/007revad.svg)](https://user-badge.committers.top/australia/007revad) --->

### Description

DSM 7.3.2 seems to have a bug where it does not send an email, or set a desktop notification, if the UPS is not connected.

I have it scheduled to run once a day on each Synology NAS that is an UPS client, or has an UPS directly connected.

The script works in DSM 7 and DSM 6.

### Download the script

1. Download the latest version zip file from https://github.com/007revad/Check_UPS_Connected/releases
2. Save the download zip file to a folder on the Synology.
3. Unzip the zip file.

### To run the script via task scheduler

See [How to run from task scheduler](https://github.com/007revad/Check_UPS_Connected/blob/main/how_to_run_from_scheduler.md)

### To run the script via SSH

[How to enable SSH and login to DSM via SSH](https://kb.synology.com/en-global/DSM/tutorial/How_to_login_to_DSM_with_root_permission_via_SSH_Telnet)

```YAML
sudo -s /volume1/scripts/check_ups_connected.sh
```

**Note:** Replace /volume1/scripts/ with the path to where the script is located.

### Troubleshooting

If the script won't run check the following:

1. Make sure you download the zip file and unzipped it to a folder on your Synology (not on your computer).
2. If the path to the script contains any spaces you need to enclose the path/scriptname in double quotes:
   ```YAML
   sudo -s "/volume1/my scripts/check_ups_connected.sh"
   ```
3. Make sure you unpacked the zip or rar file that you downloaded and are trying to run the check_ups_connected.sh file.
4. Set the script file as executable:
   ```YAML
   sudo chmod +x "/volume1/scripts/check_ups_connected.sh"
   ```

### Screenshots

<p align="center">Email from USP server</p>
<p align="center"><img src="/images/ups_server_email.png"></p>

<br>

<p align="center">Email from UPS client</p>
<p align="center"><img src="/images/ups_client_email.png"></p>

<br>

<p align="center">SSH result from USP server</p>
<p align="center"><img src="/images/ups_server_ssh.png"></p>

<br>

<p align="center">SSH result from UPS client</p>
<p align="center"><img src="/images/ups_client_ssh.png"></p>
