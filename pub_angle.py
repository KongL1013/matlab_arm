#!/usr/bin/env python2.7
import rospy
from std_msgs.msg import Int32
from geometry_msgs.msg import Pose
from geometry_msgs.msg import PoseArray
import time 
import numpy as np

def talker():
	pub=rospy.Publisher("/angle_info",PoseArray,queue_size = 10)
	rospy.init_node("sender",anonymous=True)
	rate=rospy.Rate(5)
	# total_info.poses= [posedata1]*12
	while not rospy.is_shutdown():
		total_info = PoseArray() #init before using !!!!!!
		# posedata.orientation.x = 1
		# posedata.position.x = 2.5
		oridata = np.random.rand(24).reshape(12,2)
		oridata = (oridata-1) / 3.14 *180
		for i in range(12):
			posedata = Pose()  #init before using !!!!!!
			posedata.orientation.x = oridata[i,0]
			posedata.orientation.y = oridata[i,1]
			total_info.poses.append(posedata)
			# total_info.poses[i].orientation.x = oridata[i,0]
			# total_info.poses[i].orientation.y = oridata[i,1]
		print('send data ******************************************************')
		print(total_info)
		pub.publish(total_info)
		# rospy.loginfo('send data ******************************************************')

		rate.sleep()

if __name__=='__main__':
	try:
		talker()
	except rospy.ROSInterruptException:
		pass