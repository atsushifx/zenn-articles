---
title: "Android Studio: 設定ファイルの位置を変更する"
emoji: "📱"
type: "tech" 
topics: ["Android", "AndroidStudio", "環境構築", "Windows"]
published: true
---

## tl;dr

プロパティファイル"`idea.properties`"を設定して、`Android Studio`の設定の位置を変更します。

## はじめに

プロパティファイル`idea.properties`にプロパティを設定することで、プラグインや各種設定ファイルを格納する位置を変更できます。  
ここではプロパティを設定して、ユーザーホーム下に`Android Studio`の設定をまとめます。

## 設定の位置の変更

### プロパティの設定

次に、プロパティファイル"`idea.properties`"を編集してプロパティを設定します。ファイル内の該当プロパティを設定して、`Android Studio`の設定ファイルの位置を変更します。

次の手順で、プロパティを設定します。

1. `Android Studio`の`bin`下フォルダ内にある、`idea.properties`ファイルがあります。このファイルを適当なエディタで開きます
  
2. コピーした`idea.properties`ファイルを開き、以下の記述を追加します

   ```  idea.properties
   # androidStudio設定ファイルのホーム
   idea.rc=${user.home}/.config/.androidStudio
   
   # IDEのconfigフォルダ
   idea.config.path=${idea.rcome}/config
   
   ```
  
3. 変更したファイルを保存し、エディタを終了します

以上で、プロパティの設定は終了です。
