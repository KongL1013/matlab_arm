#!/usr/bin/env python2.7
import rospy
from std_msgs.msg import Int32
from geometry_msgs.msg import Pose
from geometry_msgs.msg import PoseArray
import time 


def talker():
	pub=rospy.Publisher("/detect_info",PoseArray,queue_size = 10)
	rospy.init_node("sender",anonymous=True)
	rate=rospy.Rate(5)

	posedata1 = Pose()
	posedata2 = Pose()
	total_info = PoseArray()

	while not rospy.is_shutdown():
		posedata1.orientation.x = 1
		posedata1.orientation.y = 2
		posedata1.orientation.z = 3
		posedata1.position.x = 2.5


		posedata2.orientation.x= -1
		posedata2.orientation.y = -2
		posedata2.orientation.z = -3
		posedata2.position.x = -2.5

		print(total_info)
		total_info.poses = [posedata1,posedata2]

		pub.publish(total_info)
		rospy.loginfo('send data')
		rate.sleep()

if __name__=='__main__':
	try:
		talker()
	except rospy.ROSInterruptException:
		pass