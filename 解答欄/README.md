# KKran

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

**Flexible Answer Field Generator for Tests / 試験・テスト用解答欄作成パッケージ**

---

## Overview / 概要

`KKran` is a LaTeX package designed for generating answer fields used in tests and exams. The package name originates from the Japanese word **"欄" (ran)**, which means a small area or field. It is fully compatible with both horizontal and vertical text layouts.<br>
`KKran` は、テストや試験で作成される解答欄を生成するためのパッケージです。パッケージ名は「解答欄」などの「欄」に由来しています。横書き・縦書きの両方のフォーマットに完全対応しています。

- **Version**: 1.2.1
- **Date**: 2026-09-30
- **Author**: Kosei Kawaguchi (a.k.a. KKTeX)
- **License**: MIT
- **Repository**: [https://github.com/KKTeX/KKran](https://github.com/KKTeX/KKran)
- **Support**: p.c.aces1056@gmail.com

---

## Key Features / 特徴

- **Answer Field Generation / 解答欄の自動生成**
  - Easily create structured areas for students to write their answers.
  - 試験問題の解答スペースを、コマンド一つで簡単に作成できます。

- **Multi-Directional Support / 縦書き・横書き両対応**
  - Works seamlessly in both horizontal and vertical writing modes.
  - 日本語の縦書き（tate-gaki）環境でも、崩れることなく適切な解答欄を出力します。

- **Integration with KKsymbols / KKsymbolsとの連携**
  - Requires `KKsymbols` 2.3.1 or later. Automatic lowercase sizing is enabled by default; options explicitly selected before loading `KKran` are preserved.
  - `KKsymbols` 2.3.1 以降が必要です。小文字の自動調整は既定で有効ですが、`KKran` より先に指定したオプションは維持します。

- **Roman numerals / ローマ数字**
  - `\Rrnum{8}` produces uppercase `VIII`; `\Rrnum*{8}` produces lowercase `viii`.
  - `\Rrnum{8}` は大文字 `VIII`、`\Rrnum*{8}` は小文字 `viii` を出力します。
  - Before putting lowercase Roman numerals into `\マークシート`, set a common reference with `KKsymbols`, for example `{\kksref{\Rrnum*{6}} \マークシート{...}{...}}`. The built-in `ロ小` numbering applies this reference automatically.
  - 小文字ローマ数字を `\マークシート` に入れる場合は、`{\kksref{\Rrnum*{6}} \マークシート{...}{...}}` のように `KKsymbols` の共通基準を先に設定してください。組み込みの `ロ小` 番号では自動的に設定されます。

---

## Prerequisites / 前提条件

> This package is **LuaLaTeX-only**.  
> 本パッケージは **LuaLaTeX専用** です。

**Dependencies / 依存パッケージ:**
- `calc`, `tikz`, `xcolor`, `KKsymbols` (>= 2.3.1), `kvoptions`, `luacode`

---

## Usage / 使用方法

For detailed usage and examples, please refer to the documentation file: `kkran-doc.tex`.<br>
具体的な使用方法や例については、ドキュメントファイル `kkran-doc.tex` を参照してください。
