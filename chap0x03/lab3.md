# Systemd命令及实战  
## 1.实验要求
  * 用asciinema 录制 [systemd入门教程：命令篇]和[systemd入门教程：实战篇]  
  * 完成本章课件自查清单  
## 2.实验环境  
* 使用LVM分区的ubuntu18.04  
* asciinema
## 3.录制视频链接
* [systemd入门教程：命令篇]  

[![asciicast](https://asciinema.org/a/7M9oGaahuf4v6X0iDg8JqBNIR.svg)](https://asciinema.org/a/7M9oGaahuf4v6X0iDg8JqBNIR)   

* [systemd入门教程：实战篇]   

[![asciicast](https://asciinema.org/a/kX6xvcA2z0f2kuxWuCSngVaJ4.svg)](https://asciinema.org/a/kX6xvcA2z0f2kuxWuCSngVaJ4)
## 4.本章完成后的自查清单
* **如何添加一个用户并使其具备sudo执行程序权限？**  
  * adduser 用户名（创建完之后有自己的家目录）  
  * useradd 用户名（仅创建用户，创建完之后没有家目录）
  * sudo usremod -a -G sudo 用户名
* **如何将一个用户添加到一个用户组？**
  * sudo usermod -a -G 用户组名 用户名  
* **如何查看当前系统的分区表和文件系统详细信息？**   
  * df -h
  * sudo fdisk -l
* **如何实现开机自动挂载Virtualbox的共享目录分区？**  
   * 在虚拟机共享文件夹里加上共享目录分区（此时不要选自动挂载）  
   ```  
    cd /mnt  
  sudo mkdir lab3 share  
  cd lab3/
  mkdir linux-lab3-share  
  sudo vim etc/fstab  
    最后一行加入 linux-lab3-share	/mnt/lab3/linux-lab3-share	vboxsf 	rw,auto	0	0    
    ``` 
    * 重启
    * 也可以在挂载共享文件夹的时候勾选 自动挂载
  * 另：  
  ```    
  sudo mkdir /mnt/lab3   
  sudo mount -t vboxsf linux-lab3-share   /mnt/lab3  
  在 /etc/rc.local中加入 mount -t vboxsf linux   /mnt/lab3   
  ```

* **基于LVM（逻辑分卷管理）的分区如何实现动态扩容和缩减容量？**    
   * 扩容：sudo lvextend -L 3g 卷组名/逻辑卷名 
   * 缩减：sudo lvreduce -L 2g 卷组名/逻辑卷名
* **如何通过systemd设置实现在网络连通时运行一个指定脚本，在网络断开时运行另一个脚本？**  
  ```      
     ExecStartPost=脚本1
     ExecStopPost=脚本2
     systemctl daemon-reload  
     systemctl start systemd-networked.service      
     ```  

* **如何通过systemd设置实现一个脚本在任何情况下被杀死之后会立即重新启动？实现杀不死？**  
   * 打开该脚本的配置文件，配置文件主要放在/usr/lib/systemd/system目录，也可能在/etc/systemd/system目录。
   * 在service区块找到restart字段，将其设置为always,这样无论该脚本因为什么原因退出，它总是会重启。
   * systemctl daemon-reload  
     systemctl start 脚本名  
## 5.问题及解决方法：
* 无法执行 sudo timedatectel set-time  
  **原因**: 该虚拟机时钟自动同步功能开启  
  **解决**：sudo timedatectl set-ntp false  
* 安装了apache2却显示没有httpd服务  
  **原因**：参考了一名博主简明的说法，老版apache里的httpd.service对应新版里的apache2.service  

