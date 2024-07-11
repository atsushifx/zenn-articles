---
title: "Racket: Racket における入出力"
emoji: "🎾"
type: "idea"
topics: ["Racket", "関数型プログラミング", "標準入出力", ]
published: false
---

## はじめに

この記事では、関数型プログラミング言語である`Racket`の基本的な入出力関数について、具体的なサンプルプログラムを用いて説明します。
これにより、`Racket`プログラムで入出力を実装し、実際のプロジェクトに応用できます。

ここでは、`Racket`の主要な入出力関数を紹介し、それぞれの機能と使用例を説明しています。
詳細は [`Racket Reference`](https://docs.racket-lang.org/reference/input-and-output.html) を参照して、その他の関数や使用例を確認してください。

## 1. ポートと標準入出力

`Racket`の入出力関数は、ポートを指定して使用できます。
ポートは、ファイル、ネットワークなどの入出力を統一して管理する`Racket`の重要なオブジェクトです。
`Racket`の入出力関数は、ポート越しにデータを入力、出力します。
ポートを指定しないときは、標準入力/標準出力ポートが使用されます。

`read`関数は、ポートを指定しない場合、標準入力からデータを読み込みます。
`write`, `print`, `display`の各関数は、ポートを指定しない場合、標準出力にデータを出力します。

通常の入出力関数を使った (ポートを指定しない) `Racket`プログラムは、コンソールからの入力やパイプ・リダイレクトに対応しています。
これにより、ユーザーはプログラムの入出力を柔軟に操作できます。

## 2. 入力関数

### `2.1 read`関数の詳細

`read`関数は、入力データを`Racket`のデータ型として解釈して返します。
入力データが`Racket`のデータとして正しくない場合、エラーが発生します。
たとえば、リストの`(`が`)`ではなく`]`で閉じられている場合に、エラーが発生します。

下記のプログラムは、ユーザーからの入力を読み取り、その入力とデータ型を出力します。
`EOF (End of File)` (`Windows`では、`Ctrl+Z`キー)を入力すると、終了します。

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

### 2.2 ファイルからの入力

ファイルからデータを読み取るには、ファイルポートを使用します。
ファイル入力の例は、次のようになります:

```racket: fileinput.rkt
(define fin (open-input-file "data.txt"))
(define data (read fin))
(printf "read data: ~a\n" data)
(close-input-port fin)

```

### 2.3 文字の入力

`read`関数には、文字入力用の`read-char`関数や行入力用の`read-line`関数があります。
`read-char`関数は、標準入力から 1文字ずつ読み込み、`read-line`関数は改行までの 1行を読み込みます。

このとき、文字は`UTF-8`エンコードで読み込まれます。

詳細は、 [`Racket Reference`](https://docs.racket-lang.org/reference/Byte_and_String_Input.html)を参照してください。

## 3. 出力関数

### 3.1 `write`/`print`/`display`の違い

`write`,`print`,`display`の各関数は役割が違います。
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

### 3.2 ファイルへの出力

ファイルポートを指定すると、データをファイルに出力します。
ファイル出力には、`open-output-file`を使用します。

ファイルがすでに存在する場合、`open-output-file`関数は例外を発生させますが、`#:exists 'truncate`オプションを指定することで回避できます。
このとき、`Racket`は、既存のファイルの内容をすべて消去し、新しい内容で上書きします。
`'truncate`の代わりに、`#:exist 'can-update`が指定できます。
この場合、ファイルの内容は消去せず、新しい内容で上書きします。

プログラムは、次のようになります:

```racket: fileout.rkt
(define fout (open-output-file "data.txt"))    ; cause exception if file is already exist
(display "howdy" fout)
(close-output-port fout)

```

ファイルがすでに存在する場合は、次のようなエラーが発生しますが、`#:exist 'truncate`オプションで回避できます:

```racket
> racket fileout.rkt

open-output-file: file exists
  path: data.txt
  context...:
   body of
   "fileout.rkt"

```

上記のエラーを回避するために、`#:exists 'truncate`を指定します:

```racket: fileout.rkt
(define fout (open-output-file "data.txt" #:exist 'truncate))
(display "howdy" fout)
(close-output-port fout)

```

### 3.3 文字の出力

`read-char`に対応する形で、1文字出力用に`write-char`関数があります。
`write-char`関数は`read-char`で読み込んだ 1文字を出力します。

`read-line`関数は、通常の`write`関数を使って出力します。

## おわりに

この記事では、`Racket`の入出力関数について基本的なことを説明しました。
これらの関数を駆使することで、外部からのデータ入力などに対応した実践的なプログラムを作成できます。

`Racket`の学習を深め、関数型プログラミング言語の技能を向上させ、より洗練したプログラムを書けるようになりましょう。

それでは、Happy Hacking!

## 技術用語と注釈

技術用語について、その注釈を箇条書きにします。

- `read`関数:
  入力されたデータを、`Racket`のデータとして解釈し、型付けされたデータとして返す関数。

- `write`関数:
  `Racket`のデータ型を元の形式で出力する関数。

- `print`関数:
  `Racket`のデータを`REPL`で使用される形式で出力する関数。

- `display`関数:
  データをクオートしないシンプルな形式で出力する関数。

- `ポート`:
  データを関数を通じて入出力するための、`Racket`のオブジェクト。

- `ファイルポート`:
  ファイルへの入出力を行なうためのポート。

## 参考資料

### Webサイト

- [`Racket Guide`](https://docs.racket-lang.org/guide/i_o.html):
  `Racket Guide`の入出力の章

- [`Racket Reference`](https://docs.racket-lang.org/reference/input-and-output.html):
  `Racket Reference`の入出力の章
