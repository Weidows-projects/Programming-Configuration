'
' @?: *********************************************************************
' @Author: Weidows
' @Date: 2021-01-29 12:10:11
' @LastEditors: Weidows
' @LastEditTime: 2021-08-12 18:01:09
' @FilePath: \Programming-Configuration\local\start.vbs
' @Description: 开机运行
' @!: *********************************************************************
'

' aria2
CreateObject("WScript.Shell").Run "aria2c --conf-path=D:\Game\Scoop\persist\aria2\conf",0
