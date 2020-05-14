# script that consumes a file of domains called domains, one per line, and extracts their nameservers to a file named result
(setq *Domains (make 
  (in "domains" 
    (until (eof) 
      (link
        (line T))))))                                                                                                                           
                                                                                                                                                                                              
(setq *DomainsAndNameservers (make 
  (for X *Domains 
    (in (list 'host "-t" "ns" X) 
      (until (eof) 
        (and 
          (match '(@A " " @B " " @C " " @D ".")(line)) 
          (link (pack X " " @D))))))))                   
                                                                                                                                                                                              
(out "+result" (for X *DomainsAndNameservers (prinl X)))                                                                                                                                      
(bye)
