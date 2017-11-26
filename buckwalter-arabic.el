;;; buckwalter-arabic.el --- Write arabic using Buckwalter transliteration

;; Copyright (C) 2017 Joe HAKIM RAHME <joehakimrahme@gmail.com>

;; Author: Joe HAKIM RAHME <joehakimrahme@gmail.com>
;; Version: 20171126.1
;; Keywords: arabic, transliteration, i18n
;; URL: https://github.com/joehakimrahme/buckwalter-arabic

;;; Commentary:

;; This package provides interactive functions to translate latin characters
;; to unicode in arabic scripts, using the Buckwalter transliteration.
;;
;; For more info on the transliteration table:
;;     http://www.qamus.org/transliteration.htm"

;;; License:

;; This file is NOT part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Code:
(defvar buckwalter-to-unicode '(
    ("'" . "ء") ("|" . "آ") (">" . "أ") ("&" . "ؤ") ("<" . "إ") ("}" . "ئ")
    ("A" . "ا") ("b" . "ب") ("p" . "ة") ("t" . "ت") ("v" . "ث") ("j" . "ج")
    ("H" . "ح") ("x" . "خ") ("d" . "د") ("*" . "ذ") ("r" . "ر") ("z" . "ز")
    ("s" . "س") ("$" . "ش") ("S" . "ص") ("D" . "ض") ("T" . "ط") ("Z" . "ظ")
    ("E" . "ع") ("g" . "غ") ("_" . "ـ") ("f" . "ف") ("q" . "ق") ("k" . "ك")
    ("l" . "ل") ("m" . "م") ("n" . "ن") ("h" . "ه") ("w" . "و")
    ("Y" . "ى") ("y" . "ي") ("F" . "ً") ("N" . "ٌ") ("K" . "ٍ") ("a" . "َ")
    ("u" . "ُ")("i" . "ِ") ("~" . "ّ") ("o" . "ْ") ("`" . "ٰ") ("{" . "ٱ")
    ("?" . "؟") ("," . "،")))

;; reverse the alist
(defvar unicode-to-buckwalter
  (mapcar (lambda (x) (cons (cdr x) (car x))) buckwalter-to-unicode))

;; originally taken from s.el. The function is modified to avoid tripping
;; on case-fold-search
(defun b2ar-replace-all (replacements s)
  (let ((case-fold-search nil))
    (replace-regexp-in-string (regexp-opt (mapcar 'car replacements))
                              (lambda (it) (cdr (assoc-string it replacements)))
                              s nil nil)))

;;;###autoload
(defun buckwalter-transliterate ($string &optional $from $to)
  "Replace latin letters with arabic using the Buckwalter transliteration.

When called interactively, work on current paragraph or text selection.

When called in Lisp code, if $STRING is non-nil, returns a changed string.
If `string` nil, change the text in the region between positions `from` `to`.

More detailed info on the Buckwalter transliteration can be found here:
http://www.qamus.org/transliteration.htm"
  (interactive
   (if (use-region-p)
       (list nil (region-beginning) (region-end))
     (let ((bds (bounds-of-thing-at-point 'paragraph)))
       (list nil (car bds) (cdr bds)))))
  (let (workOnStringP inputStr outputStr)
    (setq workOnStringP (if $string t nil))
    (setq inputStr (if workOnStringP $string (buffer-substring-no-properties $from $to)))
    (setq outputStr (b2ar-replace-all buckwalter-to-unicode inputStr))
    (if workOnStringP
        outputStr
      (save-excursion
        (delete-region $from $to)
        (goto-char $from)
          (insert outputStr)))))

;;;###autoload
(defun buckwalter-transliterate-reverse ($string &optional $from $to)
  "Replace arabic letters with latin using the Buckwalter transliteration.

When called interactively, work on current paragraph or text selection.

When called in Lisp code, if $STRING is non-nil, returns a changed string.
If `string` nil, change the text in the region between positions `from` `to`.

More detailed info on the Buckwalter transliteration can be found here:
http://www.qamus.org/transliteration.htm"
  (interactive
   (if (use-region-p)
       (list nil (region-beginning) (region-end))
     (let ((bds (bounds-of-thing-at-point 'paragraph)))
       (list nil (car bds) (cdr bds)))))
  (let (workOnStringP inputStr outputStr)
    (setq workOnStringP (if $string t nil))
    (setq inputStr (if workOnStringP $string (buffer-substring-no-properties $from $to)))
    (setq outputStr (b2ar-replace-all unicode-to-buckwalter inputStr))
    (if workOnStringP
        outputStr
      (save-excursion
        (delete-region $from $to)
        (goto-char $from)
        (insert outputStr)))))

(provide 'buckwalter-arabic)
;;; buckwalter-arabic.el ends here
