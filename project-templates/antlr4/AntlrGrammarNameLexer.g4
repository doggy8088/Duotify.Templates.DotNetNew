lexer grammar AntlrGrammarNameLexer;

// Keywords

ANY:                A N Y  ;
BLOB:               B L O B ;
BOOLEAN:            B O O L E A N ;
BYTE:               B Y T E ;
CHARACTER:          C H A R A C T E R ;
CHAR:               C H A R ;
CONSTANT:           C O N S T A N T ;
DATE_TYPE:          D A T E ;
DATETIME:           D A T E T I M E ;
DECIMAL:            D E C I M A L ;
DEC:                D E C  ;
DOUBLE:             D O U B L E ;
INTEGER:            I N T E G E R ;
INT:                I N T  ;
LONG:               L O N G ;
LONGLONG:           L O N G L O N G ;
REAL:               R E A L ;
STRING:             S T R I N G ;
TIME_TYPE:          T I M E ;
UNSIGNEDINTEGER:    U N S I G N E D I N T E G E R ;
UINT:               U I N T ;
UNSIGNEDLONG:       U N S I G N E D L O N G ;
ULONG:              U L O N G ;
WINDOW:             W I N D O W ;
// FUNCTION_OBJECT:    F U N C T I O N '_' O B J E C T ;
TRUE:               T R U E ;
FALSE:              F A L S E ;
GLOBAL:             G L O B A L ;
SHARED:             S H A R E D ;
END:                E N D ;
INDIRECT :          I N D I R E C T ;
VARIABLES:          V A R I A B L E S ;
FORWARD:            F O R W A R D ;
PUBLIC:             P U B L I C ;
PRIVATE:            P R I V A T E ;
FUNCTION:           F U N C T I O N ;
SUBROUTINE:         S U B R O U T I N E ;
READONLY:           R E A D O N L Y ;
PROTOTYPES:         P R O T O T Y P E S ;
TYPE:               T Y P E ;
ON:                 O N ;
TO:                 T O ;
FROM:               F R O M ;
REF:                R E F ;
NULL_:              N U L L ;
UPDATE:             U P D A T E ;
CASE:               C A S E ;
STATIC:             S T A T I C ;
DYNAMIC:            D Y N A M I C ;
WITHIN:             W I T H I N ;
PRIVATEWRITE:       P R I V A T E W R I T E ;
PROTECTED:          P R O T E C T E D ;
PRIVATEREAD:        P R I V A T E R E A D ;
PROTECTEDREAD:      P R O T E C T E D R E A D ;
PROTECTEDWRITE:     P R O T E C T E D W R I T E ;
LOCAL:              L O C A L ;
EVENT:              E V E N T ;
OPEN:               O P E N ;
DECLARE:            D E C L A R E ;
FETCH:              F E T C H ;
DO:                 D O ;
WHILE:              W H I L E ;
GOTO:               G O T O ;
ELSE:               E L S E ;
IF:                 I F ;
THEN:               T H E N ;
ELSEIF:             E L S E I F ;
TRY:                T R Y ;
EXIT:               E X I T ;
CHOOSE:             C H O O S E ;
IS:                 I S ;
CONTINUE:           C O N T I N U E ;
FOR:                F O R ;
CLOSE:              C L O S E ;
NEXT:               N E X T ;
LOOP:               L O O P ;
UNTIL:              U N T I L ;
STEP:               S T E P ;
CATCH:              C A T C H ;
FINALLY:            F I N A L L Y ;
THROW:              T H R O W ;
RELEASE:            R E L E A S E ;
CREATE:             C R E A T E ;
DESTROY:            D E S T R O Y ;
CONNECT:            C O N N E C T ;
DISCONNECT:         D I S C O N N E C T ;
COMMIT:             C O M M I T ;
ROLLBACK:           R O L L B A C K ;
USING:              U S I N G ;
POST:               P O S T ;
TRIGGER:            T R I G G E R ;
SELECT:             S E L E C T ;
DELETE:             D E L E T E ;
INSERT:             I N S E R T ;
INTO:               I N T O ;
UPDATEBLOB:         U P D A T E B L O B ;
EXECUTE:            E X E C U T E ;
DESCRIBE:           D E S C R I B E ;
RETURN:             R E T U R N ;
OR:                 O R ;
AND:                A N D ;
NOT:                N O T ;
CALL:               C A L L ;
HALT:               H A L T ;
SUPER:              S U P E R ;
LIBRARY:            L I B R A R Y ;
SYSTEM:             S Y S T E M ;
RPCFUNC:            R P C F U N C ;
ALIAS:              A L I A S ;
THROWS:             T H R O W S ;
NONVISUALOBJECT:    N O N V I S U A L O B J E C T ;
AUTOINSTANTIATE:    A U T O I N S T A N T I A T E ;
DESCRIPTOR:         D E S C R I P T O R ;
THIS:               T H I S ;

