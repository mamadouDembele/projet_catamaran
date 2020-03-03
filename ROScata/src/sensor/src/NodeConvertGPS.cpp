#include <iostream>
#include <unistd.h>

#include <ros/ros.h>
#include <sensor/GPSFix.h>
#include <sensor/GnssPose.h>
#include <cmath>

#include <proj_api.h>

using namespace std;
using namespace sensor;

double latitude, longitude, track;
bool new_data = false;
bool data_valid = false;
//double east0 = 253575.276988;
//double north0 = 6805716.83588;

// to modify in order to set the origine where we want
double east0 = 253495.324541;
double north0 = 6805738.35646;

void navFix_callback(const sensor::GPSFix::ConstPtr& msg){
    latitude =  msg->latitude;
    longitude =  msg->longitude;
    track = msg->track;
    data_valid = (msg->status>=msg->STATUS_MODE_2D);
    new_data = true;
}

int main(int argc, char *argv[])
{
    ros::init(argc, argv, "lambert_node");
    ros::NodeHandle n;

    // Parameters
    ros::NodeHandle n_private("~");
    double frequency = n_private.param<double>("frequency", 1.0);

    // Init proj
    projPJ pj_lambert, pj_latlong;
    if (!(pj_lambert = pj_init_plus("+init=epsg:2154")))
    {
        ROS_WARN("[Lambert_node] Error Lambert \n");
        exit(1);
    }

    if (!(pj_latlong = pj_init_plus("+init=epsg:4326")))
    {
        ROS_WARN("[Lambert_node] Error LatLong \n");
        exit(1);
    }

    // Topics
    ros::Subscriber navFix_sub = n.subscribe("fix", 1, navFix_callback);
    ros::Publisher pose_pub = n.advertise<sensor::GnssPose>("poseRaw", 1);

    sensor::GnssPose msg_pose;

    ROS_INFO("[FUSION lambert] Start Ok");
    ros::Rate loop_rate(frequency);
    while (ros::ok())
    {
        ros::spinOnce();
        if(new_data)
        {
            if(longitude != 0. && latitude != 0. && data_valid)
            {
                double east = longitude*M_PI/180.0; // Longitude
                double north = latitude*M_PI/180.0; // Latitude
                pj_transform(pj_latlong, pj_lambert, 1, 1, &east, &north, nullptr);
                msg_pose.east = east - east0;
                msg_pose.north = north - north0;
                msg_pose.heading = track;

                pose_pub.publish(msg_pose);
            }
            new_data = false;
        }
        loop_rate.sleep();
    }
    pj_free(pj_latlong);
    pj_free(pj_lambert);
    return 0;
}