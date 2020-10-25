<!--
 * @Author: Weidows
 * @Date: 2020-09-12 19:54:05
 * @LastEditors: Weidows
 * @LastEditTime: 2020-10-03 11:41:21
 * @FilePath: \Githubg:\Repo\Programming-Configuration\README.md
-->
<h1 align="center">
 ⭐️ Weidow's 开发环境配置 ⭐️
</h1>

# [.vscode](.vscode/)目录里有我的 VScode 设置文件,已经搭建好:

`C++ , Python , Java , Node.js , HTML5(与配置文件非相关) , Processing` 开发环境...

# [backup](backup)里面为安装包之类的,但是太大了...所以暂无内容...

# [Data](Data)里面有不同语言的相关配置文件

- [javaRunner](Data/javaRunner.cmd)由于 CodeRunner 只能运行单文件 java 程序,于是本人改编 CodeRunner,使其勉强可以编译一个 package(如果存在 import 包外的 package 会编译失败)
  下面是"code-runner.executorMap"的关于 java 的设置,如需要使用的话需要修改下面的 javaRunner 路径
  `友情提醒`:目前本人在用 Maven + debugger for java 来编译运行,更加舒适.
  这个小魔改是本码农路上爬过的树,没帮我走远,但看到了一些异常的美景.

  "java": "javac -encoding UTF-8 -cp ../ $fileName && cd.. && cmd /c D:\\Game\\Demo\\Weidows\\.vscode\\Data\\javaRunner.cmd $dirWithoutTrailingSlash,\$fileNameWithoutExt"

- [Tinacious%20Design-color-theme](.vscode/Data/Tinacious%20Design-color-theme.json) 这是结合了 Tinacious%20Design-color-theme 的代码颜色与 CyberPunk+主题布局颜色的主题 json 文件,样式图片:
  ![样式](https://cdn.jsdelivr.net/gh/Weidows/Images/post/1/QQ截图20200822144122.jpg)

- [_pip_](Data/pip.ini)是 Python 的清华源放在 C/user/default 里

- [批量获取文件名](Data/批量获取文件名.bat) 因为 markdown 插入图片只能一张张的插入,如果想批量插入首先需要获取批量文件名(并不想用 Typora 插入,路径有局限性),通过批量光标量产出合法路径.

---

# [Java](Java)这是个 Maven 项目

- 在搭建好 JDK 后,在 src.main/java/里面写源码,Maven 自动在 Java/target/classes 里面编译出.class

# `安装步骤详情`

- 详细步骤可以访问我的一片文章查看具体参数和需要的配置更改,[`点这里,走你`](http://weidows.gitee.io/post/backup/Data/)

---

<center>

# #N.[反馈 & 出处 (Aboue me & Click me)](https://weidows.gitee.io/tags/about)

    后续会更新,同时欢迎有兴趣的提出修改意见或共同整改!

</center>
