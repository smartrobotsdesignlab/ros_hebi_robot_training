
(cl:in-package :asdf)

(defsystem "ros_hebi_robot_training-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "GoToPos" :depends-on ("_package_GoToPos"))
    (:file "_package_GoToPos" :depends-on ("_package"))
  ))