;; create some objects 
(setq objects '(whiskey-bottle bucket frog chain))

;; create a map of some areas
(setq map '((living-room (you are in the living room
			      of a wizards house - there is a wizard
			      snoring loudly on the couch -)
			 (west door garden)
			 (upstairs stairway attic))
	    (garden (you are in a beautiful garden -
			 there is a well in front of you -)
		    (east door living-room))
	    (attic (you are in the attic of the
			wizards house - there is a giant
			welding torch in the corner -)
		   (downstairs stairway living-room))))

;; create some object locations
(setq object-locations '((whiskey-bottle living-room)
			 (bucket living-room)
			 (chain garden)
			 (frog garden)))

;; set initial location of player in game
(setq location 'living-room)

(defun describe-location (location map)
  (second (assoc location map)))

(defun describe-path (path)
  `(there is a ,(second path) going ,(first path) from here -))

(defun describe-paths (location map)
  (apply #'append (mapcar #'describe-path (cddr (assoc location map)))))

(defun is-at (obj loc obj-loc)
  (eq (second (assoc obj obj-loc)) loc))
