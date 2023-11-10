; Auto-generated. Do not edit!


(cl:in-package ros_hebi_robot_training-srv)


;//! \htmlinclude GoToPos-request.msg.html

(cl:defclass <GoToPos-request> (roslisp-msg-protocol:ros-message)
  ((position
    :reader position
    :initarg :position
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point)))
)

(cl:defclass GoToPos-request (<GoToPos-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GoToPos-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GoToPos-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_hebi_robot_training-srv:<GoToPos-request> is deprecated: use ros_hebi_robot_training-srv:GoToPos-request instead.")))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <GoToPos-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_hebi_robot_training-srv:position-val is deprecated.  Use ros_hebi_robot_training-srv:position instead.")
  (position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GoToPos-request>) ostream)
  "Serializes a message object of type '<GoToPos-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'position) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GoToPos-request>) istream)
  "Deserializes a message object of type '<GoToPos-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'position) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GoToPos-request>)))
  "Returns string type for a service object of type '<GoToPos-request>"
  "ros_hebi_robot_training/GoToPosRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GoToPos-request)))
  "Returns string type for a service object of type 'GoToPos-request"
  "ros_hebi_robot_training/GoToPosRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GoToPos-request>)))
  "Returns md5sum for a message object of type '<GoToPos-request>"
  "e7bb0ef028c744b081acdc57743b11d8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GoToPos-request)))
  "Returns md5sum for a message object of type 'GoToPos-request"
  "e7bb0ef028c744b081acdc57743b11d8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GoToPos-request>)))
  "Returns full string definition for message of type '<GoToPos-request>"
  (cl:format cl:nil "geometry_msgs/Point position~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GoToPos-request)))
  "Returns full string definition for message of type 'GoToPos-request"
  (cl:format cl:nil "geometry_msgs/Point position~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GoToPos-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'position))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GoToPos-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GoToPos-request
    (cl:cons ':position (position msg))
))
;//! \htmlinclude GoToPos-response.msg.html

(cl:defclass <GoToPos-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GoToPos-response (<GoToPos-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GoToPos-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GoToPos-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_hebi_robot_training-srv:<GoToPos-response> is deprecated: use ros_hebi_robot_training-srv:GoToPos-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GoToPos-response>) ostream)
  "Serializes a message object of type '<GoToPos-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GoToPos-response>) istream)
  "Deserializes a message object of type '<GoToPos-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GoToPos-response>)))
  "Returns string type for a service object of type '<GoToPos-response>"
  "ros_hebi_robot_training/GoToPosResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GoToPos-response)))
  "Returns string type for a service object of type 'GoToPos-response"
  "ros_hebi_robot_training/GoToPosResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GoToPos-response>)))
  "Returns md5sum for a message object of type '<GoToPos-response>"
  "e7bb0ef028c744b081acdc57743b11d8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GoToPos-response)))
  "Returns md5sum for a message object of type 'GoToPos-response"
  "e7bb0ef028c744b081acdc57743b11d8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GoToPos-response>)))
  "Returns full string definition for message of type '<GoToPos-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GoToPos-response)))
  "Returns full string definition for message of type 'GoToPos-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GoToPos-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GoToPos-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GoToPos-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GoToPos)))
  'GoToPos-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GoToPos)))
  'GoToPos-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GoToPos)))
  "Returns string type for a service object of type '<GoToPos>"
  "ros_hebi_robot_training/GoToPos")