

/*******************************************************************
redefinition of nested class "HAPI::HAPIHapticsDevice::DeviceValues"
********************************************************************/
struct DeviceValues {
    DeviceValues();

    HAPI::Vec3 force;
    HAPI::Vec3 torque;
    HAPI::Vec3 position;
    HAPI::Vec3 velocity;
    HAPI::Rotation orientation;
    HAPI::HAPIInt32 button_status;
    void *user_data;
};



/********************************************************************************
redefinition of nested class "HAPI::HAPIHapticsDevice::HapticsDeviceRegistration"
*********************************************************************************/
/*
struct HapticsDeviceRegistration {
    HapticsDeviceRegistration( const string &_name, HAPI::HAPIHapticsDevice::CreateInstanceFunc _create, list< string > _libs_to_support = list<string >() );

    string name;
    HAPI::HAPIHapticsDevice::CreateInstanceFunc create_func;
    list< string > libs_to_support;
};
*/

/*******************************************************************
redefinition of nested class "HAPI::HAPIHapticsDevice::ErrorHandler"
********************************************************************/
/*
class ErrorHandler: public H3DUtil::RefCountedClass {
public:
    virtual void handleError( HAPI::HAPIHapticsDevice *hd, long internal_error_code, string error_string ) = 0;
};
*/
/**************************************************************************
redefinition of nested class "HAPI::HAPIHapticsDevice::DefaultErrorHandler"
***************************************************************************/
/*
class DefaultErrorHandler: public ErrorHandler {
public:
    virtual void handleError( HAPI::HAPIHapticsDevice *hd, long internal_error_code, string error_string );
};
*/


/*********************************
definition HAPI::HAPIHapticsDevice
**********************************/
namespace HAPI {

  class HAPIHapticsDevice {
  public:

    typedef enum { UNINITIALIZED, INITIALIZED,  ENABLED } DeviceState;
    typedef enum { SUCCESS = 0, NOT_INITIALIZED,  NOT_ENABLED, FAIL } ErrorCode;

    std::string profiled_result_haptic[2];


    typedef H3DUtil::AutoRefVector< HAPIHapticShape > HapticShapeVector;
    typedef H3DUtil::AutoRefVector< HAPIForceEffect > HapticEffectVector;

    HAPIHapticsDevice();
    virtual ~HAPIHapticsDevice();

    virtual ErrorCode initDevice( int _thread_frequency = 1024 );
    inline virtual ErrorCode enableDevice();
    inline virtual ErrorCode disableDevice();
    inline virtual ErrorCode releaseDevice();      

    template< class InputIterator > 
    inline void addShapes( InputIterator begin, InputIterator end, unsigned int layer = 0 );

	inline void addShape( HAPIHapticShape *__HAPIHapticShape__DISOWN__, unsigned int layer = 0 );
    inline void setShapes( const HapticShapeVector &shapes, unsigned int layer = 0 );
    inline const HapticShapeVector &getShapes( unsigned int layer = 0 );
    inline void removeShape( HAPIHapticShape *shape, unsigned int layer = 0 );
    inline void swapShapes( HapticShapeVector &shapes, unsigned int layer = 0 );
    inline void clearShapes( unsigned int layer = 0 );
    

    template< class InputIterator > 
    inline void addEffects( InputIterator begin, InputIterator end );

	inline void addEffect( HAPIForceEffect *__HAPIForceEffect__DISOWN__, HAPITime fade_in_time = 0 );
    inline void setEffects( const HapticEffectVector &effects, HAPITime _switch_effects_duration = 0 );
    inline HapticEffectVector getEffects();
    inline void removeEffect( HAPIForceEffect *effect, HAPITime fade_out_time = 0 );
    inline void swapEffects( HapticEffectVector &effects, HAPITime _switch_effects_duration = 0 );
    inline void clearEffects();
    virtual void transferObjects();


    inline void setPositionCalibration( const Matrix4 &m, const Matrix4 &m_inv );
    inline void setPositionCalibration( const Matrix4 &m );
    inline const Matrix4 &getPositionCalibration();
  
    inline const Matrix4 &getPositionCalibrationInverse();
    inline void setOrientationCalibration( const Rotation &r );

    inline const Rotation &getOrientationCalibration();

    inline DeviceState getDeviceState();

#ifdef HAVE_PROFILER
    inline std::string getProfiledResult();
#endif

    inline DeviceValues getRawDeviceValues();
    inline DeviceValues getLastRawDeviceValues();
    inline DeviceValues getDeviceValues();
    inline DeviceValues getLastDeviceValues();
    inline Vec3 getRawPosition();
    inline Vec3 getRawVelocity();
    inline Rotation getRawOrientation();
    inline Vec3 getPosition();
    inline Vec3 getVelocity();
    inline Rotation getOrientation();
    inline HAPIInt32 getButtonStatus();
    inline bool getButtonStatus( unsigned int button_nr );
    inline Vec3 getRawForce();
    inline Vec3 getRawTorque();
    inline Vec3 getForce();
    inline Vec3 getTorque();
    inline Vec3 getLastRawPosition();
    inline Vec3 getLastRawVelocity();
    inline Rotation getLastRawOrientation();
    inline Vec3 getLastRawForce();
    inline Vec3 getLastRawTorque();
    inline Vec3 getLastPosition();
    inline Vec3 getLastVelocity();
    inline Rotation getLastOrientation();
    inline Vec3 getLastForce();
    inline Vec3 getLastTorque();
    inline HAPIInt32 getLastButtonStatus();

    inline bool getLastButtonStatus( unsigned int button_nr );
    inline void setHapticsRenderer( HAPIHapticsRenderer * __HAPIHapticsRenderer__DISOWN__, unsigned int layer = 0 );  //MODIFIED ARG NAME TO ACTIVATE THE DISOWN METHOD
    inline unsigned int nrLayers();
    inline HAPIHapticsRenderer *getHapticsRenderer( unsigned int layer = 0 );
    inline const string &getLastErrorMsg();
    
    
    inline unsigned int getHapticsRate();
    inline HAPITime getTimeSpentInLastLoop();
    inline H3DUtil::PeriodicThreadBase *getThread();
    HAPIFloat getMaxStiffness();
    inline HAPIFloat getForceLimit();
    inline HAPIFloat getTorqueLimit();

    inline void setForceLimit( HAPIFloat limit );
    inline void setTorqueLimit( HAPIFloat limit );

    typedef HAPIHapticsDevice*( *CreateInstanceFunc)(); 

    template< class N >
    static HAPIHapticsDevice *newInstance();

	ErrorHandler *getErrorHandler();
	virtual void setErrorHandler( ErrorHandler *_error_handler );


	static void registerDevice( const string &name, CreateInstanceFunc create, list< string > libs_to_support );
    static void registerDevice( const HapticsDeviceRegistration &fr );


    static bool initialized;



  protected:
	virtual bool initHapticsDevice( int _thread_frequency = 1024 ) = 0; // To keep the fact that the class is abstract
  };
}




