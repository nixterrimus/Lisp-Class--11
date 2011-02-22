; Nicholas Rowe

; Passwords!

(setf *password-table1* (make-hash-table :test #'equal))
(setf *password-table2* (make-hash-table :test #'equal))

(defun add-password-to-table (username password table)
    (setf (gethash password table) (append (list username) (gethash password table)))
)

(defun valid-password-0 (password-table username password)
    T
)

; Valid password methods that satisfy various requirements
(defun valid-password-1 (password-table username password)
    (not (gethash password password-table))
)

(defun valid-password-2 (password-table username password)
    (and (>= (array-total-size password) 5) (>= (count-if #'alpha-char-p password) 1) (not (gethash password password-table)))
)

(defun valid-password-3 (password-table username password)
    (not (member username (gethash password *password-table1* ) :test #'equal))
)

; User password assignment takes :test as a key of which function to use in checking if the password is valid
;   Ex: (user-password-assignment *password-table1* :test #'valid-password-1)
;   Ex: (user-password-assignment *password-table1* :test #'valid-password-2)
;   Ex: (user-password-assignment *password-table1* :test #'valid-password-3)
(defun user-password-assignment (password-table &key (test #'valid-password-0))
    (let ((username-input nil) (password-input nil) (valid nil))
        (format t "Enter your login: ")
        (setf username-input (read))
        (loop while (null valid) do            
            (format t "Enter a password: ")          
            (setf valid (funcall test password-table username-input (setf password-input (symbol-name (read)))))
        )
        (format t "Your Password is setup~%")          
        (add-password-to-table username-input password-input password-table)
        (values username-input password-input)
    )
)

; Returns Passwords associated wtih a given user
(defun user-passwords (password-table)
    (let ((users-table (make-hash-table :test #'equal)))
        (maphash #'(lambda (password usernames)
            (mapcar #'(lambda (username) 
                (setf (gethash username users-table) (append (list password) (gethash username users-table)))) usernames))
        password-table)
        users-table
    )
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