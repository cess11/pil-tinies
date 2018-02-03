# requires nmap. www.picolisp.com is the creation of alexander burger
# 'cnf is for storing configurations, e.g. "-A"

(class +Rslt +Entity)
(rel nm (+Ref +String))
(rel bdy (+List +String))
(rel prj (+Joint) rslt (+PScan))

(class +PScan +Entity)
(rel hst (+Ref +String)) 
(rel cnf (+List +String))
(rel rslt (+List +Joint) prj (+Rslt))

(dm dorun> () (=: rslt 
  (cons 
    (new! '(+Rslt) 
      'nm (pack (: cnf) " " (: hst)) 
      'bdy (make (in (list "nmap" (if (: cnf)(: cnf)) (: hst)) (until (eof)(link (line T)))))) 
    (: rslt))))

(de newHost (Hst Cnf) (new! '(+PScan) 'hst Hst 'cnf Cnf)) 

(de chkAll () (for X (collect 'hst '+PScan) (dorun> X)))

# test: 
# (pool "nmap.db") 
# (newHost "scanme.nmap.org" "-A") 
# (dorun> @)
