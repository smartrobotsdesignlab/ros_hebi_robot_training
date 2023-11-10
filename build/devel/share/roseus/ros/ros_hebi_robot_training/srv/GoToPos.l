;; Auto-generated. Do not edit!


(when (boundp 'ros_hebi_robot_training::GoToPos)
  (if (not (find-package "ROS_HEBI_ROBOT_TRAINING"))
    (make-package "ROS_HEBI_ROBOT_TRAINING"))
  (shadow 'GoToPos (find-package "ROS_HEBI_ROBOT_TRAINING")))
(unless (find-package "ROS_HEBI_ROBOT_TRAINING::GOTOPOS")
  (make-package "ROS_HEBI_ROBOT_TRAINING::GOTOPOS"))
(unless (find-package "ROS_HEBI_ROBOT_TRAINING::GOTOPOSREQUEST")
  (make-package "ROS_HEBI_ROBOT_TRAINING::GOTOPOSREQUEST"))
(unless (find-package "ROS_HEBI_ROBOT_TRAINING::GOTOPOSRESPONSE")
  (make-package "ROS_HEBI_ROBOT_TRAINING::GOTOPOSRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass ros_hebi_robot_training::GoToPosRequest
  :super ros::object
  :slots (_position ))

(defmethod ros_hebi_robot_training::GoToPosRequest
  (:init
   (&key
    ((:position __position) (instance geometry_msgs::Point :init))
    )
   (send-super :init)
   (setq _position __position)
   self)
  (:position
   (&rest __position)
   (if (keywordp (car __position))
       (send* _position __position)
     (progn
       (if __position (setq _position (car __position)))
       _position)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point _position
    (send _position :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Point _position
       (send _position :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Point _position
     (send _position :deserialize buf ptr-) (incf ptr- (send _position :serialization-length))
   ;;
   self)
  )

(defclass ros_hebi_robot_training::GoToPosResponse
  :super ros::object
  :slots ())

(defmethod ros_hebi_robot_training::GoToPosResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass ros_hebi_robot_training::GoToPos
  :super ros::object
  :slots ())

(setf (get ros_hebi_robot_training::GoToPos :md5sum-) "e7bb0ef028c744b081acdc57743b11d8")
(setf (get ros_hebi_robot_training::GoToPos :datatype-) "ros_hebi_robot_training/GoToPos")
(setf (get ros_hebi_robot_training::GoToPos :request) ros_hebi_robot_training::GoToPosRequest)
(setf (get ros_hebi_robot_training::GoToPos :response) ros_hebi_robot_training::GoToPosResponse)

(defmethod ros_hebi_robot_training::GoToPosRequest
  (:response () (instance ros_hebi_robot_training::GoToPosResponse :init)))

(setf (get ros_hebi_robot_training::GoToPosRequest :md5sum-) "e7bb0ef028c744b081acdc57743b11d8")
(setf (get ros_hebi_robot_training::GoToPosRequest :datatype-) "ros_hebi_robot_training/GoToPosRequest")
(setf (get ros_hebi_robot_training::GoToPosRequest :definition-)
      "geometry_msgs/Point position

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
---

")

(setf (get ros_hebi_robot_training::GoToPosResponse :md5sum-) "e7bb0ef028c744b081acdc57743b11d8")
(setf (get ros_hebi_robot_training::GoToPosResponse :datatype-) "ros_hebi_robot_training/GoToPosResponse")
(setf (get ros_hebi_robot_training::GoToPosResponse :definition-)
      "geometry_msgs/Point position

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
---

")



(provide :ros_hebi_robot_training/GoToPos "e7bb0ef028c744b081acdc57743b11d8")


