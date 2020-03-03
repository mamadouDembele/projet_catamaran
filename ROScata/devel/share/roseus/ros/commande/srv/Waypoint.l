;; Auto-generated. Do not edit!


(when (boundp 'commande::Waypoint)
  (if (not (find-package "COMMANDE"))
    (make-package "COMMANDE"))
  (shadow 'Waypoint (find-package "COMMANDE")))
(unless (find-package "COMMANDE::WAYPOINT")
  (make-package "COMMANDE::WAYPOINT"))
(unless (find-package "COMMANDE::WAYPOINTREQUEST")
  (make-package "COMMANDE::WAYPOINTREQUEST"))
(unless (find-package "COMMANDE::WAYPOINTRESPONSE")
  (make-package "COMMANDE::WAYPOINTRESPONSE"))

(in-package "ROS")





(defclass commande::WaypointRequest
  :super ros::object
  :slots (_enter ))

(defmethod commande::WaypointRequest
  (:init
   (&key
    ((:enter __enter) nil)
    )
   (send-super :init)
   (setq _enter __enter)
   self)
  (:enter
   (&optional __enter)
   (if __enter (setq _enter __enter)) _enter)
  (:serialization-length
   ()
   (+
    ;; bool _enter
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _enter
       (if _enter (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _enter
     (setq _enter (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass commande::WaypointResponse
  :super ros::object
  :slots (_x _y ))

(defmethod commande::WaypointResponse
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:serialization-length
   ()
   (+
    ;; float64 _x
    8
    ;; float64 _y
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
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass commande::Waypoint
  :super ros::object
  :slots ())

(setf (get commande::Waypoint :md5sum-) "35dc34f29260882589d46e46eaa3c0a6")
(setf (get commande::Waypoint :datatype-) "commande/Waypoint")
(setf (get commande::Waypoint :request) commande::WaypointRequest)
(setf (get commande::Waypoint :response) commande::WaypointResponse)

(defmethod commande::WaypointRequest
  (:response () (instance commande::WaypointResponse :init)))

(setf (get commande::WaypointRequest :md5sum-) "35dc34f29260882589d46e46eaa3c0a6")
(setf (get commande::WaypointRequest :datatype-) "commande/WaypointRequest")
(setf (get commande::WaypointRequest :definition-)
      "

bool enter
---

float64 x
float64 y


")

(setf (get commande::WaypointResponse :md5sum-) "35dc34f29260882589d46e46eaa3c0a6")
(setf (get commande::WaypointResponse :datatype-) "commande/WaypointResponse")
(setf (get commande::WaypointResponse :definition-)
      "

bool enter
---

float64 x
float64 y


")



(provide :commande/Waypoint "35dc34f29260882589d46e46eaa3c0a6")


