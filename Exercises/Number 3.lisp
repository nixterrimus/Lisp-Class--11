; Nicholas Rowe

; There was a problem with my computer- I put this under your door on Friday


(defun dfs (lst start end)        
        (let ((start (find start lst :key #'first))
             (visited nil)
             (path nil)
             (current nil)
             (next nil)
             (complete 0))
         
             (push (first start) path)
         
             (loop while (and (not (null path)) (zerop complete) ) do
                 (setf current (first path))
                 (push current visited)
        
                 ; Find if potential Nexts exists
                 (setf next (remove-duplicates (sort (set-difference (find current lst :key #'first) visited) #'<)))
         
                 (if (null next)
                    (pop path)
                    (if (find end next)
                        (progn
                            (print "Path Found!")
                            (setf complete 1)
                            (push end path)
                            (print path)
                        )
                        (push (first next) path)
                    )
                 )
             )
             
             (reverse path)
        )
)

(dfs `((1 3 2 2) (2 3) (3 4)) 2 4)

; Utility function for hilo taken from Olivier Ansaldi @ http://ozone.wordpress.com/
(defun shuffle-list (l)
  (loop for i below (length l) do
	(rotatef
	 (elt l i)
	 (elt l (random (length l)))))
  l)


(defun hilo-debug ()
    (hilo-main 1)
)

(defun hilo ()
    (hilo-main 0)
)

(defun hilo-main (debug)

    (let ((input nil) (secret (random 100)) (totalguesses 0) (gamewon 0) (stopPlaying 0)
          (taunts (shuffle-list `("No way, human!", "You're way off!", "You'll never guess!"))))
    
        (if (> debug 0) (format t "Secret is: ~d ~%" secret))
        
        (loop while (and (<= totalguesses 5) (zerop gamewon)) do
                        
            (format t "~%Enter your guess: ")
            
            (if (numberp (setf input (read)))
                (progn
                    (setf totalguesses (+ 1 totalguesses))
                    (cond 
                        ((= input secret) 
                            (format t "Winner!  You guessed in ~d tries! ~%" totalguesses)
                            (setf gamewon 1))
                        ((> input secret) (format t "Your guess, ~d, is too high ~%" input))
                        ((< input secret) (format t "Your guess, ~d, is too low ~%" input))))  
                    
                (format t "Please enter a number~%"))
            
        )
        totalguesses
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
