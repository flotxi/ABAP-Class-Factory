*"* use this source file for any type of declarations (class
*"* definitions, interfaces or type declarations) you need for
*"* components in the private section
    TYPES: BEGIN OF ty_object,
             classname TYPE string,
             instance  TYPE REF TO object.
    TYPES: END OF ty_object.
