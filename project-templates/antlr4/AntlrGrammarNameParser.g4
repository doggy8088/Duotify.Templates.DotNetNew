parser grammar AntlrGrammarNameParser;

options { tokenVocab = AntlrGrammarNameLexer; }

start_rule
   : header_rule* body_rule+ EOF
   ;

header_rule
   : EXPORT_HEADER (RELEASE NUMBER SEMI)? window_property*
   | EXPORT_COMMENTS
   ;

body_rule
   : datatype_decl
   | access_modif
   | forward_decl
   | type_variables_decl
   | global_variables_decl
   | variable_decl
   | constant_decl
   | function_forward_decl
   | functions_forward_decl
   | function_body
   | on_body
   | event_body
   ;

window_property
   : attribute_name array_decl_sub? LPAREN window_property_attribute_sub* RPAREN
   ;

window_property_attribute_sub
   : ( NULL_
     | numeric_atom
     | DQUOTED_STRING
     | DATE
     | TIME
     | attribute_name eq=EQ (attribute_value array_decl_sub? | LPAREN window_property_attribute_sub+ RPAREN)
     ) COMMA?
   ;

attribute_name
   : (identifier_name | TYPE | UPDATE) NUMBER? (DOT (identifier_name | CASE | TYPE | ON | DYNAMIC))*
   ;

attribute_value
   : atom_sub_call1
   | atom_sub_member1
   | MINUS? numeric_atom
   | boolean_atom
   | ENUM
   | DQUOTED_STRING
   | QUOTED_STRING
   | DATE
   | TIME
   | TYPE
   | TO
   | FROM
   | REF
   | NULL_
   | OPEN
   | LPAREN LPAREN (expression | dataTypeSub) (COMMA (expression | dataTypeSub))? RPAREN (COMMA LPAREN (expression | dataTypeSub) (COMMA (expression | dataTypeSub))? RPAREN)* RPAREN
   | dataTypeSub (LPAREN NUMBER RPAREN)?
   ;

forward_decl
   : FORWARD (datatype_decl | variable_decl)+ END FORWARD
   ;

datatype_decl
   : scope_modif? TYPE identifier_name FROM (identifier_name TICK)? data_type_name (WITHIN identifier_name)? AUTOINSTANTIATE? (DESCRIPTOR DQUOTED_STRING EQ DQUOTED_STRING)? (variable_decl | event_forward_decl)* END TYPE
   | scope_modif? identifier_name identifier_name
   ;

type_variables_decl
   : TYPE VARIABLES (access_modif | variable_decl | constant_decl)* END VARIABLES
   ;

global_variables_decl
   : (GLOBAL | SHARED) VARIABLES (sql_statement | variable_decl | constant_decl)* END VARIABLES
   | (GLOBAL) (variable_decl | constant_decl)
   ;

variable_decl
   : variable_decl_sub
   ;

variable_decl_sub
   : access_type? data_type_name identifier_name array_decl_sub? ((EQ | GT | LT | GTLT | GTE | LTE) (add_expr | (LCURLY expression_list RCURLY)))? SEMI?
   | access_type? data_type_name identifier_name array_decl_sub? ((EQ | GT | LT | GTLT | GTE | LTE) (add_expr | (LCURLY expression_list RCURLY)))? (COMMA identifier_name array_decl_sub? ((EQ | GT | LT | GTLT | GTE | LTE) (add_expr | (LCURLY expression_list RCURLY)))?)+ SEMI?
   ;

decimal_decl_sub
   : LCURLY NUMBER RCURLY
   ;

array_decl_sub
   : BRACES
   | LBRACE ((PLUS | MINUS)? NUMBER (TO (PLUS | MINUS)? NUMBER)? (COMMA (PLUS | MINUS)? NUMBER (TO (PLUS | MINUS)? NUMBER)?)*)? RBRACE
   ;

constant_decl_sub
   : CONSTANT variable_decl_sub
   ;

