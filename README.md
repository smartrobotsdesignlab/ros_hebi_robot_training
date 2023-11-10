# ros_hebi_robot_training
Code for Training using a robot based on HEBI motors

## Environment setup
First we need to make sure that we have ROS1 installed, and a catkin workspace. If you don't have ros, you can install it following [these instructions](http://wiki.ros.org/noetic/Installation/Ubuntu). If you don't have a catkin workspace, you can create one following [these instructions](https://wiki.ros.org/catkin/Tutorials/create_a_workspace). Don't forget to source your workspace's `devel/setup.bash`

## Installing dependencies

It's necessary to install `hebi-py`, which is a package to use the HEBI motor's API. Assuming Python and pip are installed in your system, installing it can be done using: 

```
pip install hebi-py
```

Additionally, inside your catkin workspace's `src` folder, you'll need to clone the following packages:

```
cd ~/<workspace_name>/src
git clone https://github.com/HebiRobotics/hebi_moveit_configs.git
git clone https://github.com/HebiRobotics/hebi_description.git
git clone https://github.com/HebiRobotics/hebi_cpp_api_ros_examples.git hebi_cpp_api_examples
git clone https://github.com/HebiRobotics/hebi_cpp_api_ros.git
```
## Cloning the package

To do this, you'll have to clone the package we'll be using for this training:
```
cd ~/<workspace_name>/src
git clone https://github.com/smartrobotsdesignlab/ros_hebi_robot_training.git
```
And compile your workspace
```
cd ~/<workspace_name>/
catkin_make
```

Then you'll be able to run the Robot URDF with sliders controllers using 

```
roslaunch ros_hebi_robot_training arm_training_slider.launch
```
or the basic code we'll be editing, which is located in `ros_hebi_robot_training/src/scripts` using

```
roslaunch ros_hebi_robot_training arm_training_controller.launch
```
