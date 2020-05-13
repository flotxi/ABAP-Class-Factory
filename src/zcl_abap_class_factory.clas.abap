CLASS zcl_abap_class_factory DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC
  GLOBAL FRIENDS zcl_abap_class_factory_inject.
  PUBLIC SECTION.
    METHODS constructor
      IMPORTING
        i_classname TYPE string.
    METHODS
      construct
        IMPORTING
          i_parameters      TYPE abap_parmbind_tab OPTIONAL
        RETURNING
          VALUE(r_instance) TYPE REF TO object.
  PROTECTED SECTION.
  PRIVATE SECTION.
    CLASS-DATA:
       objects TYPE TABLE OF ty_object.
    DATA:
       classname TYPE string.
    METHODS create
      RETURNING
        VALUE(r_instance) TYPE REF TO object.
    METHODS create_with_parameters
      IMPORTING
        i_parameters      TYPE abap_parmbind_tab
      RETURNING
        VALUE(r_instance) TYPE REF TO object.
ENDCLASS.
CLASS zcl_abap_class_factory IMPLEMENTATION.
  METHOD constructor.
    me->classname = i_classname.
  ENDMETHOD.
  METHOD construct.
    TRY.
        r_instance = objects[ classname = me->classname ]-instance.

      CATCH cx_sy_itab_line_not_found.
        r_instance = COND #( WHEN i_parameters IS SUPPLIED THEN create_with_parameters( i_parameters )
                                                           ELSE create( )  ).
    ENDTRY.
  ENDMETHOD.
  METHOD create.
    CREATE OBJECT r_instance TYPE (me->classname).
  ENDMETHOD.
  METHOD create_with_parameters.
    CREATE OBJECT r_instance TYPE (me->classname)
       PARAMETER-TABLE i_parameters.
  ENDMETHOD.
ENDCLASS.
