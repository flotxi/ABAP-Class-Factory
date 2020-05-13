# ABAP-Class-Factory
Generic class factory to reduce the overhead on factory injection

To avoid creating Factory- and it's Injectorclass for each and every class you want to make Unit-testable use this class.

# Example
  DATA cut TYPE REF TO zif_creation_test.

  cut = CAST #( NEW zcl_abap_class_factory( 'ZCL_NO_PARAMETERS' )->construct(  ) ).

  cut = CAST #( NEW zcl_abap_class_factory( 'ZCL_WITH_PARAMETERS' )->construct(
                      VALUE #( ( name = 'I_STRING' value = NEW string( 'STRING' ) )
                               ( name = 'I_NETWR ' value = NEW string( 'ANOTHER STRING' ) ) ) ) ).

Both classes implement the same interface, but ZCL_WITH_PARAMETERS has 2 parameters in the constructor.
