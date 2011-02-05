; Nicholas Rowe


; 1. Define a function that accepts a list of pairs of the form ‘(a n), where n is a number,
;    and returns a list of all pairs that contain the maximum value of n’s.

(defun my-max (lst)
  ; This functions works in two steps
  ; 1. Sets the max value to the maximum value of a list obtained by creating a list of
  ;    the head of the tail of a list
  ; 2. Using this maximum values removes any values that are less the max value

  (let ((max-value (apply #'max (map 'list #'(lambda (x) (second x)) lst ))))
    (remove-if #'(lambda (x) (< (second x) max-value)) lst)
  )
)

; Example Usage of max-elt
(my-max ‘((a 3) (b 5) (c 2) (d 5)))

; -------------------------------------------------------------------------------------------

; 2. VERY NOT DONE

(defun my-sort (lst)
    (copy-list lst)
    ; List length 0
    ;   Return nil
    ; Else
    ;   my-max -> val
    ;   set-difference
    ;   join with sorted my-max by y + remainder of list
)

; -------------------------------------------------------------------------------------------

; 3. Define your my-union1 function that works the same as union.
(defun my-union1 (lst1 lst2)
    (remove-duplicates (append lst1 lst2))
)

(my-union1 ‘(a b c) ‘(x b y))

; -------------------------------------------------------------------------------------------

; 4. Define my-union2 that preserves the order of the elements in the original lists.
(defun my-union2 (lst1 lst2)
    (let ((result (copy-list lst1)))
      (dolist (elt lst2)
        (if (null (member elt result))
            (setf result (append result (list elt)))
        )
      )
      result
    )
)

(my-union2 ‘(a b c) ‘(x b y))

; -------------------------------------------------------------------------------------------

; Almost done, reverse should be some sort of sort
; 5. Define a function that takes a list and returns a list indicating the number of times
;    each (eql) element appears, sorted from most common element to least common.
    
(defun occurrences (lst)
    (reverse (mapcar #'cons
        (remove-duplicates lst)
        (map 'list #'(lambda (x) (count x lst)) (remove-duplicates lst) )
    )
)

(occurrences ‘(a b a d a c d c a b b b b b b b))

; -------------------------------------------------------------------------------------------




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
