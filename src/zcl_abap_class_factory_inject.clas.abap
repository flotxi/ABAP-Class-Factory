CLASS zcl_abap_class_factory_inject DEFINITION
  PUBLIC
  FINAL
  CREATE PRIVATE FOR TESTING.
  PUBLIC SECTION.
    CLASS-METHODS:
      inject_instance
        IMPORTING
          i_classname TYPE string
          i_instance  TYPE REF TO object.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.
CLASS zcl_abap_class_factory_inject IMPLEMENTATION.
  METHOD inject_instance.
    TRY.
        zcl_abap_class_factory=>objects[ classname = i_classname ]-instance = i_instance.

      CATCH cx_sy_itab_line_not_found.
        INSERT VALUE #( classname = i_classname
                        instance  = i_instance   ) INTO TABLE zcl_abap_class_factory=>objects.
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
