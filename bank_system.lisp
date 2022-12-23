;print with format
(defun print-line(&rest args)
  (format t "~{~A~}" args))

;declarations
(defvar *account-id* nil)
(defvar *account-name* nil)
(defvar *account-branch* nil)
(defvar *account-balance* nil)
(defvar *account-type* nil)
(defvar *choice* nil)

;deposit function
(defun deposit()
  (if (or (eq *account-name* nil) (eq *account-branch* nil))
    (progn
    	(write-line "Please first create an account!")
    	(make-choice))
    (progn 
	 (defvar amount nil)
	 (terpri)
  	 (terpri)
	 (write-line "Enter amount to deposit: ")
	 (amount (read))
  	 (+ *account-balance* amount)
 	 (print-line "Amount of " amount " is successfully deposited!")
 	 (print-line "Balance: " *account-balance*))))

;withdraw function
(defun withdraw()
  (if (or (eq *account-name* nil) (eq *account-branch* nil))
     (progn
         (write-line "Please first create an account!")
         (make-choice))
     (progn
		(defvar amount nil)
		(terpri)
 		(terpri)
		(write-line "Enter amount to withdraw: ")
		(defvar after-withdrawal)
		(setq after-withdrawal (- *account-balance* amount))
		(if (< after-withdrawal 1000)
			(print-line "Insufficient Balance!" *account-balance*)
				(progn 
			(setq *account-balance* (- *account-balance* amount))
				(print-line "Withdrawal of " amount " is successful! ")
				(print-line "Balance: " *account-balance*))))))

;register function
(defun register()
  (defvar name nil)
  (defvar branch nil)
  (defvar initial-deposit nil)
  (defvar account-type nil)
  (terpri)
  (write-line "Account Creation!")
  (write-line "Enter your Name: ")
  (setq name (read))
  (write-line "Enter your Branch: ")
  (setq branch (read))
  (write-line "Enter initial amount to deposit: ")
  (setq initial-deposit (read))
  (write-line "Enter account type: ")
  (setq account-type (read))
  (setq *account-id* (random 999999))
  (setq *account-name* name)
  (setq *account-branch* branch)
  (setq *account-balance* initial-deposit)
  (setq *account-type* account-type)
  (print-line "The " *account-type* " account of " *account-name* " is successfully registered!"))

;executing choice
(defun choice()
  
	(case *choice*
        	(1 (progn
             		(register)
             		(make-choice)))
        	(2 (progn
					(deposit)
             		(make-choice)))
        	(3 (progn
					(withdraw)
             		(make-choice)))
        	(4 (progn
             		(write-line "안녕! annyeong!")
             		(exit)))
        )

  )

(defun make-choice()
  	(terpri)
  	(terpri)
	(write-line "환영하다! Welcome to LISP Banking System!")
	(write-line "Made by Deepraj Das! 디ᄑ라ᄌ다스!")
	(write-line "Please enter your choice!")
	(write-line "Press 1: Register new account.")
	(write-line "Press 2: Deposit to account.")
	(write-line "press 3: Withdrawal from account.")
	(write-line "Press 4: Exit!")
	(setq *choice* (read))
	(choice)
  )
(make-choice)
