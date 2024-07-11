---
title: "Racket: Racket における入出力"
emoji: "🎾"
type: "idea"
topics: ["Racket", "関数型プログラミング", "標準入出力", ]
published: false
---

## はじめに

この記事では、`racket`における入出力についてまとめます。
`Racket`は、入力に`read`関数、出力に`write`/`print`/`display`の関数が使えます。

この記事では、各関数について基本的なことをことを説明し、そのほかの関数については説明しません。
詳しくは、[`Racket Reference`](https://docs.racket-lang.org/reference/input-and-output.html) を参照してください。

## 標準入出力

`Racket`の入出力関数は、標準入出力に対応しています。
'read`関数は、ポートを指定せずに呼びだすと、標準入力からデータを読み込みます。
`write`/`print`/`display`の各関数は、ポートを指定せずに呼びだすと、標準出力二データを出力します。

このため、通常の入出力関数を使った`racket`プログラムはコンソールからの入力やパイプ・リダイレクトに対応しています。

## 入力関数

### `read`の詳細

`read`関数は、入力データを記述に合わせて動的に型付けします。
たとえば、下記のように入力したデータとデータの型を返すプログラムがあります:

@[gist](https://gist.github.com/atsushifx/c6c137b8cd8c59213ac31722ded5ee14?file=echo-loop.rkt)

このプログラムを実行すると、下記のようになります:

```racket
> racket .\echo-loop.rkt

--- echo ---
input: abc
output: 'abc  -  symbol
input: 42
output: 42  -  number
input: "hello"
output: "hello"  -  string
input: #\k
output: #\k  -  character
input: [1 . 2]
output: '(1 . 2)  -  pair
input: '(1 2 3)
output: ''(1 2 3)  -  list
input: ^Z
output: #<eof>  -  unknown

```

上記のように、記述したデータに合わせて適切なデータ型が設定されています。

### ファイルからの入力

ファイルからデータを読みだすには、ファイルポートを使用します。
ファイル入力の例は、次のようになります:

```racket: fileinput.rkt
(define fin (open-input-file "hello.txt"))
(define in (read fin))
(close-input-port fin)

```

### 文字の入力

`read`関数には、文字の入力用の`read-char`関数や行入力用の`read-line`関数があります。
`read-char`関数は、標準入力から 1文字ずつ読み込み、`read-line`関数は開業までの行を読み込みます。

このとき、文字は `UTF-8`エンコードとして読み込みます。

詳しいことは、 [`Racket Reference`](https://docs.racket-lang.org/reference/Byte_and_String_Input.html)を参照してください。

## 出力関数

### `write`/`print`/`display`の違い

`write`/`print`/`display`の各関数は役割が違います。
それぞれの役割は、次の通りです:

- `write`:
  `read`で読み込んだデータを、そのままの形式で出力する。
- `print`:
  `REPL`での出力のようにデータを出力する。文字列、シンボルなどはクオートされる。
- `display`:
  画面出力用に、データを出力する。文字列型、シンボル型、文字型などはクオートしない。

出力例は、下記を参照してください:

| | `write` | `print`| `display` |
| --- | --- | --- | --- |
| 1/2 (数値型) | 1/2 | 1/2 | 1/2 |
| #\x (文字型) | #\x | #\x | x |
| "hello" (文字列型) | "hello" | "hello" | hello |
| '\|tea pot\| (シンボル型) | '\|tea pot\| | '\|tea pot\| | tea pot |
| '("I" pod) (リスト型) | '("I" pod) | '("I" pod) | I pod |
| write (procedure) | #\<procedure:write> | #\<procedure:write> | #\<procedure:write> |

### ファイルへの出力

ファイルポートを指定すると、データをファイルに出力します。
ファイル出力には、`open-output-file`を使用します。
すでにファイルが存在する場合は例外が発生します。
このとき、オプション`#:exists 'truncate`を設定するとファイルを新規データで上書きし、オプション`#:exists 'update`を指定するとファイルを更新します。

プログラム例は、次のようになります:

```racket: fileout.rkt
(define fout (open-output-file "data.txt"))    ; cause exception if file is already exist
(display "howdy" fout)
(close-output-port fout)

```

ファイルがすでに存在する場合は、次のようなエラーが発生します:

```racket
> racket fileout.rkt

open-output-file: file exists
  path: data.txt
  context...:
   body of
   "fileout.rkt"

```

上記のエラーを防ぐために、`#:exists 'truncate`を指定します:

```racket: fileout.rkt
(define fout (open-output-file "data.txt"))
(display "howdy" fout)
(close-output-port fout)

```

### 文字の出力

`read-char`に対応する形で、1文字出力用に`write-char`関数があります。
`write-char`関数は`read-char`で読み込んだ 1文字を出力します。

`read-line`関数は、通常の`write`関数を使って出力します。

## おわりに

## 参考資料

### Webサイト

- [`Racket Guide`](https://docs.racket-lang.org/guide/i_o.html):
  `Racket Guide`の入出力の章

- [`Racket Reference`](https://docs.racket-lang.org/reference/input-and-output.html):
  `Racket Reference`の入出力の章
