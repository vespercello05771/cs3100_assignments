(load "recscm.scm")
(load "records.scm")
(load "tree.scm")
;A partial implementation of the interpreter discussed in the class
;Covers identifier, true/false, plusExpr and IfExpr
(define eval-Expression
	(lambda (Expression) 
		(record-case Expression (IntegerLiteral (Token) 
			(string->number Token))
		(TrueLiteral (Token) #t)
		(FalseLiteral (Token) #f)
		(PlusExpression (Token1 Token2 Expression1 Expression2 Token3)
			(+ (eval-Expression Expression1) (eval-Expression Expression2)))
		(IfExpression (Token1 Token2 Expression1 Expression2 Expression3 Token3)
			(if (eval-Expression Expression1) (eval-Expression Expression2) (eval-Expression Expression3)))
		(else (error 'eval-Expression "Expression not found")))))
(define run
(lambda ()
	(record-case root
		(Goal (Expression Token)
		  (eval-Expression Expression))
		 (else (error 'run "Goal not found")))))
(run)