# pulls, reencodes and loads some statistics
# regarding county government decisions in 
# sweden 2015-2017, then shuffles a little

# wget and iconv are dependencies

# retrieve data, wget will name the file "39" because laziness
(call 'wget "https://catalog.lansstyrelsen.se/store/2/resource/39")

# swedish public sector is ms windows sector so 
# we need to reencode to the more sensible utf-8
# split the csv lines, associate with global, print length
(prinl "Rows in '*Datta:")
(length 
  (setq *Datta 
    (make 
      (in (list 'iconv "-fISO-8859-1" "-tUTF-8" "39")
        (until (eof) 
          (link 
            (mapcar pack (split (line) ";"]

# last column is number of cases waiting for decision 
# for two years or more, sorting on it might be interdasting
# since numbers are transients we need to use 'format for 
# sorting to work properly, hence '((X)(format (last X)))
(prinl "Rows in '*Assorted:")
(length 
  (setq *Assorted 
    (by '((X)(format (last X))) sort *Datta] 

# now comes the tricky part, interpreting the *Assorted datta
# tricky because it is swedish and wossnames instead of counties
# here is a table with names mapped to the characters designating them:
# https://sv.wikipedia.org/wiki/Sveriges_l%C3%A4n#Lista_%C3%B6ver_Sveriges_l%C3%A4n
(head 15 
  (reverse 
    (make 
      (for X *Assorted
        (link 
          (cons 
            (last X)
            (head 3 X)]

# which tells us that gothenburg county has the most undecided cases, 5163
# and they regard farming and other rural stuffs 
