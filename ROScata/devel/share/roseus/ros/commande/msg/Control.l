;; Auto-generated. Do not edit!


(when (boundp 'commande::Control)
  (if (not (find-package "COMMANDE"))
    (make-package "COMMANDE"))
  (shadow 'Control (find-package "COMMANDE")))
(unless (find-package "COMMANDE::CONTROL")
  (make-package "COMMANDE::CONTROL"))

(in-package "ROS")
;;//! \htmlinclude Control.msg.html


(defclass commande::Control
  :super ros::object
  :slots (_u1 _u2 _theta1 _theta2 ))

(defmethod commande::Control
  (:init
   (&key
    ((:u1 __u1) 0.0)
    ((:u2 __u2) 0.0)
    ((:theta1 __theta1) 0.0)
    ((:theta2 __theta2) 0.0)
    )
   (send-super :init)
   (setq _u1 (float __u1))
   (setq _u2 (float __u2))
   (setq _theta1 (float __theta1))
   (setq _theta2 (float __theta2))
   self)
  (:u1
   (&optional __u1)
   (if __u1 (setq _u1 __u1)) _u1)
  (:u2
   (&optional __u2)
   (if __u2 (setq _u2 __u2)) _u2)
  (:theta1
   (&optional __theta1)
   (if __theta1 (setq _theta1 __theta1)) _theta1)
  (:theta2
   (&optional __theta2)
   (if __theta2 (setq _theta2 __theta2)) _theta2)
  (:serialization-length
   ()
   (+
    ;; float64 _u1
    8
    ;; float64 _u2
    8
    ;; float64 _theta1
    8
    ;; float64 _theta2
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _u1
       (sys::poke _u1 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _u2
       (sys::poke _u2 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _theta1
       (sys::poke _theta1 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _theta2
       (sys::poke _theta2 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _u1
     (setq _u1 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _u2
     (setq _u2 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _theta1
     (setq _theta1 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _theta2
     (setq _theta2 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get commande::Control :md5sum-) "36a12991b3aa0a1fb168436c13f70d4e")
(setf (get commande::Control :datatype-) "commande/Control")
(setf (get commande::Control :definition-)
      "float64 u1
float64 u2
float64 theta1
float64 theta2


")



(provide :commande/Control "36a12991b3aa0a1fb168436c13f70d4e")


