---
title: "Education: Racket言語における論理演算子"
emoji: "🎾"
type: "idea"
topics: ["プログラミング言語", "Racket", "演算子", "勉強", "学習" ]
published: false
---

## はじめに

この記事では、LISP系の関数型言語である Racket 言語における論理演算子について紹介します。
論理演算子とは、真偽値(`#t`,`#f`)を扱う演算で、プログラミング上では制御構造でよく使われます。

## Racket 言語とは

Racket 言語は LISP系の関数型言語の 1つで、1990年代中ごろに立ち上げられた`PLT Project`から産まれました。Racket には、DrRacket という独自の開発環境があり、インストールしてすぐに開発がはじめられます。

## 論理演算子

論理演算は、論理演算のための演算子です。論理演算は真偽値(`#t`\`#f`)を扱う演算で、プログラミング上では制御構造でよく使います。

論理演算子には、次のものがあります。

| 演算子 | 説明 | 例 |
| --- | --- | --- |
| not | 否定 : 引数の値を反転する | `(not #t)` → `#f` |
| and | 論理積 : 引数がすべての真なら真 | '(and #t #t)` → `#t` |
| or | 論理和 : 引数のいずれかの値が真なら真 | `(or #t #f)` → `#t` |
| xor | 排他的論理和 : 2つの引数の真偽が異なれば真 |'(xor #t #t)` → `#f` |

### not演算子

not 演算子は、与えられた引数の真偽を反転します。すなわち、真(`#t`)が与えられたときは偽(`#f`)、偽(`#f`)があたえられたときは(`#t`)を返します。

真偽値表:

| 入力:a | 出力: `(not a)` |
| --- | --- |
| `#t` | `#f` |
| `#f` | `#t` |

#### not演算子と引数の数

not 演算子は引数を 1つしかとれません。引数が 2つ以上の場合は、エラーが発生します。

``` Racket
> (not #t)
#f

> (not #f #t)
not: arity mismatch;
 the expected number of arguments does not match the given number
  expected: 1
  given: 2

```

### and演算子

and 演算子は、すべての引数が真(`#t`)のときに真(`#t`)を返します。

真偽値表:

| 入力 a | 入力 b | 出力: `(and a b)` |
| --- | --- | --- |
| `#t` | `#t` | `#t` |
| `#t` |  `#f` | `#f` |
| `#f` |  `#t` | `#f` |
| `#f` |  `#f` | `#f` |

#### and演算子と引数

and 演算子の引数は 1つだけの場合も、3つ以上の場合も可能です。

引数が 1つの場合はその引数の値が、3つ以上の場合はすべての引数の論理積が返ります。

``` Racket
> (and #t)
#t

> (and #t #t #t)
#t

```

### or演算子

or 演算子は、引数のいずれかの値が真(`#t`)のときに真(`#t`)を返します

真偽値表

| 入力 a | 入力 b | 出力: `(or a b)` |
| --- | --- | --- |
| `#t` | `#t` | `#t` |
| `#t` |  `#f` | `#t` |
| `#f` |  `#t` | `#t` |
| `#f` |  `#f` | `#f` |

#### or演算子と引数

or 演算子の引数は 1つだけの場合も、3つ以上の場合も可能です。

引数が 1つの場合はその引数の値が、3つ以上の場合はすべての引数の論理和が返ります。

``` Racket
> (or #f)
#f

> (or #f #f #f)
#f

```

### xor演算子

xor 演算子は、2つの真偽値が違うときに(`#t`)を出力します。
あるいは、右側の値が真('#t')のときは左側の真偽を反転する、とも表されます。

真偽値表

| 入力 a | 入力 b | 出力: `(xor a b)` |
| --- | --- | --- |
| `#t` | `#t` | `#f` |
| `#t` |  `#f` | `#t` |
| `#f` |  `#t` | `#t` |
| `#f` |  `#f` | `#f` |

#### xor演算子と引数

xor 演算子には、引数が 2つ必要です。引数が 1つだけ、あるいは 3つ以上の場合はエラーが発生します

``` Racket
> (xor #t #f)
#t

> (xor #f)
xor: arity mismatch;
 the expected number of arguments does not match the given number
  expected: 2
  given: 1

> (xor #f #f #t)
xor: arity mismatch;
 the expected number of arguments does not match the given number
  expected: 2
  given: 3

```

## さいごに

以上が、Racket における論理演算子の説明です。
論理演算は、プログラミングの制御で大事になる演算です。ぜひ、理解しておきましょう。

それでは、Happy Hacking!

## 参考資料

### 本

- [Racket Programming the Fun Way](https://www.amazon.co.jp/dp/1718500823)
- [How to Design Programs](https://www.amazon.co.jp/exec/obidos/ASIN/0262534800/)

### Web

- Racket Documentation:<https://docs.racket-lang.org/>
