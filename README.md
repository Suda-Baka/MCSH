# MCSH

[[English]](https://github.com/Suda-Baka/MCSH/blob/main/README_en.md)

<img src="https://github.com/Suda-Baka/MCSH/blob/main/mcsh.jpg" width = 50%>

在Kindle上创建与运行Minecraft JAVA服务器。

## 先决条件

确保你的Kindle已进行了越狱并安装了`KUAL`。

## 安装

在releases中下载`mcsh.zip`下载至计算机。连接你的Kindle到计算机并将文件解压到Kindle目录下。启动KUAL，依次点击`MCSH`、`MCSH Tools`、`Install`。

## 使用

安装完成后点击`Start`运行kterm，在终端中输入`mcsh -h`来获取更多帮助。首次运行会提示用户创建`swapfile`以获取虚拟内存，一般建议不要超过300M，如果你的设备内存够大也可以忽略此建议。
    
在运行服务器之前建议先查看本机的IP地址，端口（PORT）默认为`25565`，如有需要可自行到`extensions/mcsh/bin/server/服务器的名字/server.properties`文件中修改。在游戏中输入`{IP}:{PORT}`来连接至服务器。

MCSH运行的服务器目前只能实现**局域网联机**，**但可以通过端口转发来进行公网联机**。
    
可自行访问[Minecraft Wiki](https://zh.minecraft.wiki/w/Tutorial:%E6%9E%B6%E8%AE%BEJava%E7%89%88%E6%9C%8D%E5%8A%A1%E5%99%A8#%E7%AB%AF%E5%8F%A3%E8%BD%AC%E5%8F%91)来查看具体教程。
    
但家用路由器一般使用动态IP，使用IP绑定可以使设备的IP固定，该功能也在路由器后台中设置。
   
> [!NOTE]
> 开启端口映射后可能会导致你的设备受到攻击，所以请不要将你的服务器IP发送给任何不信任的人。

## 自定义
    
在终端中启动服务器比较麻烦，可以通过编辑`menu.json`文件来实现快捷启动：

打开`extensions/mcsh/menu.json`文件，将以下代码中的`[SERVER_NAME]`修改为你创建的服务器名，`[NAME]`即该服务器菜单中的名字，自行修改（**请勿使用中文**），`"priority"`为该菜单条目的显示优先级，数值越小优先级越高。

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

若要继续添加，将以下代码编辑后在24行与25行之间插入。

```json
			{
				"name": "[NAME]",
				"priority": 2,
				"action": "./bin/kterm/kterm -e 'mcsh -s [SERVER_NAME]'"
			},
```
