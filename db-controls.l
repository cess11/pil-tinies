# cess11, picolisp.com
# pil-tinies/db-controls
# DeadBeef controls
(de db-slumpa ()
	(call 'deadbeef "--random"))

(de db-pp () 
	(call 'deadbeef "--play-pause"))

(de db-next ()
	(call 'deadbeef "--next"))

(de db-prev () 
	(call 'deadbeef "--prev"))

(de db-pause ()
	(call 'deadbeef "--pause"))

(de db-play ()
	(call 'deadbeef "--play"))


(de dbi () 
	(let comm (read)
	(call 'deadbeef (text "--@1" comm)
	(call 'deadbeef "--nowplaying-tf \"%artist% - %title%\" "))))

