constant_decl
   : constant_decl_sub
   ;

function_forward_decl
   : access_modif_part? scope_modif? (FUNCTION data_type_name | SUBROUTINE) identifier_name LPAREN parameters_list_sub? RPAREN (LIBRARY (DQUOTED_STRING | QUOTED_STRING) (ALIAS FOR (DQUOTED_STRING | QUOTED_STRING))?)? (RPCFUNC ALIAS FOR (DQUOTED_STRING | QUOTED_STRING))? (THROWS identifier_name)?
   ;

parameter_sub
   : READONLY? REF? data_type_name decimal_decl_sub? identifier_name array_decl_sub?
   ;

parameters_list_sub
   : parameter_sub (COMMA parameter_sub)* (COMMA DOTDOTDOT)?
   ;

functions_forward_decl
   : (FORWARD | TYPE) PROTOTYPES (access_modif | function_forward_decl)* END PROTOTYPES
   ;

function_body
   : access_type? scope_modif? (FUNCTION data_type_name | SUBROUTINE) identifier_name LPAREN parameters_list_sub? RPAREN (THROWS identifier_name)? SEMI? (statement)* END (FUNCTION | SUBROUTINE)
   ;

on_body
   : ON (identifier_name DOT)? (identifier_name | CREATE | DESTROY | OPEN | CLOSE) SEMI? (statement)* END ON
   ;

event_forward_decl
   : EVENT (identifier_name | OPEN | CREATE | DESTROY) identifier_name? (LPAREN parameters_list_sub? RPAREN)?
   | EVENT TYPE data_type_name identifier_name (LPAREN parameters_list_sub? RPAREN)
   ;

event_body
   : EVENT (TYPE data_type_name)? (identifier_name COLONCOLON)? (identifier_name | OPEN | CLOSE) (LPAREN parameters_list_sub? RPAREN)? SEMI statement* END EVENT
   ;

access_type
   : PUBLIC
   | PRIVATE
   | PROTECTED
   ;

access_modif
   : access_type COLON
   ;

access_modif_part
   : PUBLIC
   | PRIVATE
   | PRIVATEREAD
   | PRIVATEWRITE
   | PROTECTED
   | PROTECTEDREAD
   | PROTECTEDWRITE
   ;

scope_modif
   : GLOBAL
   | LOCAL
   ;

expression
   : close_call_sub
   | boolean_expression
   | THIS
   | THIS DOT ID
   | ID DOT ID
   | add_expr
   | atom (DOT atom)*
   ;

expression_list
   : REF? expression (COMMA REF? expression)*
   ;

boolean_expression
   : condition_or
   ;

condition_or
   : LPAREN? condition_and (OR condition_and)* RPAREN?
   ;

condition_and
   : LPAREN? condition_not (AND condition_not)* RPAREN?
   ;

condition_not
   : LPAREN? NOT? condition_comparison RPAREN? ( (EQ | GT | LT | GTLT | GTE | LTE) add_expr)*
   ;

condition_comparison
   : LPAREN? add_expr ((EQ | GT | LT | GTLT | GTE | LTE) add_expr)* RPAREN?
   ;

add_expr
   : LPAREN? mul_expr ((MINUS | PLUS) mul_expr)* RPAREN?
   ;

mul_expr
   : unary_sign_expr ((MULT | DIV | CARAT) unary_sign_expr)*
   ;

unary_sign_expr
   : LPAREN expression RPAREN
   | (MINUS | PLUS)? (THIS DOT)? atom (DOT atom)*
   | (MINUS | PLUS)? atom (DOT atom)*
   ;

