# needed some junk data one day 
# not very pretty but they worked
# for my practical purpose
#
# picolisp belongs to Alexander Burger 
# www.picolisp.com
#
# these need nothing but pil and a *nix 

(de genNrs (Amount Length)
  (make 
    (do Amount
      (seed (in "/dev/urandom" (rd 10)))
      (link
        (pack
          (make 
            (do Length
              (link 
                (rand 0 9]


# change the rand numbers 
# to get upper case words 
# instead, '(rand 65 90)
# 
# since all characters are 
# roughly equally likely to 
# show up there's a kind of 
# lack of vowels in this 
# pseudo language

(de genWrds (Amount Length)
  (make
    (do Amount
      (seed (in "/dev/urandom" (rd 10)))
      (link
        (pack 
          (make 
            (do Length
              (link 
                (char (rand 97 122]
