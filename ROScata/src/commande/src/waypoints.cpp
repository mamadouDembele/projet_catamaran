#include "ros/ros.h"


#include "commande/Waypoint.h"

bool service_callback(commande::Waypoint::Request  &req,
	commande::Waypoint::Response &res)
{
	if (req.enter){
		res.x = 5;
		res.y = 5;
	}
	
	return true;
}


int main(int argc, char **argv)
{   
    ros::init(argc, argv, "node_waypoint");
    ros::NodeHandle n;

    //Publisher
    ros::ServiceServer service = n.advertiseService("service_waypoint", service_callback);
    ros::spin();

}