statement
   : if_simple_statement SEMI?
   | DESCRIBE identifier_name SEMI?
   | assignment_statement SEMI?
   | statement_sub SEMI?
   | if_statement SEMI?
   | TRY
   | post_event SEMI?
   | function_call_statement SEMI?
   | event_call_statement SEMI?
   | constant_decl SEMI?
   | variable_decl SEMI?
   | super_call_statement SEMI?
   | do_loop_while_statement SEMI?
   | do_while_loop_statement SEMI?
   | create_call_statement SEMI?
   | destroy_call_statement SEMI?
   | label_stat
   | identifier
   | throw_stat
   | goto_stat
   | choose_statement
   | return_statement SEMI?
   | for_loop_statement
   | continue_statement SEMI?
   | exit_statement SEMI?
   | sql_statement
   | THIS (DOT atom)* SEMI?
   | atom (DOT atom)* SEMI?
   ;

statement_sub
   : function_call_expression_sub
   | return_statement
   | open_call_sub
   | close_call_sub
   | variable_decl_sub
   | super_call_statement
   | create_call_sub
   | destroy_call_sub
   | continue_sub
   | goto_stat
   | assignment_sub
   ;

assignment_sub
   : (THIS DOT)? lvalue_sub (DOT lvalue_sub)* (EQ | PLUSEQ | MINUSEQ | MULTEQ | DIVEQ) ((CREATE)? (NOT | boolean_expression | expression) | (LCURLY expression_list RCURLY))
   ;

assignment_statement
   : assignment_sub
   ;

lvalue_sub
   : atom_sub
   | atom_sub_call1
   | atom_sub_array1
   | atom_sub_ref1
   | atom_sub_member1
   ;

return_statement
   : RETURN expression?
   ;

function_call_expression_sub
   : expression DOT (FUNCTION | EVENT)? (STATIC | DYNAMIC)? (TRIGGER | POST)? atom_sub_call1
   ;

open_call_sub
   : OPEN LPAREN expression_list RPAREN
   ;

close_call_sub
   : CLOSE LPAREN expression_list RPAREN
   | HALT CLOSE
   ;

function_call_statement
   : function_call_expression_sub
   | open_call_sub
   | close_call_sub
   ;

super_call_statement
   : CALL (identifier_name TICK)? (atom_sub_call1 | atom_sub_member1)
   ;

event_call_statement_sub
   : (identifier_name DOT (identifier_name DOT)? | SUPER COLONCOLON)? EVENT atom_sub_call1
   ;

event_call_statement
   : event_call_statement_sub
   ;

create_call_sub
   : CREATE USING? (identifier_name DOT)? data_type_name (LPAREN expression_list? RPAREN)?
   ;

create_call_statement
   : create_call_sub
   ;

destroy_call_sub
   : DESTROY expression
   | DESTROY LPAREN expression RPAREN
   ;

destroy_call_statement
   : destroy_call_sub
   ;

for_loop_statement
   : FOR lvalue_sub EQ expression TO expression (STEP expression)? statement* (NEXT | END FOR)
   ;

do_while_loop_statement
   : DO (WHILE | UNTIL) boolean_expression statement* LOOP
   ;

do_loop_while_statement
   : DO statement* LOOP (WHILE | UNTIL) boolean_expression
   ;

if_statement
   : IF LPAREN? NOT? boolean_expression RPAREN? THEN statement* (ELSEIF boolean_expression THEN statement*)* (ELSE statement*)? END IF
   ;

if_simple_statement
   : IF boolean_expression THEN statement
   ;

continue_statement
   : CONTINUE
   ;

continue_sub
   : CONTINUE
   ;

post_event
   : (atom_sub_member1 DOT)? (POST | TRIGGER) EVENT? identifier_name_ex LPAREN expression_list? RPAREN
   ;

sql_statement
    : SQLSTMT
    ;

exit_statement
   : EXIT
   ;

choose_statement
   : CHOOSE CASE (expression | identifier_name) ( choose_case_range_sub
                            | choose_case_cond_sub
                            | choose_case_else_sub
                            | choose_case_value_sub)+
     END CHOOSE
   ;

choose_case_value_sub
   : CASE expression (COMMA expression)* statement*
   ;

