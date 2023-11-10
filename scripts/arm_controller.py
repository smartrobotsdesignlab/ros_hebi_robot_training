#!/usr/bin/env python3

import rospy
from sensor_msgs.msg import JointState
import tf
import math
import hebi
import numpy as np
from time import sleep
from std_srvs.srv import Empty, EmptyResponse
from ros_hebi_robot_training.srv import GoToPos, GoToPosResponse

class ArmController:
    def __init__(self):
        # ROS setup
        rospy.init_node('joint_state_publisher')
        self.pub = rospy.Publisher('/joint_states', JointState, queue_size=10)
        self.broadcaster = tf.TransformBroadcaster()
        self.rate = rospy.Rate(100)
        self.gotopos_service = rospy.Service('go_to_position', GoToPos, self.handle_go_to_pos)

        # Set the flag to control real arm or just simulate
        self.real_arm = rospy.get_param('/real_arm', True)
        self.t = rospy.get_time()
        self.group = None
        self.command = None
        self.feedback = None
        self.desAngle = np.array([0, math.pi/2, 0])
        self.curAngle = np.array([0, math.pi/2, 0])
        # Create a HEBI lookup and group for the real arm (if real_arm is True)
        self.robot_fsm_state = "IDLE"
        if self.real_arm:
            self.setup_motors()

        self.get_robot_feedback()
        self.initial_pose()

    def handle_go_to_pos(self,req):
        rospy.loginfo(req.position)
        if self.robot_fsm_state == "IDLE":
            pass
        else:
            rospy.loginfo("Robot must be on IDLE state before moving")
        return GoToPosResponse()
    
    def setup_motors(self):
        lookup = hebi.Lookup()
        sleep(2)
        print('Modules found on network:')
        for entry in lookup.entrylist:
            print(f'{entry.family} | {entry.name}')
        self.group = lookup.get_group_from_names(['Nimbus'], ['Arm_M1', 'Arm_M2', 'Arm_M3'])
        self.command = hebi.GroupCommand(3)
        self.feedback = hebi.GroupFeedback(3)
        self.group.command_lifetime = 100.0


    def publish_joint_states(self,angles):
        joint_state = JointState()
        joint_state.header.stamp = rospy.Time.now()
        joint_state.name = ["M1_to_shoulder_bracket", "M2_to_shoulder_elbow", "M3_to_elbow"]
        joint_state.position = [angles[0], angles[1], angles[2]]
        # Publish joint states
        self.pub.publish(joint_state)

        # Broadcast joint transforms
        self.broadcaster.sendTransform((0, 0, 0), tf.transformations.quaternion_from_euler(0, 0, angles[0]), rospy.Time.now(), "M1_to_shoulder_bracket", "base_link")
        self.broadcaster.sendTransform((0, 0, 0), tf.transformations.quaternion_from_euler(0, 0, angles[1]), rospy.Time.now(), "M2_to_shoulder_elbow", "M1_to_shoulder_bracket")
        self.broadcaster.sendTransform((0, 0, 0), tf.transformations.quaternion_from_euler(0, 0, angles[2]), rospy.Time.now(), "M3_to_elbow", "M2_to_shoulder_elbow")
        if self.real_arm:
            # Send joint angles to HEBI motors
            self.command.position = np.array([angles[0], angles[1], -angles[2]])
            self.group.send_command(self.command)

    def initial_pose(self):
        self.go_to_angle_setup(np.array([0, math.pi/2, 0]), 3.0)

    def go_to_angle_setup(self, end_angles, dur):
        rospy.loginfo("Go to Angle Started "+str(end_angles))
        self.traj_start_angle = np.array(self.curAngle)
        self.traj_end_angle = end_angles
        self.traj_start_time = self.t +3.0
        self.traj_duration = dur
        self.robot_fsm_state = "GO_TO_ANGLE"

    def go_to_angle(self):
        if self.t < self.traj_start_time:
            np.copyto(self.desAngle, self.traj_start_angle)
        elif self.t >= self.traj_start_time and self.t <= self.traj_start_time + self.traj_duration:
            self.desAngle[0] = self.traj_start_angle[0] + (self.traj_end_angle[0] - self.traj_start_angle[0])*(self.t-self.traj_start_time)/ self.traj_duration
            self.desAngle[1] = self.traj_start_angle[1] + (self.traj_end_angle[1] - self.traj_start_angle[1])*(self.t-self.traj_start_time)/ self.traj_duration
            self.desAngle[2] = self.traj_start_angle[2] + (self.traj_end_angle[2] - self.traj_start_angle[2])*(self.t-self.traj_start_time)/ self.traj_duration
            
        elif self.t > self.traj_start_time + self.traj_duration:
            rospy.loginfo("Go to angle Ended")
            self.robot_fsm_state = "IDLE"
            

    def get_robot_feedback(self):
        if self.real_arm:
            self.group.get_next_feedback(reuse_fbk=self.feedback)
            np.copyto(self.curAngle, self.feedback.position)
            #inversion due to the defined sign in our manipulator
            self.curAngle[2] = -self.curAngle[2]
        else:
            np.copyto(self.curAngle, self.desAngle)

    def update_params(self):
        if self.robot_fsm_state == "IDLE":
            pass
        elif self.robot_fsm_state == "GO_TO_ANGLE":
            self.go_to_angle()
        elif self.robot_fsm_state == "GO_TO_POS":
            self.go_to_pos()

    def run(self):

        while not rospy.is_shutdown():
            self.t = rospy.get_time()
            self.get_robot_feedback()
            self.update_params()
            self.publish_joint_states(self.desAngle)
            self.rate.sleep()
if __name__ == '__main__':
    controller = ArmController()
    controller.run()