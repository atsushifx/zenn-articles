---
title: "WSL 2 上の Debian で  systemd を有効化する方法"
emoji: "🐧"
type: "tech"
topics: ["WSL", "Debian", "wslconf", "systemd"  ]
published: true
---

## tl;dr

WSL 2 上の Debian で systemd を有効化する方法を紹介します。
これにより、Linux デーモンを使ったソフトウェアを活用できます。

1. `/etc/wsl.conf` の `[boot]` セクションに `systemd=true` を追加
2. `wsl --terminate Debian` として、Debian を停止
3. `Windows Terminal` 上で Debian を起動

以上で、WSL2 上の Debian で systemd を使用可能になります。

## はじめに

この記事では、WSL 2[^1] 上の Debian で systemd[^2] を有効化する方法を紹介します。
systemd は Linux のサービスやプロセスを管理するツールです。

WSL2 で systemd を有効にすることで、Linux の機能を Windows上でも活用できるようになります。

[^1]: WSL: Windows Subsystem for Linux の略で、Windows 上で Linux を実行させるサブシステム
[^2]: systemd: Linux のプロセス管理および初期化システム

## 1. `/etc/wsl.conf` の設定

WSL では、`/etc/wsl.conf` を使って細かい動作を設定できます。
systemd の設定も同様です。

### 1.1 systemdの有効化

systemd を有効化するには、以下の手順で`/etc/wsl.conf`に systemd の設定を追加します。

```mermaid
graph TD
A[Debianの起動] --> B[viエディタで`/etc/wsl.conf`を開く]
B --> C[設定を追加]
C --> D[ファイルを保存]
D --> E[終了]
```

この記事では、テキストエディタ`vi`[^3]を使用して`/etc/wsl.conf`を編集し、systemd の設定を追加します。
`vi`エディタの詳しい使い方は、[Vim日本語ドキュメント](https://vim-jp.org/vimdoc-ja/)を参照してください。

次の手順にしたがって systemd を有効にします。

1. vi エディタで`/etc/wsl.conf`を編集
   `bash`で次のコマンドを実行します。

   ```bash
   sudo vi /etc/wsl.conf
   ```

   ![viエディタの起動](https://i.imgur.com/Xs4trxo.png)

2. `/etc/wsl.conf`の設定
   `/etc/wsl.conf`に次の設定を追加します

   ```conf: /etc/wsl.conf
   [boot]
   systemd=true
   ```

   ![wslconfの設定](https://i.imgur.com/JS9dMgH.png)

3. `/etc/wsl.conf`の保存
   ノーマルモード[^4]で`:wq`[^5]と入力し、ファイルを保存します。

以上で、`/etc/wsl.conf`の設定は終了です。
Debian を再起動すると、systemd が有効となります。

[^3]: `vi`: Linux上で広く使用されているテキストエディタ
[^4]: ノーマルモード: `vi`の編集モードの 1つで、コマンドを入力できるモード
[^5]: `:wq`:  `vi`エディタで編集中のファイルを保存して終了させるコマンド

## 2. Debian の再起動

ここでは、systemd を有効化するために、WSL 2 上の Debian を再起動する方法を解説します。

### 2.1. Debianを再起動する

 `Windows Terminal` [^6] で`wsl`コマンド[^7]を使い、Debian を再起動し、systemd を有効化します。

```mermaid

graph TD
A[Windows Terminalの起動] --> B[wslコマンドでDebianを停止]
B --> C[`Windows Terminal`でDebianを起動]
C --> D[終了]

```

1. Debian の停止
   `wsl`コマンドで、Debian を停止します。

   ```powershell
   wsl --terminate Debian
   ```

   ![Debian の停止](https://i.imgur.com/trnkY0S.png)

2. Debian の再起動
    `Windows Terminal`上で Debian を選択して、Debian を再起動します。

以上で、Debian の再起動は完了しました。

[^6]: `Windows Terminal`: Windows上で複数のターミナルを管理するためのアプリケーション
[^7]: `wsl`コマンド: `Windows Subsystem for Linux`を操作するためのコマンド

## おわりに

この記事では、WSL 2 上の Debian で systemd を有効化する手順を紹介しました。
systemd を有効にすることで、Linux 環境の多くのサービスやアプリケーションを Windows上でも利用できます。

開発やテスト環境が柔軟になりますので、是非 systemd を有効化し、WSL 2 を最大限に活用してください。

それでは、Happy Hacking!

## 参考資料

### systemd

- [systemd - Wikipedia](https://ja.wikipedia.org/wiki/Systemd)

### Microsoft Learn

- [WSL での詳細設定の構成](https://learn.microsoft.com/ja-jp/windows/wsl/wsl-config)
- [WSL 上で systemd を使用して Linux サービスを管理する](https://learn.microsoft.com/ja-jp/windows/wsl/systemd)

### `vi`エディタ

- [Vim日本語ドキュメント](https://vim-jp.org/vimdoc-ja/)
