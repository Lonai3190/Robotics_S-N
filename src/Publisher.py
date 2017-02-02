#!/usr/bin/env python
import rospy
from std_msgs.msg import String

def publisher():
	pub= rospy.Publisher('Order',String,queue_size=10)
	rospy.init_node('publisher',anonymous=True)
	rate=rospy.Rate(10) #10 hz
	
	while not rospy.is_shutdown():
	joke = "Why can't a bicycle stand up on it's own %s" % rospy.get_time()
        rospy.loginfo(joke)
        pub.publish(joke)
        rate.sleep()

if __name__ == '__main__':
	try:
            publisher()
        except rospy.ROSInterruptException:
           pass

