# Picolisp is the creation of Alex Burger: www.picolisp.com 
# This script depends also on w3m: http://w3m.sourceforge.net/

# Sometimes you find some interesting data. 
# Maybe contacts for all local political assemblies. 
# But when you do, what to do? 

# First you write a data model for the data involved 
# In this case it is ;-delimited and has six columns

(class +Kommun +Entity) # In Sweden a kommun is a region or county
(rel kk (+Ref +Key +Number)) # They have number codes
(rel nm (+Sn +Idx +String)) # Also names that you probably want to search for
(rel prm (+Ref +Bool)) # If it is T here it is a county in a region, and if NIL a region
(rel bef (+Ref +Number)) # Population
(rel webb (+Ref +String)) # URL to its web page
(rel epst (+Ref +String)) # Email address
(rel tel (+Ref +String)) # Telephone number
(rel dor (+String)) # Date of registry in your DB

# And we also want a function for parsing and modeling the incoming data
(de newK (Ls) # Lists are what LISPs are for
   (new!
      '(+Kommun)
      'kk
      (car Ls)
      'nm
      (cadr Ls)
      'prm
      *RegionIfNIL # So we can do '(setq *RegionIfNIL 'T) once the first set is in
      'bef
      (caddr Ls)
      'webb
      (cadddr Ls)
      'epst
      (car (cddddr Ls))
      'tel
      (car (tail 1 Ls)) # It needs car because 'tail returns a list with one element
      'dor
      (stamp) ) ) # 'stamp writes out date and time

# Now we need to pool a DB and comprehend some data
(pool "addresses.db") 

# The data can be found here:
# https://oppnadata.se/dataset/kontaktuppgifter-till-kommunerna/resource/ec5d359f-9474-4ab3-a1ba-e9f796b07830
# https://oppnadata.se/dataset/kontaktuppgifter-till-landstingen/resource/5f59209a-6532-460a-b45b-de1280a8945b

# The URL:s are https://catalog.skl.se/store/1/resource/169 and https://catalog.skl.se/store/1/resource/173
# That's all we need, besides our trusty web browser
(and 
  (in '(w3m "https://catalog.skl.se/store/1/resource/169")
    (line) # Because the first line isn't interesting 
    (until (eof)
      (newK (mapcar pack (split (line) ";"))))) # 'mapcar returns a list of packed transient symbols
  (setq *RegionIfNIL 'T)
  (in '(w3m "https://catalog.skl.se/store/1/resource/173")
    (line)
    (until (eof)
      (newK (mapcar pack (split (line) ";"))))) )

# Now you have all the addresses and phone numbers of all the swedish political assemblies 
# Next one could write a parser for that first line that sets up a model and 'load it
# Or perhaps abstract away the repetitions in that 'and block


# Nevermind the DOS format or weird encoding, that's how the powerful do data over here

# Here's a method for writing it back out as ;-delimited CSV 
# Usage: '(for X (collect 'kk '+Kommun) (mkCSV> X "freshfile")), or row by row, '(mkCSV> 'Obj "file")
(dm mkCSV> (Dst) 
        (out (pack "+" Dst) # Because one usually enters just a file name
                (prinl (glue ";" (list (: kk) (: nm) (: bef) (: webb) (: epst) (: tel) ]