choose_case_cond_sub
   : CASE IS (EQ | GT | LT | GTLT | GTE | LTE) expression statement*
   ;

choose_case_range_sub
   : CASE atom TO atom statement*
   ;

choose_case_else_sub
   : CASE ELSE statement*
   ;

goto_stat
   : GOTO identifier_name
   ;

label_stat
   : identifier_name COLON
   ;

try_catch_block
   : TRY statement* (CATCH LPAREN variable_decl_sub RPAREN statement*)* (FINALLY statement*)? END TRY
   ;

throw_stat
   : THROW expression
   ;

identifier
   : identifier_name_ex
   | SUPER COLONCOLON (CREATE | DESTROY | identifier_name_ex)
   | identifier_name COLONCOLON (CREATE | DESTROY)
   | identifier_name DOT (CREATE | DESTROY)
   | identifier_name COLONCOLON identifier_name_ex
   ;

identifier_name_ex
   : identifier_name
   | SELECT
   | TYPE
   | UPDATE
   | DELETE
   | OPEN
   | CLOSE
   | GOTO
   | INSERT
   | DESCRIBE
   | TIME
   | READONLY
   ;

identifier_name
   : ID
   ;

atom_sub
   : array_access_atom
   | identifier_name PLUSPLUS
   | identifier_name (LPAREN expression_list? RPAREN)
   // | identifier_name (LBRACE expression_list RBRACE)? DOT identifier_name_ex (LPAREN expression_list? RPAREN)?
   // | identifier_name (LBRACE expression_list RBRACE)? DOT identifier_name (LBRACE expression_list RBRACE)? DOT identifier_name_ex (LPAREN expression_list? RPAREN)?
   // | identifier_name (LBRACE expression_list RBRACE)? DOT identifier_name (LBRACE expression_list RBRACE)? DOT identifier_name (LBRACE expression_list RBRACE)? DOT identifier_name_ex (LPAREN expression_list? RPAREN)?
   // | identifier_name (LBRACE expression_list RBRACE)? DOT identifier_name (LBRACE expression_list RBRACE)? DOT identifier_name (LBRACE expression_list RBRACE)? DOT identifier_name (LBRACE expression_list RBRACE)? DOT identifier_name_ex (LPAREN expression_list? RPAREN)?
   ;

atom_sub_call1
   : (identifier | DESCRIBE) LPAREN expression_list? RPAREN
   ;

atom_sub_array1
   : identifier_name LBRACE expression_list RBRACE
   ;

atom_sub_ref1
   : identifier_name BRACES
   ;

atom_sub_member1
   : identifier
   ;

atom
   : event_call_statement_sub
   | atom_sub
   | cast_expression
   | atom_sub_call1
   | atom_sub_array1
   | atom_sub_ref1
   | atom_sub_member1
   | numeric_atom
   | boolean_atom
   | ENUM
   | DQUOTED_STRING
   | QUOTED_STRING
   | DATE
   | TIME
   | HALT
   ;

array_access_atom
   : identifier_name LBRACE expression_list RBRACE
   ;

numeric_atom
   : NUMBER
   ;

boolean_atom
   : TRUE
   | FALSE
   ;

cast_expression
   : dataTypeSub LPAREN expression (COMMA expression)* RPAREN
   ;

data_type_name
   : dataTypeSub (LCURLY expression RCURLY)?
   | identifier_name
   ;

dataTypeSub
   : ANY
   | BLOB
   | BOOLEAN
   | BYTE
   | CHARACTER
   | CHAR
   | DATE_TYPE
   | DATETIME
   | DECIMAL
   | DEC
   | DOUBLE
   | INTEGER
   | INT
   | LONG
   | LONGLONG
   | REAL
   | STRING
   | TIME_TYPE
   | UNSIGNEDINTEGER
   | UINT
   | UNSIGNEDLONG
   | ULONG
   | WINDOW
   | NONVISUALOBJECT
   ;