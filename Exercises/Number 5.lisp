; Nicholas Rowe

; Passwords!

(setf *password-table1* (make-hash-table :test #'equal))
(setf *password-table2* (make-hash-table :test #'equal))

; Utility functions used for counting types of string elements.  Split into functions to avoid repeating
;   the same code several times
(defun number-count (string)
    (count-if #'digit-char-p string)
)

(defun character-count (string)
    (count-if #'alpha-char-p string)
)

; Valid password methods that satisfy various requirements
(defun valid-password-1 (password-table password)
    (not (gethash password password-table1))
)

(defun valid-password-2 (password)
    (and (>= (array-total-size password) 5) (>= (character-count password) 1) (not (gethash password *password-table2*)))
)

(defun valid-password-3 (password)
    nil
)

; User password assignment takes :test as a key of which function to use in checking if the password is valid
(defun user-password-assignment (password-table &key (test #'valid-password-1))
    (funcall test password-table "hello2!")
)


;  ----
;   Copyright (C) 2011 by Nick Rowe

;  Permission is hereby granted, free of charge, to any person obtaining a copy
;  of this software and associated documentation files (the "Software"), to deal
;  in the Software without restriction, including without limitation the rights
;  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;  copies of the Software, and to permit persons to whom the Software is
;  furnished to do so, subject to the following conditions:

;  The above copyright notice and this permission notice shall be included in
;  all copies or substantial portions of the Software.

;  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
;  THE SOFTWARE.