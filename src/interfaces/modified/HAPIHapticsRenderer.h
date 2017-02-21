

namespace HAPI {

  class HAPIHapticsDevice;

  class HAPI_API HAPIHapticsRenderer {
  public:

    typedef H3DUtil::AutoRefVector< HAPIHapticShape > HapticShapeVector;
	typedef std::vector< pair< H3DUtil::AutoRef< HAPI::HAPIHapticShape >, HAPISurfaceObject::ContactInfo> > Contacts;
	typedef HAPIHapticsRenderer*( *CreateInstanceFunc)(); 

    virtual void initRenderer( HAPIHapticsDevice *hd );
    virtual void releaseRenderer( HAPIHapticsDevice *hd );
    virtual void preProcessShapes( HAPIHapticsDevice *hd, const HapticShapeVector &shapes );
    virtual ~HAPIHapticsRenderer();
    virtual HAPIForceEffect::EffectOutput renderHapticsOneStep( HAPIHapticsDevice *hd, const HapticShapeVector &shapes );
    virtual HAPIForceEffect::EffectOutput renderHapticsOneStep( HAPIHapticsDevice *hd, const HapticShapeVector &shapes, HAPITime dt );
    
    inline Contacts getContacts();

    template< class N >
    static HAPIHapticsRenderer *newInstance();

	/*==============================================================================
	 * we don't expose this struct, it seems to complicated to use it in proxy
	 *
    struct HAPI_API HapticsRendererRegistration{
    public:
      HapticsRendererRegistration( const string &_name, CreateInstanceFunc _create );

      string name;
      CreateInstanceFunc create_func;
    };
	static void registerRenderer( const HapticsRendererRegistration &fr );
	 *
	 *
	===============================================================================*/

    static void registerRenderer( const string &name, CreateInstanceFunc create );
    void cleanUpStuff( HAPIHapticsDevice *hd );
  
  };
}