// Operators

EQ:                 '=';
GT:                 '>';
GTE:                '>=';
LT:                 '<';
LTE:                '<=';
GTLT:               '<>';
PLUS:               '+';
PLUSPLUS:           '++';
MINUS:              '-';
PLUSEQ:             '+=';
MINUSEQ:            '-=';
COLONCOLON:         '::';
MULT:               '*';
DIV:                '/';
MULTEQ:             '*=';
DIVEQ:              '/=';
CARAT:              '^';
LCURLY:             '{';
RCURLY:             '}';
LBRACE:             '[';
RBRACE:             ']';
BRACES:             '[]';
TICK:               '`';
DQUOTED_STRING:     '"' ( ('~' '"') | ~'"' )* '"' ;
QUOTED_STRING:      '\'' (~'\'')* '\'';
SQLSTMT:            (SQLBEGIN (~';')+ SQLEND) | (ROLLBACK | COMMIT | DISCONNECT) WS* SQLEND ;
COMMA:              ',';
SEMI:               ';';
LPAREN:             '(';
RPAREN:             ')';
COLON:              ':';
DQUOTE:             '"';
TQ:                 '???';
DOUBLE_PIPE:        '||';
DOTDOTDOT:          '...';

// Literals

NUMBER:             (NUM '.' NUM | '.' NUM | NUM) ('E' ('+' | '-')? NUM)? ('D' | 'F')?;
DOT:                '.';
DATE:               DIGIT DIGIT DIGIT DIGIT '-' DIGIT DIGIT '-' DIGIT DIGIT;
TIME:               DIGIT DIGIT ':' DIGIT DIGIT ':' DIGIT DIGIT (':' DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT)?;
BINDPAR:            ':' ID_PARTS;
EXPORT_HEADER:      '$' 'PBExportHeader' '$' (LETTER | DIGIT | '.' | ' ' | '_' | ',')+ ;
EXPORT_COMMENTS:      '$' 'PBExportComments' '$' ~ [\r\n]*  ;
ENUM:               ID_PARTS '!';
ID:                 ID_PARTS;

// Hidden

LINE_CONTINUATION:  '&' WS* [\r\n] -> channel(HIDDEN);
SL_COMMENT:         '//' ~ [\r\n]* -> channel(HIDDEN);
ML_COMMENT:         '/*' .*? '*/'  -> channel(HIDDEN);
WS:                 [ \t\r\n]+     -> channel(HIDDEN);

// Fragments

fragment ID_PARTS
   : LETTER (LETTER | DIGIT | '-' | '$' | '#' | '%' | '_')*
   ;

fragment NUM
   : DIGIT+
   ;

fragment DIGIT
   : '0' .. '9'
   ;

fragment LETTER_ASCII
   : 'A' .. 'Z'
   | 'a' .. 'z'
   ;

fragment LETTER
   : [\p{L}]
   ;

fragment A : [aA]; // match either an 'a' or 'A'
fragment B : [bB];
fragment C : [cC];
fragment D : [dD];
fragment E : [eE];
fragment F : [fF];
fragment G : [gG];
fragment H : [hH];
fragment I : [iI];
fragment J : [jJ];
fragment K : [kK];
fragment L : [lL];
fragment M : [mM];
fragment N : [nN];
fragment O : [oO];
fragment P : [pP];
fragment Q : [qQ];
fragment R : [rR];
fragment S : [sS];
fragment T : [tT];
fragment U : [uU];
fragment V : [vV];
fragment W : [wW];
fragment X : [xX];
fragment Y : [yY];
fragment Z : [zZ];

fragment SQLBEGIN : (INSERT | UPDATE | UPDATEBLOB | DELETE | SELECT | DECLARE | OPEN | CLOSE | EXECUTE | FETCH | ((CONNECT | DISCONNECT | COMMIT | ROLLBACK) WS+)? USING) WS+ (LETTER | (LPAREN LETTER) | QUOTED_STRING | NUM) ;
fragment SQLEND   : ';' ;
