;; Auto-generated. Do not edit!


(when (boundp 'commande::Etat)
  (if (not (find-package "COMMANDE"))
    (make-package "COMMANDE"))
  (shadow 'Etat (find-package "COMMANDE")))
(unless (find-package "COMMANDE::ETAT")
  (make-package "COMMANDE::ETAT"))

(in-package "ROS")
;;//! \htmlinclude Etat.msg.html


(defclass commande::Etat
  :super ros::object
  :slots (_x _y _cap _u _v _r ))

(defmethod commande::Etat
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:cap __cap) 0.0)
    ((:u __u) 0.0)
    ((:v __v) 0.0)
    ((:r __r) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _cap (float __cap))
   (setq _u (float __u))
   (setq _v (float __v))
   (setq _r (float __r))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:cap
   (&optional __cap)
   (if __cap (setq _cap __cap)) _cap)
  (:u
   (&optional __u)
   (if __u (setq _u __u)) _u)
  (:v
   (&optional __v)
   (if __v (setq _v __v)) _v)
  (:r
   (&optional __r)
   (if __r (setq _r __r)) _r)
  (:serialization-length
   ()
   (+
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _cap
    8
    ;; float64 _u
    8
    ;; float64 _v
    8
    ;; float64 _r
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _cap
       (sys::poke _cap (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _u
       (sys::poke _u (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _v
       (sys::poke _v (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _r
       (sys::poke _r (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _cap
     (setq _cap (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _u
     (setq _u (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _v
     (setq _v (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _r
     (setq _r (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get commande::Etat :md5sum-) "f6c594b1e53eca8aa163d299ac747d00")
(setf (get commande::Etat :datatype-) "commande/Etat")
(setf (get commande::Etat :definition-)
      "float64 x
float64 y
float64 cap
float64 u
float64 v
float64 r

")



(provide :commande/Etat "f6c594b1e53eca8aa163d299ac747d00")


