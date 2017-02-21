
namespace HAPI {

  namespace Collision {

    class HAPI_API PlaneConstraint {

    public:
      /// Constructor.
      PlaneConstraint( const Vec3 &p = Vec3(), 
                       const Vec3 &n = Vec3(1, 0, 0), 
                       const Vec3 &tc = Vec3(), 
                       HAPIHapticShape *shape = NULL,
                       GeometryPrimitive *_primitive = NULL );

      bool lineIntersect( const Vec3 &from, 
                          const Vec3 &to,    
                          Collision::IntersectionInfo &result );

                          
      inline bool isAbove( const Vec3 &p ) const;

      inline Vec3 projectOnto( const Vec3 &p ) const;

      Vec3 point, normal;
      Vec3 tex_coord;
      H3DUtil::AutoRef< HAPIHapticShape > haptic_shape;
      GeometryPrimitive * primitive;
    };
  }
  
  class Constraints {
  public:

    Constraints( unsigned int size = 3000 );

    ~Constraints();

    /*
    class iterator {
    public:
      const static unsigned int end_value = 1929294;
      
      inline iterator( unsigned int _index = end_value, 
                       unsigned int _size = 0, 
                       Constraints *o = NULL ):
        index( _index ), size( _size ), owner( o ) {
        
      }
      
      inline iterator& operator++(void) {
        if( index != end_value ) ++index;
        if( index == size ) index = end_value;
        return *this;
      }
      
      inline iterator operator++(int) {
        iterator old_val(*this);  
        operator++();    
        return old_val;   
      }  

      inline iterator operator+(int i) {  
        if( index != end_value ) index += i;
        if( index >= size ) index = end_value;
        return *this;
      }  

      inline PlaneConstraint & operator*() {
        return owner->constraints[index];
      }
      inline bool operator==( const iterator &i ) {
        return index == i.index; 
      }
      inline bool operator!=( const iterator &i ) {
        return index != i.index;
      }

      unsigned int index, size;
      Constraints *owner;

    };
    */


    inline PlaneConstraint & operator[]( int i );

    inline PlaneConstraint & operator[]( unsigned int i );

    /*
    inline iterator begin() { 
      if( !empty() ) return iterator( 0, nr_constraints, this );
      else return end();
    }
    inline iterator end() {
      return iterator( iterator::end_value, nr_constraints, this );
    }
    */
    
    inline void clear();
    inline bool empty();
    inline unsigned int size();

    /*
    inline void insert( iterator pos, iterator s, iterator e );
    */
    
    inline void push_back( const PlaneConstraint &p );

    inline PlaneConstraint & front();
    inline PlaneConstraint & back();

    /*
    unsigned int min_allocated_constraints;
    unsigned int allocated_constraints;
    unsigned int nr_constraints;
    PlaneConstraint *constraints;
    */
  };

}

