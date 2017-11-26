Buckwalter-arabic.el
----------------------

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
