#include "ros/ros.h"
#include "tf/tf.h"

#include "eigen3/Eigen/Dense"
#include <stdlib.h>
#include <math.h>

#include "std_msgs/Float64.h"
#include "std_msgs/String.h"

#include "geometry_msgs/PointStamped.h"
#include "geometry_msgs/TwistStamped.h"
#include <geometry_msgs/AccelStamped.h>
#include "geometry_msgs/PoseStamped.h"

#include "geometry_msgs/Twist.h" // Maybe to transform into a TwistStamped
#include "geometry_msgs/PoseWithCovarianceStamped.h"
//#include <visualization_msgs/Marker.h>
#include "commande/Etat.h"
#include "commande/Waypoint.h"
#include "commande/Control.h"

//constante proportionnelle
double kp1=1;  // constante k pour le servo-moteur 1
double kp2=1; //constante k pour le servo-moteur 2
double a1=1;  //constante k pour le moteur 1
double a2=1;  //constante k pour le moteur 2

// l'état du catamaran
double pos_x,pos_y,phi,vx,vy,wz;

// les commandes à envoyer aux moteurs et servo-moteurs
Eigen::Vector2d cap_phi={0.,0.};
Eigen::Vector2d u={0.,0.};

//les waypoints initiales et waypoints à validé
Eigen::Vector2d wayp_a={0.,0.},wayp_b;

double sawtooth(double x)
{
	return 2.*atan(tan(x/2.));
}

void etatCallback(const commande::Etat::ConstPtr& msg) {
    pos_x = msg->x;
    pos_y = msg->y;
    phi=msg->cap;
    vx=msg->u;
    vy=msg->v;
    wz=msg->r;
}


void controlcap(Eigen::Vector2d a, Eigen::Vector2d b, double vx, double phi, Eigen::Vector2d& m,Eigen::Vector2d& u,Eigen::Vector2d& phi_cap){
	double e,err;
	double norm=sqrt(pow((b-a)[0],2)+pow((b-a)[1],2));

	e=(m-a)[0]*((b-a)[0])/norm-(m-a)[1]*((b-a)[1])/norm; //erreur par rapport à la ligne à suivre
	double alpha=atan2((b-a)[1],(b-a)[0]);
	double capd=alpha-atan(e);//cap désiré

	err=sqrt(pow((b-m)[0],2)+pow((b-m)[1],2));
	double vd=sqrt(err); //vitesse desiré

	//calcule de commande moteur
	phi_cap[0]=kp1*sawtooth(capd-phi);
	phi_cap[1]=kp2*sawtooth(capd-phi);
	u[0]=a1*tanh(vd-vx);
	u[1]=a2*tanh(vd-vx);
}

int main(int argc, char **argv)
{   
    ros::init(argc, argv, "node_regulation");
    ros::NodeHandle n;
    ros::ServiceClient client = n.serviceClient<commande::Waypoint>("service_waypoint");
    ros::Subscriber etat_robot= n.subscribe("etat_catamaran", 1000, &etatCallback);
    ros::Publisher com_moteur = n.advertise<commande::Control>("actionneurs", 1000);
    ros::Rate loop_rate(25);

    commande::Waypoint srv;
    srv.request.enter=true;
    
    while (ros::ok()) {

    //on appelle le node waypoint pour recupérer le prochain waypoint 
    if (client.call(srv)){// Appel du serviceROS_INFO
		wayp_b[0]=srv.response.x;
		wayp_b[1]=srv.response.y;
	}

	else{
		ROS_ERROR("failed to call service");
    	
	}

	commande::Control com;
	//on fait la regulation en cap
	Eigen::Vector2d m={pos_x,pos_y};
	controlcap(wayp_a,wayp_b,vx,phi,m,u,cap_phi);
	com.u1=u[0];
	com.u2=u[1];
	com.theta1=cap_phi[0];
	com.theta2=cap_phi[1];
	com_moteur.publish(com);
	ros::spinOnce();
    loop_rate.sleep();
    }


}