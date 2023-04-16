---
title: "Education: Racket言語初心者向けの論理演算子ガイド"
emoji: "🎾"
type: "idea"
topics: ["プログラミング言語", "Racket", "演算子", "勉強", "学習" ]
published: true
---

## はじめに

この記事では、 Racket 言語初心者向けに論理演算子について紹介します。
論理演算子は真偽値(`#t`,`#f`)を操作する演算で、制御構造でよく使われます。

## 真偽値とは

真偽値は、真(true:`#t`)と偽(false:`#f`)の 2つの値からなる型です。プログラミングでは、条件判断やループの繰り返し判断に使われます。真偽値は 2種類しかないので、計算が簡単であるのも特徴です。

## 論理演算とは

論理演算とは、真偽値を操作する演算であり、プログラミングにおいて非常に重要です。プログラム上で真偽値を扱う場合には必ず論理演算が行われます。

### 論理演算子

Racket における論理演算子は、以下の 4つがあります。

| 演算子 | 説明 | 例 |
| --- | --- | --- |
| not | 否定 : 引数の真なら偽､議なら真 | `(not #t)` → `#f` |
| and | 論理積 : 複数の引数がすべて真なら真 | `(and #t #t)` → `#t` |
| or | 論理和 : 複数の因数のうちのどれかが真なら真 | `(or #t #f)` → `#t` |
| xor | 排他的論理和 : 2つの引数の真偽が異なれば真 | `(xor #t #t)` → `#f` |

### not演算子

not 演算子は、引数の真偽を反転します。すなわち、真(`#t`)が与えられたときは偽(`#f`)、偽(`#f`)があたえられたときは(`#t`)を返します。

真偽値表:

| 入力: `a` | 出力: `(not a)` |
| --- | --- |
| `#t` | `#f` |
| `#f` | `#t` |

#### 引数の数

not 演算子は引数を 1つだけとります。引数が 2つ以上の場合は、エラーが発生します。

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

and 演算子は、複数の引数をとり、すべての引数が真であれば真を返します。

真偽値表:

| 入力: 'a' | 入力: 'b' | 出力: `(and a b)` |
| --- | --- | --- |
| `#t` | `#t` | `#t` |
| `#t` |  `#f` | `#f` |
| `#f` |  `#t` | `#f` |
| `#f` |  `#f` | `#f` |

#### 引数の数

and 演算子は 1つ以上の引数を持ちます。

引数が 1つの場合はその引数の値が、2つ以上の場合はすべての引数の論理積が返ります。

``` Racket
> (and #t)
#t

> (and #t #t #t)
#t

> (and)
#t

```

**重要事項**

- 引数がない場合は、真(`#t`)を返す

### or演算子

or 演算子は、複数の引数をとり、すべての引数の論理和を返します

真偽値表:

| 入力: 'a` | 入力: `b` | 出力: `(or a b)` |
| --- | --- | --- |
| `#t` | `#t` | `#t` |
| `#t` |  `#f` | `#t` |
| `#f` |  `#t` | `#t` |
| `#f` |  `#f` | `#f` |

#### 引数の数

or 演算子の引数は、 1つ以上の引数を持ちます。

引数が 1つの場合はその引数の値が、2つ以上の場合はすべての引数の論理和が返ります。

``` Racket
> (or #f)
#f

> (or #f #f #f)
#f

> (or)
#f

```

**重要事項**

- 引数がないときは、偽(`#f`)を返します。

### xor演算子

xor 演算子は、2つの引数をとり、2つの引数の排他的論理和を返します。
2つの引数が違うときは真(`#t`)と覚えるか、右側の値が真('#t')のときは左側の真偽を反転すると覚えましょう。

真偽値表:

| 入力: `a` | 入力: `b` | 出力: `(xor a b)` |
| --- | --- | --- |
| `#t` | `#t` | `#f` |
| `#t` |  `#f` | `#t` |
| `#f` |  `#t` | `#t` |
| `#f` |  `#f` | `#f` |

#### 引数の数

xor 演算子は 2つの引数をとり、2つの引数の真偽が違うときに真(`#t`)を返します。

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

**重要事項**

- 引数が 1つだけ、あるいは 3つ以上の場合はエラーが発生します

## さいごに

以上が、Racket における論理演算子の説明です。
論理演算は、プログラミングの制御で大事になる演算です。ぜひ、理解しておきましょう。

それでは、Happy Hacking!

## 参考資料

### 本

- [Racket Programming the Fun Way](https://www.amazon.co.jp/dp/1718500823)
- [How to Design Programs](https://www.amazon.co.jp/exec/obidos/ASIN/0262534800/)

### Web

- [Racket Documentation](https://docs.racket-lang.org/)
