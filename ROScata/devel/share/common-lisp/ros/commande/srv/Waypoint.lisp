; Auto-generated. Do not edit!


(cl:in-package commande-srv)


;//! \htmlinclude Waypoint-request.msg.html

(cl:defclass <Waypoint-request> (roslisp-msg-protocol:ros-message)
  ((enter
    :reader enter
    :initarg :enter
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Waypoint-request (<Waypoint-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Waypoint-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Waypoint-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name commande-srv:<Waypoint-request> is deprecated: use commande-srv:Waypoint-request instead.")))

(cl:ensure-generic-function 'enter-val :lambda-list '(m))
(cl:defmethod enter-val ((m <Waypoint-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader commande-srv:enter-val is deprecated.  Use commande-srv:enter instead.")
  (enter m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Waypoint-request>) ostream)
  "Serializes a message object of type '<Waypoint-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'enter) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Waypoint-request>) istream)
  "Deserializes a message object of type '<Waypoint-request>"
    (cl:setf (cl:slot-value msg 'enter) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Waypoint-request>)))
  "Returns string type for a service object of type '<Waypoint-request>"
  "commande/WaypointRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Waypoint-request)))
  "Returns string type for a service object of type 'Waypoint-request"
  "commande/WaypointRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Waypoint-request>)))
  "Returns md5sum for a message object of type '<Waypoint-request>"
  "35dc34f29260882589d46e46eaa3c0a6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Waypoint-request)))
  "Returns md5sum for a message object of type 'Waypoint-request"
  "35dc34f29260882589d46e46eaa3c0a6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Waypoint-request>)))
  "Returns full string definition for message of type '<Waypoint-request>"
  (cl:format cl:nil "~%~%bool enter~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Waypoint-request)))
  "Returns full string definition for message of type 'Waypoint-request"
  (cl:format cl:nil "~%~%bool enter~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Waypoint-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Waypoint-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Waypoint-request
    (cl:cons ':enter (enter msg))
))
;//! \htmlinclude Waypoint-response.msg.html

(cl:defclass <Waypoint-response> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0))
)

(cl:defclass Waypoint-response (<Waypoint-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Waypoint-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Waypoint-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name commande-srv:<Waypoint-response> is deprecated: use commande-srv:Waypoint-response instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <Waypoint-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader commande-srv:x-val is deprecated.  Use commande-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <Waypoint-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader commande-srv:y-val is deprecated.  Use commande-srv:y instead.")
  (y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Waypoint-response>) ostream)
  "Serializes a message object of type '<Waypoint-response>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Waypoint-response>) istream)
  "Deserializes a message object of type '<Waypoint-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Waypoint-response>)))
  "Returns string type for a service object of type '<Waypoint-response>"
  "commande/WaypointResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Waypoint-response)))
  "Returns string type for a service object of type 'Waypoint-response"
  "commande/WaypointResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Waypoint-response>)))
  "Returns md5sum for a message object of type '<Waypoint-response>"
  "35dc34f29260882589d46e46eaa3c0a6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Waypoint-response)))
  "Returns md5sum for a message object of type 'Waypoint-response"
  "35dc34f29260882589d46e46eaa3c0a6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Waypoint-response>)))
  "Returns full string definition for message of type '<Waypoint-response>"
  (cl:format cl:nil "~%float64 x~%float64 y~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Waypoint-response)))
  "Returns full string definition for message of type 'Waypoint-response"
  (cl:format cl:nil "~%float64 x~%float64 y~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Waypoint-response>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Waypoint-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Waypoint-response
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Waypoint)))
  'Waypoint-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Waypoint)))
  'Waypoint-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Waypoint)))
  "Returns string type for a service object of type '<Waypoint>"
  "commande/Waypoint")