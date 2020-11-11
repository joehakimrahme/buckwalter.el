[![MELPA](https://melpa.org/packages/buckwalter-badge.svg)](https://melpa.org/#/buckwalter)

Buckwalter.el
=============

هاي عَالَم

This package provides functions to write arabic unicode text using
latin script letters. It uses the [Buckwalter
transliteration](www.qamus.org/transliteration.htm) table for this.


The package provides 2 interactive functions:

* `buckwalter-transliterate`: replaces latin letters with arabic
  equivalents.
* `buckwalter-transliterate-reverse`: replaces arabic letters with
  latin equivalents.

These functions work on text selection or, if not provided, on the
current paragraph.


Buckwalter transliteration table
--------------------------------

For quick reference here's the transliteration table:


Arabic Letters | ء | آ | أ | ؤ | إ | ئ | ا | ب | ة | ت | ث | ج | ح |
---------------|---|---|---|---|---|---|---|---|---|---|---|---|---|
Latin Letters  | ' | \| | > | & | < | } | A | b | p | t | v | j | H |

Arabic Letters | خ | د | ذ | ر | ز | س | ش | ص | ض | ط | ظ | ع | غ |
---------------|---|---|---|---|---|---|---|---|---|---|---|---|---|
Latin Letters  | x | d | * | r | z | s | $ | S | D | T | Z | E | g |

Arabic Letters | ـ | ف | ق | ك | ل | م | ن | ه | و | ى | ي |
---------------|---|---|---|---|---|---|---|---|---|---|---|
Latin Letters  | _ | f | q | k | l | m | n | h | w | Y | y |


Arabic Letters | ً | ٌ | ٍ | َ | ُ | ِ | ّ | ْ | ٰ | ٱ | ؟ | ، |
---------------|---|---|---|---|---|---|---|---|---|---|---|---|
Latin Letters  | F | N | K | a | u | i | ~ | o | ` | { | ? | , |
