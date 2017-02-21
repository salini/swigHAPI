

/******************************************************************
redefinition of nested class "HAPI::HAPISurfaceObject::ContactInfo"
*******************************************************************/
struct HAPI_API ContactInfo {
    inline HAPI::Vec3       globalForce();
    inline HAPI::Vec3       globalTorque();
	inline HAPI::Matrix4    localToGlobalMatrix();
    inline HAPI::Matrix4    globalToLocalMatrix();
    inline HAPI::Vec3       contactPointTexCoord();
    inline HAPI::HAPIHapticsDevice*              hapticsDevice();
    inline HAPI::Collision::GeometryPrimitive*   primitive();
    inline HAPI::HAPIHapticShape*                hapticShape();
    inline HAPI::Vec3       xAxis();
    inline HAPI::Vec3       yAxis();
    inline HAPI::Vec3       zAxis();
    inline HAPI::Vec3       pointToGlobal( const HAPI::Vec3 &p );
    inline HAPI::Vec3       pointToLocal( const HAPI::Vec3 &p );
    inline HAPI::Vec3       vectorToGlobal( const HAPI::Vec3 &p );
    inline HAPI::Vec3       vectorToLocal( const HAPI::Vec3 &p );
    inline HAPI::Vec3       globalContactPoint();
    inline HAPI::Vec3       localContactPoint();
    inline HAPI::Vec3       globalSurfaceContactPoint();
    inline HAPI::Vec3       localSurfaceContactPoint();
    inline HAPI::Vec3       globalProbePosition();
    inline HAPI::Vec3       localProbePosition();
    inline HAPI::Vec3       globalProbeVelocity();
    inline HAPI::Vec3       localProbeVelocity();
    inline HAPI::Vec3       globalOrigin();
    inline HAPI::Vec3       globalProxyPosition();
    inline HAPI::Vec2       localProxyMovement();
    inline void             setLocalForce( const HAPI::Vec3 &f );
    inline void             setGlobalForce( const HAPI::Vec3 &f );
    inline void             setLocalTorque( const HAPI::Vec3 &t );
    inline void             setGlobalTorque( const HAPI::Vec3 &t );
    inline void             setLocalProxyMovement( const HAPI::Vec2 &pm );
    inline void             setGlobalOrigin( const HAPI::Vec3 &o );
    inline void             setGlobalContactPoint( const HAPI::Vec3 &point );
    inline void             setXAxis( const HAPI::Vec3 &axis );
    inline void             setYAxis( const HAPI::Vec3 &axis );
    inline void             setZAxis( const HAPI::Vec3 &axis );
    inline void             setHapticShape( HAPI::HAPIHapticShape * shape );
    inline void             setPrimitive( HAPI::Collision::GeometryPrimitive * primitive );
    inline void             setHapticsDevice( HAPI::HAPIHapticsDevice *_hd );
    inline void             setGlobalProbePosition( const HAPI::Vec3 &point );
    inline void             setGlobalProbeVelocity( const HAPI::Vec3 &velocity );
    inline void             setProxyRadius( HAPI::HAPIFloat radius );
    inline void             setContactPointTexCoord( const HAPI::Vec3 &coord );
}; 




/*********************************
definition HAPI::HAPISurfaceObject
**********************************/
namespace HAPI {

  class HAPIHapticsDevice;
  class HAPIHapticShape;

  class HAPI_API HAPISurfaceObject:public H3DUtil::RefCountedClass {
  public:
    HAPISurfaceObject( bool _use_ref_count_lock = true );
    virtual ~HAPISurfaceObject();

    virtual void getProxyMovement( ContactInfo &contact_info );
    virtual void getForces( ContactInfo &contact_info );

  };
}
