; Nicholas Rowe


; Question Number 1
;   Lisp Code for a function that returns true if the parameter is between 0 and 200 (inclusive)
;   and is not a multiple of 6

   (defun my-special-numberp (x) 
          (     and (>= x 0) 
                (<= x 200) 
                (> (mod x 6) 0)
          )
   )



; Question Number 2
;  The easiest way to represent a table of student information containing a name, a grade,
;  and a letter assignment would be to use a table within a table.  For example we would store
;  the students like this:

  (setq students `(
      `("Mary"  90 "A")
      `("Ben"   56 "E")
      `("Tom"   77 "C")
      `("Anne"  83 "B")
  ))

;  While this is a working solution, I don't believe that it is the best solution.  I believe
;  the best solution would be to store the data as a hash where the student's name is the key
;  and the returned value is a hash that contains keys for "number_grade" and "letter_grade".
;  This solution is better because it allows the program to be expanded more naturally.

;  Someday the instructor may wish to store the number of days that the student missed in class
;  or the number of times the student participated.  With the list solution this become difficult.
;  Even more so if the instructor decides to stop stored the letter grade because then we can no
;  longer use the position of a piece of data within the array as a kind of key.

;  Using a Hash also has performance benefits, rather than having to go through 3 elements to get
;  to Anne's information a hash allows a lookup performance of around O(1).  
;  So how to do this in lisp?

  (setq students2 (make-hash-table))
  (setf (gethash `Mary students2) (make-hash-table))
  (setf (gethash `number_grade (gethash `Mary students2)) 90)
  (setf (gethash `letter_grade (gethash `Mary students2)) `A)

;  To retrieve Mary's number_grade:

  (gethash `number_grade (gethash `Mary students2))

;  While the coding is a little trickier this wouldn't be too hard if the student information
;  was being read in from a file.



; Question Number 3 
;   Sums a given list using either a recursive or iterative solution

  ; Iterative solution to sum a list- for each item checks if the item is a number and if it
  ;   is then it adds it to the total
  (defun sum (list)
    (let ((total 0)) (dolist (item list total) (if (numberp item) (setq total (+ item total))))))

   
   ; Recursive version of the of the sum function- if the element is a number then the element
   ;  then it is added to the next number down the chain
   (defun sum (list)
   (if list
       (+ ( if (numberp (car list)) (car list) 0) (sum-list (cdr list)))
     0))



; Question Number 4
; Lisp Code for a list ranging from 1 to specified argument: 
  (defun mylist (max) (loop for i from 1 to max collect i))
  
  
  
; Question Number 5
;  Remove lst1 from lst2
  (defun my-remove (lst1 lst2) (reverse (set-difference lst2 lst1)))
  
  
; -----
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
