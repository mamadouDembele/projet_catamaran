// Generated by gencpp from file commande/Control.msg
// DO NOT EDIT!


#ifndef COMMANDE_MESSAGE_CONTROL_H
#define COMMANDE_MESSAGE_CONTROL_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace commande
{
template <class ContainerAllocator>
struct Control_
{
  typedef Control_<ContainerAllocator> Type;

  Control_()
    : u1(0.0)
    , u2(0.0)
    , theta1(0.0)
    , theta2(0.0)  {
    }
  Control_(const ContainerAllocator& _alloc)
    : u1(0.0)
    , u2(0.0)
    , theta1(0.0)
    , theta2(0.0)  {
  (void)_alloc;
    }



   typedef double _u1_type;
  _u1_type u1;

   typedef double _u2_type;
  _u2_type u2;

   typedef double _theta1_type;
  _theta1_type theta1;

   typedef double _theta2_type;
  _theta2_type theta2;





  typedef boost::shared_ptr< ::commande::Control_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::commande::Control_<ContainerAllocator> const> ConstPtr;

}; // struct Control_

typedef ::commande::Control_<std::allocator<void> > Control;

typedef boost::shared_ptr< ::commande::Control > ControlPtr;
typedef boost::shared_ptr< ::commande::Control const> ControlConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::commande::Control_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::commande::Control_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace commande

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/melodic/share/std_msgs/cmake/../msg'], 'commande': ['/home/dembele/Projet_indus/projet_catamaran/ROScata/src/commande/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::commande::Control_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::commande::Control_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::commande::Control_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::commande::Control_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::commande::Control_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::commande::Control_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::commande::Control_<ContainerAllocator> >
{
  static const char* value()
  {
    return "36a12991b3aa0a1fb168436c13f70d4e";
  }

  static const char* value(const ::commande::Control_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x36a12991b3aa0a1fULL;
  static const uint64_t static_value2 = 0xb168436c13f70d4eULL;
};

template<class ContainerAllocator>
struct DataType< ::commande::Control_<ContainerAllocator> >
{
  static const char* value()
  {
    return "commande/Control";
  }

  static const char* value(const ::commande::Control_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::commande::Control_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 u1\n"
"float64 u2\n"
"float64 theta1\n"
"float64 theta2\n"
"\n"
;
  }

  static const char* value(const ::commande::Control_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::commande::Control_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.u1);
      stream.next(m.u2);
      stream.next(m.theta1);
      stream.next(m.theta2);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Control_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::commande::Control_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::commande::Control_<ContainerAllocator>& v)
  {
    s << indent << "u1: ";
    Printer<double>::stream(s, indent + "  ", v.u1);
    s << indent << "u2: ";
    Printer<double>::stream(s, indent + "  ", v.u2);
    s << indent << "theta1: ";
    Printer<double>::stream(s, indent + "  ", v.theta1);
    s << indent << "theta2: ";
    Printer<double>::stream(s, indent + "  ", v.theta2);
  }
};

} // namespace message_operations
} // namespace ros

#endif // COMMANDE_MESSAGE_CONTROL_H