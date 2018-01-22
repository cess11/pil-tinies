# pil-tinies
Tiny pil scripts. Made for use with www.picolisp.com. 
-----------------------------------------------------

db-controls.l:
These are a few 'call' based functions for some control over the Linux music player DeadBeef (http://deadbeef.sourceforge.net/) within pil. 

Usage would be along the lines

`(load "db-controls.l")`

`(db-play)`

starting deadbeef 0.7.2

`(dbi)`

`random`

starting deadbeef 0.7.2`


TODO would be to rewrite (dbi) a little but I probably can't be bothered.

------------------------------------------------------
vW.l: 
This is a dumb interface to the text browser w3m and the picolisp debug pager 'more. 
See https://software-lab.de/doc/refM.html#more for more information. 

One simply feeds 'vW an URL and it will send that to w3m which returns the text it finds at the linked resource, in turn that is passed on to 'more. It could easily be modified to output the web data into another function or file instead. 

--------------------------------------------------------
csvComprehension.l:

Quick and dirty CSV-import-export utility and tutorial. It uses data over Swedish political administrations from an open data archive as example data. 

Can easily be modified to chug through just about any CSV, TSV or other row-based dataformat. 

---------------------------------------------------------
APIComprehension.l

Quick and dirty API-query framework that reads data into pilDB objects. Could easily be extended into a caching system for such API-queries or used as a backend for presenting the responses. 

---------------------------------------------------------
nmap.l 

Extremely basic interface to nmap for saving scan results. 
TODO: Better result parsing and an ontology/pil classes for conf. 
