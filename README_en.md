# MCSH

[[简体中文]](https://github.com/Suda-Baka/MCSH/blob/main/README.md)

<img src="https://github.com/Suda-Baka/MCSH/blob/main/mcsh.jpg" width = 50%>

Create and run a Minecraft JAVA server on Kindle.

## Prerequisites

Make sure your Kindle is jailbroken and has `KUAL` installed.

## Installation

Download `mcsh.zip` from the releases section to your computer. Connect your Kindle to your computer and extract the files to the Kindle directory. Launch `KUAL`, then click `MCSH`, `MCSH Tools` and finally `Install`.

## Usage

After installation, click `Start` to run kterm. In the terminal, enter `mcsh -h` to get more help. The first time you run it, you will be prompted to create a `swapfile` for virtual memory. It is generally recommended not to exceed 300MB, but if your device has enough memory, you can ignore this suggestion.

Before running the server, it is recommended to check the local IP address. The default port (PORT) is `25565`, which can be modified in the `extensions/mcsh/bin/server/{server name}/server.properties` file if needed. In the game, enter `{IP}:{PORT}` to connect to the server.

The server running with MCSH currently only supports **LAN play**, **but can be accessed over the internet via port forwarding**.

You can visit the [Minecraft Wiki](https://minecraft.wiki/w/Tutorial:Setting_up_a_Java_Edition_server) for a detailed tutorial.

However, home routers generally use dynamic IP addresses, and using IP binding can fix the device’s IP. This feature can be set in the router’s backend.

>**Enabling port forwarding may expose your device to attacks, so please do not share your server’s IP with anyone you do not trust.**

## Customization

Starting the server from the terminal can be inconvenient, so you can enable quick start by editing the `menu.json` file:

Open the `extensions/mcsh/menu.json` file and modify the following code. Replace `[SERVER_NAME]` with the name of the server you created, and `[NAME]` with the name that will appear in the server menu. The "priority" value indicates the display priority of the menu item—the smaller the number, the higher the priority.

```json
{
	"items": [
	{
		"name": "MCSH",
		"items": [
		{
			"name": "Start",
			"action": "./bin/kterm/kterm",
			"exitmenu": false
		},
		{
			"name": "MCSH Tools",
			"items": [
			{
				"name": "Install",
				"if": "\"/usr/bin/mcsh\" -f!",
				"priority": 998,
				"exitmenu": false,
				"refresh": true,
				"action": "./bin/mcsh --install"
			},
			{
				"name": "Uninstall",
				"priority": 999,
				"action": "./bin/kterm/kterm -e'mcsh --uninstall'"
			},
			{
				"name": "[NAME]",
				"priority": 2,
				"action": "./bin/kterm/kterm -e 'mcsh -s [SERVER_NAME]'"
			}
			]
		}
		]
	}
	]
}
```

If you wish to add more, edit the following code and insert it between lines 24 and 25.

```json
			{
				"name": "[NAME]",
				"priority": 2,
				"action": "./bin/kterm/kterm -e 'mcsh -s [SERVER_NAME]'"
			},
```
