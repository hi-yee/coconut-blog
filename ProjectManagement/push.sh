#!/bin/bash
message=$1

if [[ $message = "" ]];
then
echo "请输入commit 参数"
exit
fi

#当前md名称
now_book="projectManagement.md"
#cp的文件名称
book="2020-04-13-my-$now_book"
#中间bak文件名
book_bak="2020-04-13-my-bak-$now_book"

coconut_path="../../hi-yee.github.io/_posts"

#更新自己的分支
echo "更新开始！"
cp $now_book $coconut_path/$book
git add ./
git commit -m "$message"
git push 

echo "更新完成！"
echo "更新博客开始！"

cd $coconut_path
cp $book $book_bak

#添加固定的头
echo "---
layout:     post                    # 使用的布局（不需要改）
title:      11系统集成项目管理工程师教程              # 标题
subtitle:   论如何称为一个一个优秀的project manager     #副标题
date:       2020-04-18              # 时间
author:     coconut                      # 作者
header-img:    #这篇文章标题背景图片
catalog: true                       # 是否归档
categories: 项目管理
tags:                               #标签
    - 学习
---" > $book 
#写入内容
cat $book_bak >> $book
#干掉备份文件
rm -f $book_bak
git add ./
git commit -m "$message"
git push origin master
echo "更新博客结束！"
