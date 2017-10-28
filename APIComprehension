# For this you probably want a json.l, for example https://rosettacode.org/wiki/JSON#PicoLisp
(load "json.l")
# It needs 'curl or 'w3m as well. 
# This is a small framework for interactively querying API:s. 
# You will need to sort out your own presentation of the collected data. 

(class +Api +Entity)
(rel nm (+Sn +IdxFold +String)) # name 
(rel ba (+Ref +String)) # base address, for example http://api.kolada.se/v2/
(rel ss (+Ref +List +String)) # search strings
(rel ls (+Ref +List +String)) # last result strings
(rel sv (+List +Joint) src (+Save)) # list of saves
(rel dor (+Ref +String))

(dm q> (Q) # query an API; for example '(q> '{2} "municipality?title=sto")
   (let F (list 'curl (pack (: ba) Q))
      (let R (in F (until (eof)(readJson (line))))
         (=: ls R)
         (=: ss (cons Q (: ss)))
         (prinl (pack "Found " (length (setq *LastResult R)) " rows."))]

(dm s> (Nm) # save the last query and result, for example '(s> '{2} "This was a bad result.")
   (let Cd (list (: ba) (car (: ss)))
      (new! '(+Save) 'nm Nm 'cd Cd 'rs (: ls) 'src This 'dor (stamp)]

(class +Save +Entity)
(rel nm (+Sn +Idx +String)) # save name
(rel cd (+Ref +List +String)) # code, '(ba ss)
(rel rs (+Ref +List +String)) # result
(rel src (+Joint) sv (+Api)) # API link
(rel dor (+Ref +String))

(pool "a.db")

(setq # these can be useful
   *LastResult NIL
   *CurrentAPIs (make (mapcar '((X)(with X (link (cons (: nm )(: ba))))) (collect 'nm '+Api)))
   )

