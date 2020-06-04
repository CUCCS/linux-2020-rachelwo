# shell 脚本编程实验报告
* ### 实验内容：  
  * 任务一：用bash编写一个图片批处理脚本，实现以下功能：  
    - [x] 支持命令行参数方式使用不同功能  
    - [x]     支持对指定目录下所有支持格式的图片文件进行批处理  
    - [x]    支持以下常见图片批处理功能的单独使用或组合使用  
    - [x]   支持对jpeg格式图片进行图片质量压缩  
    - [x]    支持对jpeg/png/svg格式图片在保持原始宽高比的前提下压缩分辨率  
    - [x] 支持对图片批量添加自定义文本水印  
     - [x]    支持批量重命名（统一添加文件名前缀或后缀，不影响原始文件扩展名）  
      - [x]   支持将png/svg图片统一转换为jpg格式图片   
    * [图片链接](img)     
 * 任务二：用bash编写一个文本批处理脚本，对以下附件分别进行批量处理完成相应的数据统计任务：  
       2014世界杯运动员数据  
      - [x] 统计不同年龄区间范围（20岁以下、[20-30]、30岁以上）的球员数量、百分比  
      - [x] 统计不同场上位置的球员数量、百分比  
      - [x] 名字最长的球员是谁？名字最短的球员是谁？  
      - [x] 年龄最大的球员是谁？年龄最小的球员是谁？ ```   
     * [答案链接](task2.md)
  * 任务二：用bash编写一个文本批处理脚本，对以下附件分别进行批量处理完成相应的数据统计任务：  
Web服务器访问日志  
    - [x] 统计访问来源主机TOP 100和分别对应出现的总次数  
    - [x] 统计访问来源主机TOP 100 IP和分别对应出现的总次数  
    - [x] 统计最频繁被访问的URL TOP 100   
    - [x] 统计不同响应状态码的出现次数和对应百分比  
    - [x] 分别统计不同4XX状态码对应的TOP 10 URL和对应出现的总次数  
    - [x] 给定URL输出TOP 100访问来源主机   
* [shell脚本](shell)   
* ### 实验前准备： 
  * 安装增强件，通过 ``` mount -t vboxsf img /mnt/shell``` 命令，将指定主机文件挂载到虚拟机挂载目录下（因为是上一章的任务，具体过程就不再赘述）
  * 安装imagemagick 图像处理工具 ``` sudo apt install imagemagick ``` (安装前更新一下)   
* ### 实验遇到的问题：  
  * 编写脚本过程中，时常出现输出结果不符合预期的现象，主要是shell脚本编程语法不熟（比如忽略了空格导致该函数无法调用等等），后结合shellcheck和课上的脚本调试方法进行改正  
  * 将虚拟机里的脚本push到远程仓库时报错，查询报错信息，发现是没有在虚拟机上配置SSH key  
* ### 参考资料：
  - https://github.com/CUCCS/linux-2019-FukurouNart  
  - [github如何改动已经commit过的文件](https://www.cnblogs.com/xym4869/p/11947181.html)  
  - [github添加SSH key](https://blog.csdn.net/qq_29232943/article/details/53523434)  
  - [linux sed](https://www.runoob.com/linux/linux-comm-sed.html)  
  - [linux awk](https://www.runoob.com/linux/linux-comm-awk.html)  
  - [imagemagick 入门教程](https://www.jianshu.com/p/310d833d9a25)  
  - https://github.com/CUCCS/2015-linux-public-tyushua
  