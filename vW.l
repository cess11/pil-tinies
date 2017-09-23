# I heard you've always wanted to read the news in the REPL. 
# So I wrote a pager on top of a pager and a pager for your REPL. 
# It is quite convenient sometimes. 

# Dependencies would be picolisp and w3m. 
# It has been tested in debug mode. 
# picolisp is the creation of Alex Burger: www.picolisp.com 



(de vW (Url)
   (and 
      (make 
         (in (list 'w3m Url)
            (until (eof)
               (link (line T)) ) ) )
      (more @) ) )




# Usage:
# (vW "http://software-lab.de/penti.html")

# [Enter] scrolls down line by line, "." and then [Enter] stops. 
