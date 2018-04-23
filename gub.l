(load "@lib/http.l" "@lib/xhtml.l" "@lib/form.l")

# read more at https://dev.to/cess11/lets-build-a-picolisp-guestbook-mkl
# get picolisp at software-lab.de/picoLisp.tgz , picolisp.com

(class +Msg +Entity)
(rel hdr (+String))
(rel bdy (+String))
(rel sdr (+String))
(rel dor (+String))
(rel book (+Joint) msgs (+Gbk))

(class +Gbk +Entity)
(rel nm (+Ref +String))
(rel msgs (+List +Joint) book (+Msg))

(dm addM> (Hdr Bdy Sdr) 
    (let D (new! '(+Msg) 
        'hdr Hdr 
        'bdy Bdy
        'sdr Sdr 
        'dor (stamp)
        'book This )
        (put!> This 'msgs D)
    (commit 'upd) ))

(pool "gb.db")

(setq 
    *Gbk (car (collect 'nm '+Gbk))
     )

(de work ()
    (app)
    (action 
        (html 0 "Guestbook" "@lib.css" NIL 
            (<h2> NIL "Picolisp guestbook")
            (<hr>)
            (form NIL 
        (<p> NIL "Message header:")
        (gui 'hdr '(+Var +TextField) '*MsgHdr 30)
                (do 2 (<br>))
        (<p> NIL "Message text:")
                (gui 'bdy '(+Var +TextField) '*MsgBdy 30 5)
                (do 2 (<br>))
        (<p> NIL "Your name:")
                (gui 'sdr '(+Var +TextField) '*MsgSdr 30)
                (do 2 (<br>))
                (gui '(+Button) "Send" 
                    '(ask "Post this message?" 
                        (addM> *Gbk *MsgHdr *MsgBdy *MsgSdr) )) )
            (<br>)
        (<hr>)
            (for X (get *Gbk 'msgs) # instead of '+Chart, '+QueryChart or 'url>
                (with X
                    (<h3> NIL (ht:Prin (: hdr)) )
                    (<br>)
                    (<p> NIL (ht:Prin (: bdy)) )
                    (<br>)
                    (<p> NIL (ht:Prin (pack (: sdr) " - " (: dor))) )
            (<br>) )) )))

(de go ()
    (server 8080 "!work") )

