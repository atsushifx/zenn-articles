---
title: "WSL:  apt を使ったDebianのアップグレード方法"
emoji: "🐧"
type: "tech"
topics: ["WSL", "Debian", "apt", "パッケージマネージャー" ]
published: false
---

## はじめに

この記事では、WSL (`Windows Subsystem for Linux`) 上で動く Debian を最新のバージョンにアップグレードする方法を説明します。
Debian のアップグレードは、セキュリティパッチの適用や新機能の利用を可能にし、システムの安定性とパフォーマンスを向上させます。WSL を利用するエンジニアにとって、この手順は重要です。

## 1. パッケージマネージャー `apt` とは

Debian は、パッケージ管理のために`apt` (Advanced Package Tool) というツールを使用しています。
`apt` を使用することで、Debian は提供するソフトウェアをパッケージとして管理しています。
これにより、ソフトウェアのインストール、アンインストール、バージョンアップなどが容易に行えます。

### 1.1. aptとソースリスト

Debian では、パッケージ管理のために`apt` というツールが使用されています。
apt では、ソースリストを参照してパッケージの情報を取得しています。

公式のソースリストは`/etc/apt/sources.list`に、その他のミラーのソースリストは`/etc/apt/sources.list.d/`下の`<mirrorname>.list`となります。

### 1.2. 公式ソースリスト

apt では、`/etc/apt/sources.list`にパッケージ一覧の source を記述します。
インストール直後なら、次のようになっています。

```bash: /etc/apt/sources.list
# official sources.list

deb http://deb.debian.org/debian bookworm main
deb http://deb.debian.org/debian bookworm-updates main
deb http://security.debian.org/debian-security bookworm-security main
deb http://ftp.debian.org/debian bookworm-backports main

 ```

## 2. ミラーの追加

### 2.1. cdnミラーの追加

cdn ミラーを追加は、以下の手順で行います。

1. [`Debian mirrors backed by Fastly CDN`](https://deb.debian.org/)にアクセスして、適切な`source`をコピーします

2. `/etc/apt/sources.list.d/cdn.list`ファイルにコピーした内容を貼り付けます
   内容は、次の通りになります

   ```bash: /etc/apt/sources.list.d/cdn.list
   # cdn mirror

   deb http://cdn-fastly.deb.debian.org/debian stable main
   deb http://cdn-fastly.deb.debian.org/debian-security stable-security main
   deb http://cdn-fastly.deb.debian.org/debian-security-debug stable-security-debug main

   ```

以上で、`cdn`ミラーの追加は完了です。

### 2.2 日本のミラーの追加

日本のミラーの追加は、以下の手順で行います。

1. [CDN 対応ミラーの設定](https://www.debian.or.jp/community/push-mirror.html)にアクセスし、ここの `source` をコピーします

2. `/etc/apt/sources.list.d/ja-jp.list`ファイルに上記の`source`を貼り付けます
   内容は、次の通りになります

   ```bash: /etc/apt/sources.list.d/ja-jp.list
   # cdn mirror from Debian JP

   deb http://ftp.jp.debian.org/debian/ bookworm main contrib non-free non-free-firmware
   deb http://ftp.jp.debian.org/debian/ bookworm-updates main contrib non-free non-free-firmware
   deb http://ftp.jp.debian.org/debian/ bookworm-backports main contrib non-free non-free-firmware
   #deb-src http://ftp.jp.debian.org/debian/ bookworm main contrib non-free non-free-firmware
   #deb-src http://ftp.jp.debian.org/debian/ bookworm-updates main contrib non-free non-free-firmware
   #deb-src http://ftp.jp.debian.org/debian/ bookworm-backports main contrib non-free non-free-firmware

   ```

以上で、日本ミラーの追加は完了です。

## 3. Debian のアップグレード

### 3.1. ソースリストのアップデート

次のコマンドを実行して、パッケージリストをアップデートします。

```bash
sudo apt update
```

実行結果は、次のようになります。

```bash
atsushifx@ys:/etc/apt/sources.list.d# sudo apt update
Get:1 http://deb.debian.org/debian bookworm InRelease [151 kB]
Get:2 http://security.debian.org/debian-security bookworm-security InRelease [48.0 kB]
  .
  .
  .
Get:39 http://cdn-fastly.deb.debian.org/debian-security-debug stable-security-debug/main amd64 Packages [46.8 kB]
Fetched 46.7 MB in 7s (6,318 kB/s)
Reading package lists... Done
Building dependency tree... Done
14 packages can be upgraded. Run 'apt list --upgradable' to see them.
N: Repository 'http://deb.debian.org/debian bookworm InRelease' changed its 'Version' value from '12.0' to '12.1'

atsushifx@ys:/etc/apt/sources.list.d#

```

### 3.2. Debianのアップグレード

次のコマンドを実行して、Debian をアップグレードします。

```bash
sudo apt upgrade -y
```

実行結果は、次のようになります。

  ``` bash
 atsushifx@ys:/etc/apt$ sudo apt upgrade -y
Reading package lists... Done
Building dependency tree... Done
Calculating upgrade... Done
    .
    .
    .
Setting up udev (252.12-1~deb12u1) ...
invoke-rc.d: could not determine current runlevel
Setting up sudo (1.9.13p3-1+deb12u1) ...
invoke-rc.d: could not determine current runlevel
Processing triggers for libc-bin (2.36-9+deb12u1) ...
ldconfig: /usr/lib/wsl/lib/libcuda.so.1 is not a symbolic link

atsushifx@ys:/etc/apt/sources.list.d#

  ```

  以上で、Debian のアップグレードは終了です。

## おわりに

この記事では、ソースリストをアップデートし`Debian`をアップグレードする方法について説明しました。
今後、定期的に`Debian`をアップグレードすることで安定して WSL を使うことができます。

これにより、効率的なプログラミング環境が実現できるでしょう。
それでは、Happy Hacking!

## 参考資料

### Webサイト

- [第8章 Debian パッケージ管理ツール](https://www.debian.org/doc/manuals/debian-faq/pkgtools.ja.html)
