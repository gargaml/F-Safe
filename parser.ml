exception Error

type token = 
  | TYPEARROW
  | TYPE
  | RPAREN
  | RBRACKET
  | RBRACE
  | PIPE
  | MAJIDENT of (
# 33 "parser.mly"
       (string)
# 14 "parser.ml"
)
  | LPAREN
  | LET
  | LBRACKET
  | LBRACE
  | JOKER
  | IDENT of (
# 32 "parser.mly"
       (string)
# 24 "parser.ml"
)
  | FUN
  | EQUAL
  | EOF
  | DEF
  | COMMA
  | COLON
  | CASE
  | ARROW

and _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  mutable _menhir_token: token;
  mutable _menhir_startp: Lexing.position;
  mutable _menhir_endp: Lexing.position;
  mutable _menhir_shifted: int
}

and _menhir_state = 
  | MenhirState158
  | MenhirState156
  | MenhirState154
  | MenhirState151
  | MenhirState149
  | MenhirState146
  | MenhirState143
  | MenhirState141
  | MenhirState138
  | MenhirState135
  | MenhirState131
  | MenhirState128
  | MenhirState123
  | MenhirState119
  | MenhirState115
  | MenhirState112
  | MenhirState108
  | MenhirState106
  | MenhirState103
  | MenhirState100
  | MenhirState98
  | MenhirState94
  | MenhirState88
  | MenhirState87
  | MenhirState83
  | MenhirState80
  | MenhirState78
  | MenhirState70
  | MenhirState68
  | MenhirState66
  | MenhirState65
  | MenhirState63
  | MenhirState62
  | MenhirState60
  | MenhirState57
  | MenhirState55
  | MenhirState53
  | MenhirState51
  | MenhirState49
  | MenhirState47
  | MenhirState45
  | MenhirState41
  | MenhirState39
  | MenhirState37
  | MenhirState36
  | MenhirState34
  | MenhirState32
  | MenhirState28
  | MenhirState22
  | MenhirState20
  | MenhirState16
  | MenhirState13
  | MenhirState11
  | MenhirState9
  | MenhirState5
  | MenhirState3
  | MenhirState0


# 23 "parser.mly"
  

  open Fsafe
  open Utils


# 111 "parser.ml"
let _eRR =
  Error

let rec _menhir_goto_filters : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_filters -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState68 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv877 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 124 "parser.ml"
        )) * _menhir_state * 'tv_filters) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv875 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 132 "parser.ml"
        )) * _menhir_state * 'tv_filters) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv871 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 141 "parser.ml"
            )) * _menhir_state * 'tv_filters) = Obj.magic _menhir_stack in
            ((let _ = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv869 * _menhir_state * (
# 33 "parser.mly"
       (string)
# 148 "parser.ml"
            )) * _menhir_state * 'tv_filters) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, i), _, fs) = _menhir_stack in
            let _v : 'tv_filter_data_constructor = 
# 222 "parser.mly"
      ( PConApp (i, [], fs) )
# 154 "parser.ml"
             in
            _menhir_goto_filter_data_constructor _menhir_env _menhir_stack _menhir_s _v) : 'freshtv870)) : 'freshtv872)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv873 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 164 "parser.ml"
            )) * _menhir_state * 'tv_filters) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv874)) : 'freshtv876)) : 'freshtv878)
    | MenhirState78 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv881 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state * 'tv_filter) * _menhir_state * 'tv_filters) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv879 * _menhir_state * 'tv_filter) * _menhir_state * 'tv_filters) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, f), _, fs) = _menhir_stack in
        let _v : 'tv_filters = 
# 202 "parser.mly"
      ( f :: fs )
# 177 "parser.ml"
         in
        _menhir_goto_filters _menhir_env _menhir_stack _menhir_s _v) : 'freshtv880)) : 'freshtv882)
    | MenhirState83 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv891 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 185 "parser.ml"
        )) * _menhir_state * 'tv_annotations) * _menhir_state * 'tv_filters) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv889 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 193 "parser.ml"
        )) * _menhir_state * 'tv_annotations) * _menhir_state * 'tv_filters) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv885 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 202 "parser.ml"
            )) * _menhir_state * 'tv_annotations) * _menhir_state * 'tv_filters) = Obj.magic _menhir_stack in
            ((let _ = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv883 * _menhir_state * (
# 33 "parser.mly"
       (string)
# 209 "parser.ml"
            )) * _menhir_state * 'tv_annotations) * _menhir_state * 'tv_filters) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, i), _, ans), _, fs) = _menhir_stack in
            let _v : 'tv_filter_data_constructor = 
# 218 "parser.mly"
      ( PConApp (i, ans, fs) )
# 215 "parser.ml"
             in
            _menhir_goto_filter_data_constructor _menhir_env _menhir_stack _menhir_s _v) : 'freshtv884)) : 'freshtv886)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv887 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 225 "parser.ml"
            )) * _menhir_state * 'tv_annotations) * _menhir_state * 'tv_filters) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv888)) : 'freshtv890)) : 'freshtv892)
    | MenhirState66 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv901 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state * 'tv_filters) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv899 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state * 'tv_filters) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | ARROW ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv895 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state * 'tv_filters) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv893 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state * 'tv_filters) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | CASE ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState87
            | FUN ->
                _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState87
            | IDENT _v ->
                _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState87 _v
            | LET ->
                _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState87
            | MAJIDENT _v ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState87 _v
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState87) : 'freshtv894)) : 'freshtv896)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv897 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state * 'tv_filters) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv898)) : 'freshtv900)) : 'freshtv902)
    | _ ->
        _menhir_fail ()

and _menhir_goto_filter : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_filter -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv867 * _menhir_state * 'tv_filter) = Obj.magic _menhir_stack in
    ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv865 * _menhir_state * 'tv_filter) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | COMMA ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv859 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state * 'tv_filter) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv857 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state * 'tv_filter) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | IDENT _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState78 _v
        | JOKER ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | MAJIDENT _v ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState78 _v
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState78) : 'freshtv858)) : 'freshtv860)
    | ARROW | RPAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv861 * _menhir_state * 'tv_filter) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, f) = _menhir_stack in
        let _v : 'tv_filters = 
# 200 "parser.mly"
      ( [ f ] )
# 306 "parser.ml"
         in
        _menhir_goto_filters _menhir_env _menhir_stack _menhir_s _v) : 'freshtv862)
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv863 * _menhir_state * 'tv_filter) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv864)) : 'freshtv866)) : 'freshtv868)

and _menhir_goto_filter_data_constructor : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_filter_data_constructor -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv855) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_filter_data_constructor) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv853) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (fdc : 'tv_filter_data_constructor) = _v in
    ((let _v : 'tv_filter = 
# 208 "parser.mly"
      ( fdc )
# 330 "parser.ml"
     in
    _menhir_goto_filter _menhir_env _menhir_stack _menhir_s _v) : 'freshtv854)) : 'freshtv856)

and _menhir_run67 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 33 "parser.mly"
       (string)
# 337 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv851 * _menhir_state * (
# 33 "parser.mly"
       (string)
# 346 "parser.ml"
    )) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | LBRACKET ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv841 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 355 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv839 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 362 "parser.ml"
        )) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | IDENT _v ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState80 _v
        | MAJIDENT _v ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState80 _v
        | RBRACKET ->
            _menhir_reduce5 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState80) : 'freshtv840)) : 'freshtv842)
    | LPAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv845 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 381 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv843 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 388 "parser.ml"
        )) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | IDENT _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v
        | JOKER ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | MAJIDENT _v ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState68) : 'freshtv844)) : 'freshtv846)
    | ARROW | COMMA | RPAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv847 * _menhir_state * (
# 33 "parser.mly"
       (string)
# 407 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, i) = _menhir_stack in
        let _v : 'tv_filter_data_constructor = 
# 224 "parser.mly"
      ( PConApp (i, [], []) )
# 413 "parser.ml"
         in
        _menhir_goto_filter_data_constructor _menhir_env _menhir_stack _menhir_s _v) : 'freshtv848)
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv849 * _menhir_state * (
# 33 "parser.mly"
       (string)
# 423 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv850)) : 'freshtv852)

and _menhir_run69 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv837 * _menhir_state) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | COLON ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv833 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv831 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | IDENT _v ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
        | MAJIDENT _v ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState70) : 'freshtv832)) : 'freshtv834)
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv835 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv836)) : 'freshtv838)

and _menhir_goto_global_definition : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_global_definition -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv829 * _menhir_state * 'tv_global_definition) = Obj.magic _menhir_stack in
    ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv827 * _menhir_state * 'tv_global_definition) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | DEF ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState156
    | CASE | EOF | FUN | IDENT _ | LET | MAJIDENT _ ->
        _menhir_reduce44 _menhir_env (Obj.magic _menhir_stack) MenhirState156
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState156) : 'freshtv828)) : 'freshtv830)

and _menhir_goto_assignments : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_assignments -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState119 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv809 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_typed_variable) * _menhir_state * 'tv_expression) * _menhir_state * 'tv_assignments) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv807 * _menhir_state * 'tv_typed_variable) * _menhir_state * 'tv_expression) * _menhir_state * 'tv_assignments) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, tv), _, e), _, ass) = _menhir_stack in
        let _v : 'tv_assignments = 
# 107 "parser.mly"
      ( (tv, e) :: ass )
# 493 "parser.ml"
         in
        _menhir_goto_assignments _menhir_env _menhir_stack _menhir_s _v) : 'freshtv808)) : 'freshtv810)
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv825 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_assignments) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv823 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_assignments) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv819 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_assignments) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv817 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_assignments) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | LBRACE ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv813 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_assignments) = Obj.magic _menhir_stack in
                ((let _tok = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv811 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_assignments) = _menhir_stack in
                let (_tok : token) = _tok in
                ((match _tok with
                | CASE ->
                    _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState123
                | FUN ->
                    _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState123
                | IDENT _v ->
                    _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _v
                | LET ->
                    _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState123
                | MAJIDENT _v ->
                    _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _v
                | _ ->
                    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                    _menhir_env._menhir_shifted <- (-1);
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState123) : 'freshtv812)) : 'freshtv814)
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv815 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_assignments) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv816)) : 'freshtv818)) : 'freshtv820)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv821 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_assignments) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv822)) : 'freshtv824)) : 'freshtv826)
    | _ ->
        _menhir_fail ()

and _menhir_goto_expressions : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_expressions -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState63 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv757 * _menhir_state) * _menhir_state * 'tv_expressions) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv755 * _menhir_state) * _menhir_state * 'tv_expressions) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | LBRACE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv751 * _menhir_state) * _menhir_state * 'tv_expressions) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv749 * _menhir_state) * _menhir_state * 'tv_expressions) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | PIPE ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState65
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState65) : 'freshtv750)) : 'freshtv752)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv753 * _menhir_state) * _menhir_state * 'tv_expressions) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv754)) : 'freshtv756)) : 'freshtv758)
    | MenhirState94 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv761 * _menhir_state * 'tv_expression) * _menhir_state * 'tv_expressions) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv759 * _menhir_state * 'tv_expression) * _menhir_state * 'tv_expressions) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, e), _, es) = _menhir_stack in
        let _v : 'tv_expressions = 
# 157 "parser.mly"
      ( e :: es )
# 595 "parser.ml"
         in
        _menhir_goto_expressions _menhir_env _menhir_stack _menhir_s _v) : 'freshtv760)) : 'freshtv762)
    | MenhirState55 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv771 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 603 "parser.ml"
        )) * _menhir_state * 'tv_expressions) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv769 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 611 "parser.ml"
        )) * _menhir_state * 'tv_expressions) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv765 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 620 "parser.ml"
            )) * _menhir_state * 'tv_expressions) = Obj.magic _menhir_stack in
            ((let _ = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv763 * _menhir_state * (
# 32 "parser.mly"
       (string)
# 627 "parser.ml"
            )) * _menhir_state * 'tv_expressions) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, i), _, es) = _menhir_stack in
            let _v : 'tv_expression = 
# 171 "parser.mly"
      ( { e = EApp (i, [], es); t = Undefined } )
# 633 "parser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v) : 'freshtv764)) : 'freshtv766)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv767 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 643 "parser.ml"
            )) * _menhir_state * 'tv_expressions) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv768)) : 'freshtv770)) : 'freshtv772)
    | MenhirState115 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv781 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 652 "parser.ml"
        )) * _menhir_state * 'tv_annotations) * _menhir_state * 'tv_expressions) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv779 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 660 "parser.ml"
        )) * _menhir_state * 'tv_annotations) * _menhir_state * 'tv_expressions) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv775 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 669 "parser.ml"
            )) * _menhir_state * 'tv_annotations) * _menhir_state * 'tv_expressions) = Obj.magic _menhir_stack in
            ((let _ = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv773 * _menhir_state * (
# 32 "parser.mly"
       (string)
# 676 "parser.ml"
            )) * _menhir_state * 'tv_annotations) * _menhir_state * 'tv_expressions) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, i), _, ans), _, es) = _menhir_stack in
            let _v : 'tv_expression = 
# 173 "parser.mly"
      ( { e = EApp (i, ans, es); t = Undefined } )
# 682 "parser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v) : 'freshtv774)) : 'freshtv776)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv777 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 692 "parser.ml"
            )) * _menhir_state * 'tv_annotations) * _menhir_state * 'tv_expressions) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv778)) : 'freshtv780)) : 'freshtv782)
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv791 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 701 "parser.ml"
        )) * _menhir_state * 'tv_expressions) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv789 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 709 "parser.ml"
        )) * _menhir_state * 'tv_expressions) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv785 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 718 "parser.ml"
            )) * _menhir_state * 'tv_expressions) = Obj.magic _menhir_stack in
            ((let _ = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv783 * _menhir_state * (
# 33 "parser.mly"
       (string)
# 725 "parser.ml"
            )) * _menhir_state * 'tv_expressions) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, i), _, tes) = _menhir_stack in
            let _v : 'tv_dconstructor_application = 
# 188 "parser.mly"
      ( EConApp (i, [], tes) )
# 731 "parser.ml"
             in
            _menhir_goto_dconstructor_application _menhir_env _menhir_stack _menhir_s _v) : 'freshtv784)) : 'freshtv786)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv787 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 741 "parser.ml"
            )) * _menhir_state * 'tv_expressions) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv788)) : 'freshtv790)) : 'freshtv792)
    | MenhirState131 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv801 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 750 "parser.ml"
        )) * _menhir_state * 'tv_annotations) * _menhir_state * 'tv_expressions) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv799 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 758 "parser.ml"
        )) * _menhir_state * 'tv_annotations) * _menhir_state * 'tv_expressions) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv795 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 767 "parser.ml"
            )) * _menhir_state * 'tv_annotations) * _menhir_state * 'tv_expressions) = Obj.magic _menhir_stack in
            ((let _ = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv793 * _menhir_state * (
# 33 "parser.mly"
       (string)
# 774 "parser.ml"
            )) * _menhir_state * 'tv_annotations) * _menhir_state * 'tv_expressions) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, i), _, ans), _, tes) = _menhir_stack in
            let _v : 'tv_dconstructor_application = 
# 184 "parser.mly"
      ( EConApp (i, ans, tes) )
# 780 "parser.ml"
             in
            _menhir_goto_dconstructor_application _menhir_env _menhir_stack _menhir_s _v) : 'freshtv794)) : 'freshtv796)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv797 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 790 "parser.ml"
            )) * _menhir_state * 'tv_annotations) * _menhir_state * 'tv_expressions) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv798)) : 'freshtv800)) : 'freshtv802)
    | MenhirState154 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv805 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * 'tv_expression) * _menhir_state * 'tv_expressions) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv803 * _menhir_state * 'tv_expression) * _menhir_state * 'tv_expressions) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, e), _, es) = _menhir_stack in
        let _v : 'tv_program = 
# 53 "parser.mly"
      ( e :: es )
# 803 "parser.ml"
         in
        _menhir_goto_program _menhir_env _menhir_stack _menhir_s _v) : 'freshtv804)) : 'freshtv806)
    | _ ->
        _menhir_fail ()

and _menhir_goto_patterns : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_patterns -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState88 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv737 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state * 'tv_filters) * _menhir_state * 'tv_expression) * _menhir_state * 'tv_patterns) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv735 * _menhir_state) * _menhir_state * 'tv_filters) * _menhir_state * 'tv_expression) * _menhir_state * 'tv_patterns) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), _, fs), _, e), _, ps) = _menhir_stack in
        let _v : 'tv_patterns = 
# 196 "parser.mly"
      ( Pattern (fs, e) :: ps )
# 822 "parser.ml"
         in
        _menhir_goto_patterns _menhir_env _menhir_stack _menhir_s _v) : 'freshtv736)) : 'freshtv738)
    | MenhirState65 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv747 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state * 'tv_patterns) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv745 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state * 'tv_patterns) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | RBRACE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv741 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state * 'tv_patterns) = Obj.magic _menhir_stack in
            ((let _ = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv739 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state * 'tv_patterns) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, tes), _, ps) = _menhir_stack in
            let _v : 'tv_expression = 
# 169 "parser.mly"
      ( { e = ECase (tes, ps); t = Undefined } )
# 844 "parser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v) : 'freshtv740)) : 'freshtv742)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv743 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state * 'tv_patterns) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv744)) : 'freshtv746)) : 'freshtv748)
    | _ ->
        _menhir_fail ()

and _menhir_run66 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv733 * _menhir_state) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | IDENT _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
    | JOKER ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState66
    | MAJIDENT _v ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState66) : 'freshtv734)

and _menhir_goto_typed_parameters : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typed_parameters -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState39 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv679 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 885 "parser.ml"
        )) * _menhir_state * 'tv_typed_parameters) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv677 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 893 "parser.ml"
        )) * _menhir_state * 'tv_typed_parameters) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv673 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 902 "parser.ml"
            )) * _menhir_state * 'tv_typed_parameters) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv671 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 909 "parser.ml"
            )) * _menhir_state * 'tv_typed_parameters) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | COLON ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv667 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 918 "parser.ml"
                )) * _menhir_state * 'tv_typed_parameters) = Obj.magic _menhir_stack in
                ((let _tok = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv665 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 925 "parser.ml"
                )) * _menhir_state * 'tv_typed_parameters) = _menhir_stack in
                let (_tok : token) = _tok in
                ((match _tok with
                | IDENT _v ->
                    _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
                | MAJIDENT _v ->
                    _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
                | _ ->
                    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                    _menhir_env._menhir_shifted <- (-1);
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState45) : 'freshtv666)) : 'freshtv668)
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv669 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 944 "parser.ml"
                )) * _menhir_state * 'tv_typed_parameters) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv670)) : 'freshtv672)) : 'freshtv674)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv675 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 955 "parser.ml"
            )) * _menhir_state * 'tv_typed_parameters) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv676)) : 'freshtv678)) : 'freshtv680)
    | MenhirState57 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv695 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_typed_parameters) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv693 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_typed_parameters) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv689 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_typed_parameters) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv687 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_typed_parameters) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | COLON ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv683 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_typed_parameters) = Obj.magic _menhir_stack in
                ((let _tok = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv681 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_typed_parameters) = _menhir_stack in
                let (_tok : token) = _tok in
                ((match _tok with
                | IDENT _v ->
                    _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
                | MAJIDENT _v ->
                    _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
                | _ ->
                    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                    _menhir_env._menhir_shifted <- (-1);
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState60) : 'freshtv682)) : 'freshtv684)
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv685 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_typed_parameters) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv686)) : 'freshtv688)) : 'freshtv690)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv691 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_typed_parameters) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv692)) : 'freshtv694)) : 'freshtv696)
    | MenhirState98 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv699) * _menhir_state * 'tv_typed_parameter) * _menhir_state * 'tv_typed_parameters) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv697 * _menhir_state * 'tv_typed_parameter) * _menhir_state * 'tv_typed_parameters) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, ap), _, aps) = _menhir_stack in
        let _v : 'tv_typed_parameters = 
# 99 "parser.mly"
      ( ap :: aps )
# 1015 "parser.ml"
         in
        _menhir_goto_typed_parameters _menhir_env _menhir_stack _menhir_s _v) : 'freshtv698)) : 'freshtv700)
    | MenhirState103 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv715 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_type_variables) * _menhir_state * 'tv_typed_parameters) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv713 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_type_variables) * _menhir_state * 'tv_typed_parameters) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv709 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_type_variables) * _menhir_state * 'tv_typed_parameters) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv707 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_type_variables) * _menhir_state * 'tv_typed_parameters) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | COLON ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((('freshtv703 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_type_variables) * _menhir_state * 'tv_typed_parameters) = Obj.magic _menhir_stack in
                ((let _tok = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((('freshtv701 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_type_variables) * _menhir_state * 'tv_typed_parameters) = _menhir_stack in
                let (_tok : token) = _tok in
                ((match _tok with
                | IDENT _v ->
                    _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState106 _v
                | MAJIDENT _v ->
                    _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState106 _v
                | _ ->
                    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                    _menhir_env._menhir_shifted <- (-1);
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState106) : 'freshtv702)) : 'freshtv704)
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((('freshtv705 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_type_variables) * _menhir_state * 'tv_typed_parameters) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv706)) : 'freshtv708)) : 'freshtv710)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv711 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_type_variables) * _menhir_state * 'tv_typed_parameters) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv712)) : 'freshtv714)) : 'freshtv716)
    | MenhirState138 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv731 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 1070 "parser.ml"
        )) * _menhir_state * 'tv_type_variables) * _menhir_state * 'tv_typed_parameters) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv729 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 1078 "parser.ml"
        )) * _menhir_state * 'tv_type_variables) * _menhir_state * 'tv_typed_parameters) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv725 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 1087 "parser.ml"
            )) * _menhir_state * 'tv_type_variables) * _menhir_state * 'tv_typed_parameters) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv723 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 1094 "parser.ml"
            )) * _menhir_state * 'tv_type_variables) * _menhir_state * 'tv_typed_parameters) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | COLON ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((('freshtv719 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 1103 "parser.ml"
                )) * _menhir_state * 'tv_type_variables) * _menhir_state * 'tv_typed_parameters) = Obj.magic _menhir_stack in
                ((let _tok = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((('freshtv717 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 1110 "parser.ml"
                )) * _menhir_state * 'tv_type_variables) * _menhir_state * 'tv_typed_parameters) = _menhir_stack in
                let (_tok : token) = _tok in
                ((match _tok with
                | IDENT _v ->
                    _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState141 _v
                | MAJIDENT _v ->
                    _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState141 _v
                | _ ->
                    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                    _menhir_env._menhir_shifted <- (-1);
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState141) : 'freshtv718)) : 'freshtv720)
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((('freshtv721 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 1129 "parser.ml"
                )) * _menhir_state * 'tv_type_variables) * _menhir_state * 'tv_typed_parameters) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv722)) : 'freshtv724)) : 'freshtv726)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv727 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 1140 "parser.ml"
            )) * _menhir_state * 'tv_type_variables) * _menhir_state * 'tv_typed_parameters) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv728)) : 'freshtv730)) : 'freshtv732)
    | _ ->
        _menhir_fail ()

and _menhir_goto_filter_variable : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_filter_variable -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv663) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_filter_variable) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv661) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (fv : 'tv_filter_variable) = _v in
    ((let _v : 'tv_filter = 
# 206 "parser.mly"
      ( fv )
# 1160 "parser.ml"
     in
    _menhir_goto_filter _menhir_env _menhir_stack _menhir_s _v) : 'freshtv662)) : 'freshtv664)

and _menhir_goto_typed_variables : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typed_variables -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv645 * _menhir_state) * (
# 32 "parser.mly"
       (string)
# 1173 "parser.ml"
        )) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 1177 "parser.ml"
        )) * _menhir_state * 'tv_typed_variables) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv643 * _menhir_state) * (
# 32 "parser.mly"
       (string)
# 1185 "parser.ml"
        )) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 1189 "parser.ml"
        )) * _menhir_state * 'tv_typed_variables) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv639 * _menhir_state) * (
# 32 "parser.mly"
       (string)
# 1198 "parser.ml"
            )) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 1202 "parser.ml"
            )) * _menhir_state * 'tv_typed_variables) = Obj.magic _menhir_stack in
            ((let _ = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv637 * _menhir_state * (
# 33 "parser.mly"
       (string)
# 1209 "parser.ml"
            )) * _menhir_state * 'tv_typed_variables) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, i), _, tvs) = _menhir_stack in
            let _v : 'tv_data_constructor = 
# 131 "parser.mly"
      ( TConApp (i, tvs) )
# 1215 "parser.ml"
             in
            _menhir_goto_data_constructor _menhir_env _menhir_stack _menhir_s _v) : 'freshtv638)) : 'freshtv640)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv641 * _menhir_state) * (
# 32 "parser.mly"
       (string)
# 1225 "parser.ml"
            )) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 1229 "parser.ml"
            )) * _menhir_state * 'tv_typed_variables) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv642)) : 'freshtv644)) : 'freshtv646)
    | MenhirState28 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv649 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * 'tv_typed_variable) * _menhir_state * 'tv_typed_variables) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv647 * _menhir_state * 'tv_typed_variable) * _menhir_state * 'tv_typed_variables) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, av), _, avs) = _menhir_stack in
        let _v : 'tv_typed_variables = 
# 93 "parser.mly"
      ( av :: avs )
# 1242 "parser.ml"
         in
        _menhir_goto_typed_variables _menhir_env _menhir_stack _menhir_s _v) : 'freshtv648)) : 'freshtv650)
    | MenhirState37 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv659 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * 'tv_typed_variables) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv657 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * 'tv_typed_variables) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | EQUAL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv653 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * 'tv_typed_variables) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv651 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * 'tv_typed_variables) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | CASE ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | FUN ->
                _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | IDENT _v ->
                _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState146 _v
            | LET ->
                _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | MAJIDENT _v ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState146 _v
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState146) : 'freshtv652)) : 'freshtv654)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv655 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * 'tv_typed_variables) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv656)) : 'freshtv658)) : 'freshtv660)
    | _ ->
        _menhir_fail ()

and _menhir_run28 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_typed_variable -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv635 * _menhir_state * 'tv_typed_variable) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | IDENT _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState28 _v
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState28) : 'freshtv636)

and _menhir_run20 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_annotation -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv633 * _menhir_state * 'tv_annotation) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | IDENT _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
    | MAJIDENT _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState20) : 'freshtv634)

and _menhir_goto_annotations : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_annotations -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv575 * _menhir_state * (
# 32 "parser.mly"
       (string)
# 1325 "parser.ml"
        )) * _menhir_state * 'tv_annotations) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv573 * _menhir_state * (
# 32 "parser.mly"
       (string)
# 1333 "parser.ml"
        )) * _menhir_state * 'tv_annotations) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | RBRACKET ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv569 * _menhir_state * (
# 32 "parser.mly"
       (string)
# 1342 "parser.ml"
            )) * _menhir_state * 'tv_annotations) = Obj.magic _menhir_stack in
            ((let _ = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv567 * _menhir_state * (
# 32 "parser.mly"
       (string)
# 1349 "parser.ml"
            )) * _menhir_state * 'tv_annotations) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, i), _, ans) = _menhir_stack in
            let _v : 'tv_annotation = 
# 61 "parser.mly"
      ( AConApp (i, ans) )
# 1355 "parser.ml"
             in
            _menhir_goto_annotation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv568)) : 'freshtv570)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv571 * _menhir_state * (
# 32 "parser.mly"
       (string)
# 1365 "parser.ml"
            )) * _menhir_state * 'tv_annotations) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv572)) : 'freshtv574)) : 'freshtv576)
    | MenhirState22 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv579) * _menhir_state * 'tv_annotation) * _menhir_state * 'tv_annotations) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv577 * _menhir_state * 'tv_annotation) * _menhir_state * 'tv_annotations) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, a), _, ans) = _menhir_stack in
        let _v : 'tv_annotations = 
# 71 "parser.mly"
      ( a :: ans )
# 1378 "parser.ml"
         in
        _menhir_goto_annotations _menhir_env _menhir_stack _menhir_s _v) : 'freshtv578)) : 'freshtv580)
    | MenhirState80 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv597 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 1386 "parser.ml"
        )) * _menhir_state * 'tv_annotations) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv595 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 1394 "parser.ml"
        )) * _menhir_state * 'tv_annotations) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | RBRACKET ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv591 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 1403 "parser.ml"
            )) * _menhir_state * 'tv_annotations) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv589 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 1410 "parser.ml"
            )) * _menhir_state * 'tv_annotations) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | LPAREN ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((('freshtv583 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 1419 "parser.ml"
                )) * _menhir_state * 'tv_annotations) = Obj.magic _menhir_stack in
                ((let _tok = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((('freshtv581 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 1426 "parser.ml"
                )) * _menhir_state * 'tv_annotations) = _menhir_stack in
                let (_tok : token) = _tok in
                ((match _tok with
                | IDENT _v ->
                    _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState83 _v
                | JOKER ->
                    _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState83
                | MAJIDENT _v ->
                    _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState83 _v
                | _ ->
                    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                    _menhir_env._menhir_shifted <- (-1);
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState83) : 'freshtv582)) : 'freshtv584)
            | ARROW | COMMA | RPAREN ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv585 * _menhir_state * (
# 33 "parser.mly"
       (string)
# 1445 "parser.ml"
                )) * _menhir_state * 'tv_annotations) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, i), _, ans) = _menhir_stack in
                let _v : 'tv_filter_data_constructor = 
# 220 "parser.mly"
      ( PConApp (i, ans, []) )
# 1451 "parser.ml"
                 in
                _menhir_goto_filter_data_constructor _menhir_env _menhir_stack _menhir_s _v) : 'freshtv586)
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((('freshtv587 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 1461 "parser.ml"
                )) * _menhir_state * 'tv_annotations) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv588)) : 'freshtv590)) : 'freshtv592)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv593 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 1472 "parser.ml"
            )) * _menhir_state * 'tv_annotations) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv594)) : 'freshtv596)) : 'freshtv598)
    | MenhirState112 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv613 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 1481 "parser.ml"
        )) * _menhir_state * 'tv_annotations) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv611 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 1489 "parser.ml"
        )) * _menhir_state * 'tv_annotations) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | RBRACKET ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv607 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 1498 "parser.ml"
            )) * _menhir_state * 'tv_annotations) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv605 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 1505 "parser.ml"
            )) * _menhir_state * 'tv_annotations) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | LPAREN ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv601 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 1514 "parser.ml"
                )) * _menhir_state * 'tv_annotations) = Obj.magic _menhir_stack in
                ((let _tok = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv599 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 1521 "parser.ml"
                )) * _menhir_state * 'tv_annotations) = _menhir_stack in
                let (_tok : token) = _tok in
                ((match _tok with
                | CASE ->
                    _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState115
                | FUN ->
                    _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState115
                | IDENT _v ->
                    _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _v
                | LET ->
                    _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState115
                | MAJIDENT _v ->
                    _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _v
                | _ ->
                    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                    _menhir_env._menhir_shifted <- (-1);
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState115) : 'freshtv600)) : 'freshtv602)
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv603 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 1546 "parser.ml"
                )) * _menhir_state * 'tv_annotations) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv604)) : 'freshtv606)) : 'freshtv608)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv609 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 1557 "parser.ml"
            )) * _menhir_state * 'tv_annotations) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv610)) : 'freshtv612)) : 'freshtv614)
    | MenhirState128 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv631 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 1566 "parser.ml"
        )) * _menhir_state * 'tv_annotations) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv629 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 1574 "parser.ml"
        )) * _menhir_state * 'tv_annotations) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | RBRACKET ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv625 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 1583 "parser.ml"
            )) * _menhir_state * 'tv_annotations) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv623 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 1590 "parser.ml"
            )) * _menhir_state * 'tv_annotations) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | LPAREN ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv617 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 1599 "parser.ml"
                )) * _menhir_state * 'tv_annotations) = Obj.magic _menhir_stack in
                ((let _tok = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv615 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 1606 "parser.ml"
                )) * _menhir_state * 'tv_annotations) = _menhir_stack in
                let (_tok : token) = _tok in
                ((match _tok with
                | CASE ->
                    _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState131
                | FUN ->
                    _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState131
                | IDENT _v ->
                    _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState131 _v
                | LET ->
                    _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState131
                | MAJIDENT _v ->
                    _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState131 _v
                | _ ->
                    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                    _menhir_env._menhir_shifted <- (-1);
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState131) : 'freshtv616)) : 'freshtv618)
            | CASE | COMMA | DEF | EOF | FUN | IDENT _ | LBRACE | LET | MAJIDENT _ | PIPE | RBRACE | RPAREN ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv619 * _menhir_state * (
# 33 "parser.mly"
       (string)
# 1629 "parser.ml"
                )) * _menhir_state * 'tv_annotations) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, i), _, ans) = _menhir_stack in
                let _v : 'tv_dconstructor_application = 
# 186 "parser.mly"
      ( EConApp (i, ans, []) )
# 1635 "parser.ml"
                 in
                _menhir_goto_dconstructor_application _menhir_env _menhir_stack _menhir_s _v) : 'freshtv620)
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv621 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 1645 "parser.ml"
                )) * _menhir_state * 'tv_annotations) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv622)) : 'freshtv624)) : 'freshtv626)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv627 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 1656 "parser.ml"
            )) * _menhir_state * 'tv_annotations) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv628)) : 'freshtv630)) : 'freshtv632)
    | _ ->
        _menhir_fail ()

and _menhir_goto_dconstructor_application : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_dconstructor_application -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv565) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_dconstructor_application) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv563) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (tca : 'tv_dconstructor_application) = _v in
    ((let _v : 'tv_expression = 
# 165 "parser.mly"
      ( { e = tca; t = Undefined } )
# 1676 "parser.ml"
     in
    _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v) : 'freshtv564)) : 'freshtv566)

and _menhir_reduce8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_assignments = 
# 103 "parser.mly"
      ( [] )
# 1685 "parser.ml"
     in
    _menhir_goto_assignments _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_expression : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_expression -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState87 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv499 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state * 'tv_filters) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv497 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state * 'tv_filters) * _menhir_state * 'tv_expression) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | PIPE ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | RBRACE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv495 * _menhir_state) * _menhir_state * 'tv_filters) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, fs), _, e) = _menhir_stack in
            let _v : 'tv_patterns = 
# 194 "parser.mly"
      ( [ Pattern (fs, e) ] )
# 1711 "parser.ml"
             in
            _menhir_goto_patterns _menhir_env _menhir_stack _menhir_s _v) : 'freshtv496)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState88) : 'freshtv498)) : 'freshtv500)
    | MenhirState154 | MenhirState131 | MenhirState49 | MenhirState115 | MenhirState55 | MenhirState94 | MenhirState63 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv511 * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv509 * _menhir_state * 'tv_expression) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | COMMA ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv503 * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv501 * _menhir_state * 'tv_expression) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | CASE ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState94
            | FUN ->
                _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState94
            | IDENT _v ->
                _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState94 _v
            | LET ->
                _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState94
            | MAJIDENT _v ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState94 _v
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState94) : 'freshtv502)) : 'freshtv504)
        | EOF | LBRACE | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv505 * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, e) = _menhir_stack in
            let _v : 'tv_expressions = 
# 155 "parser.mly"
      ( [e] )
# 1756 "parser.ml"
             in
            _menhir_goto_expressions _menhir_env _menhir_stack _menhir_s _v) : 'freshtv506)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv507 * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv508)) : 'freshtv510)) : 'freshtv512)
    | MenhirState62 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv515 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_typed_parameters) * _menhir_state * 'tv_annotation) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv513 * _menhir_state) * _menhir_state * 'tv_typed_parameters) * _menhir_state * 'tv_annotation) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), _, aps), _, a), _, e) = _menhir_stack in
        let _v : 'tv_expression = 
# 180 "parser.mly"
      ( { e = EAbs ([], aps, e); t = Undefined } )
# 1775 "parser.ml"
         in
        _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v) : 'freshtv514)) : 'freshtv516)
    | MenhirState108 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv519 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_type_variables) * _menhir_state * 'tv_typed_parameters) * _menhir_state * 'tv_annotation) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv517 * _menhir_state) * _menhir_state * 'tv_type_variables) * _menhir_state * 'tv_typed_parameters) * _menhir_state * 'tv_annotation) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
        ((let (((((_menhir_stack, _menhir_s), _, tvs), _, aps), _, a), _, e) = _menhir_stack in
        let _v : 'tv_expression = 
# 177 "parser.mly"
      ( { e = EAbs (tvs, aps, e); t = Undefined } )
# 1787 "parser.ml"
         in
        _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v) : 'freshtv518)) : 'freshtv520)
    | MenhirState53 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv531 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_typed_variable) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv529 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_typed_variable) * _menhir_state * 'tv_expression) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | COMMA ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv523 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_typed_variable) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv521 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_typed_variable) * _menhir_state * 'tv_expression) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | IDENT _v ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState119 _v
            | RPAREN ->
                _menhir_reduce8 _menhir_env (Obj.magic _menhir_stack) MenhirState119
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState119) : 'freshtv522)) : 'freshtv524)
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv525 * _menhir_state * 'tv_typed_variable) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, tv), _, e) = _menhir_stack in
            let _v : 'tv_assignments = 
# 105 "parser.mly"
      ( [ (tv, e) ] )
# 1822 "parser.ml"
             in
            _menhir_goto_assignments _menhir_env _menhir_stack _menhir_s _v) : 'freshtv526)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv527 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_typed_variable) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv528)) : 'freshtv530)) : 'freshtv532)
    | MenhirState123 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv541 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_assignments) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv539 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_assignments) * _menhir_state * 'tv_expression) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | RBRACE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv535 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_assignments) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let _ = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv533 * _menhir_state) * _menhir_state * 'tv_assignments) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, ass), _, e) = _menhir_stack in
            let _v : 'tv_expression = 
# 167 "parser.mly"
      ( { e = ELet (ass, e); t = Undefined } )
# 1851 "parser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v) : 'freshtv534)) : 'freshtv536)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv537 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_assignments) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv538)) : 'freshtv540)) : 'freshtv542)
    | MenhirState47 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv545 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 1866 "parser.ml"
        )) * _menhir_state * 'tv_typed_parameters) * _menhir_state * 'tv_annotation) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv543 * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 1872 "parser.ml"
        )) * _menhir_state * 'tv_typed_parameters) * _menhir_state * 'tv_annotation) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
        ((let (((((_menhir_stack, _menhir_s), _, i), _, tps), _, a), _, e) = _menhir_stack in
        let _v : 'tv_global_definition = 
# 144 "parser.mly"
      ( GDef ((i, a), { e = EAbs ([], tps, e); t = Undefined }) )
# 1878 "parser.ml"
         in
        _menhir_goto_global_definition _menhir_env _menhir_stack _menhir_s _v) : 'freshtv544)) : 'freshtv546)
    | MenhirState143 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv549 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 1886 "parser.ml"
        )) * _menhir_state * 'tv_type_variables) * _menhir_state * 'tv_typed_parameters) * _menhir_state * 'tv_annotation) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv547 * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 1892 "parser.ml"
        )) * _menhir_state * 'tv_type_variables) * _menhir_state * 'tv_typed_parameters) * _menhir_state * 'tv_annotation) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
        ((let ((((((_menhir_stack, _menhir_s), _, i), _, tvs), _, tps), _, a), _, e) = _menhir_stack in
        let _v : 'tv_global_definition = 
# 147 "parser.mly"
      ( GDef ((i, a), { e = (EAbs (tvs, tps, e)); t = Undefined }) )
# 1898 "parser.ml"
         in
        _menhir_goto_global_definition _menhir_env _menhir_stack _menhir_s _v) : 'freshtv548)) : 'freshtv550)
    | MenhirState146 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv553 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * 'tv_typed_variables) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv551 * _menhir_state) * _menhir_state * 'tv_typed_variables) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _, is), _, e) = _menhir_stack in
        let _v : 'tv_global_definition = 
# 149 "parser.mly"
      ( GRecDef (is, e) )
# 1910 "parser.ml"
         in
        _menhir_goto_global_definition _menhir_env _menhir_stack _menhir_s _v) : 'freshtv552)) : 'freshtv554)
    | MenhirState149 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv557 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * 'tv_typed_variable) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv555 * _menhir_state) * _menhir_state * 'tv_typed_variable) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _, tv), _, e) = _menhir_stack in
        let _v : 'tv_global_definition = 
# 141 "parser.mly"
      ( GDef (tv, e) )
# 1922 "parser.ml"
         in
        _menhir_goto_global_definition _menhir_env _menhir_stack _menhir_s _v) : 'freshtv556)) : 'freshtv558)
    | MenhirState151 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv561 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv559 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * 'tv_expression) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | CASE ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState154
        | FUN ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState154
        | IDENT _v ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState154 _v
        | LET ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState154
        | MAJIDENT _v ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState154 _v
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState154) : 'freshtv560)) : 'freshtv562)
    | _ ->
        _menhir_fail ()

and _menhir_goto_annotation : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_annotation -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState128 | MenhirState112 | MenhirState80 | MenhirState22 | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv373 * _menhir_state * 'tv_annotation) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv371 * _menhir_state * 'tv_annotation) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | COMMA ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv365) * _menhir_state * 'tv_annotation) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv363) * _menhir_state * 'tv_annotation) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | IDENT _v ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
            | MAJIDENT _v ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
            | RBRACKET ->
                _menhir_reduce5 _menhir_env (Obj.magic _menhir_stack) MenhirState22
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState22) : 'freshtv364)) : 'freshtv366)
        | TYPEARROW ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | RBRACKET ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv367 * _menhir_state * 'tv_annotation) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, a) = _menhir_stack in
            let _v : 'tv_annotations = 
# 69 "parser.mly"
      ( [ a ] )
# 1991 "parser.ml"
             in
            _menhir_goto_annotations _menhir_env _menhir_stack _menhir_s _v) : 'freshtv368)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv369 * _menhir_state * 'tv_annotation) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv370)) : 'freshtv372)) : 'freshtv374)
    | MenhirState20 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv381 * _menhir_state * 'tv_annotation) * _menhir_state * 'tv_annotation) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv379 * _menhir_state * 'tv_annotation) * _menhir_state * 'tv_annotation) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | TYPEARROW ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | ARROW | COMMA | EQUAL | RBRACKET | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv375 * _menhir_state * 'tv_annotation) * _menhir_state * 'tv_annotation) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, a1), _, a2) = _menhir_stack in
            let _v : 'tv_annotation = 
# 63 "parser.mly"
      ( AArrow (a1, a2) )
# 2019 "parser.ml"
             in
            _menhir_goto_annotation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv376)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv377 * _menhir_state * 'tv_annotation) * _menhir_state * 'tv_annotation) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv378)) : 'freshtv380)) : 'freshtv382)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv423 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 2034 "parser.ml"
        )) * _menhir_state * 'tv_annotation) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv421 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 2042 "parser.ml"
        )) * _menhir_state * 'tv_annotation) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | TYPEARROW ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | ARROW | COMMA | EQUAL | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv417 * _menhir_state * (
# 32 "parser.mly"
       (string)
# 2053 "parser.ml"
            )) * _menhir_state * 'tv_annotation) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, i), _, a) = _menhir_stack in
            let _v : 'tv_typed_variable = 
# 83 "parser.mly"
      ( (i, a) )
# 2059 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv415) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_typed_variable) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            match _menhir_s with
            | MenhirState28 | MenhirState11 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv389 * _menhir_state * 'tv_typed_variable) = Obj.magic _menhir_stack in
                ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                let _tok = _menhir_env._menhir_token in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv387 * _menhir_state * 'tv_typed_variable) = _menhir_stack in
                let (_tok : token) = _tok in
                ((match _tok with
                | COMMA ->
                    _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
                | EQUAL | RPAREN ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv383 * _menhir_state * 'tv_typed_variable) = Obj.magic _menhir_stack in
                    ((let (_menhir_stack, _menhir_s, av) = _menhir_stack in
                    let _v : 'tv_typed_variables = 
# 91 "parser.mly"
      ( [ av ] )
# 2085 "parser.ml"
                     in
                    _menhir_goto_typed_variables _menhir_env _menhir_stack _menhir_s _v) : 'freshtv384)
                | _ ->
                    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                    _menhir_env._menhir_shifted <- (-1);
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv385 * _menhir_state * 'tv_typed_variable) = Obj.magic _menhir_stack in
                    ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv386)) : 'freshtv388)) : 'freshtv390)
            | MenhirState119 | MenhirState51 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv399 * _menhir_state * 'tv_typed_variable) = Obj.magic _menhir_stack in
                ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                let _tok = _menhir_env._menhir_token in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv397 * _menhir_state * 'tv_typed_variable) = _menhir_stack in
                let (_tok : token) = _tok in
                ((match _tok with
                | EQUAL ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv393 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_typed_variable) = Obj.magic _menhir_stack in
                    ((let _tok = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv391 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_typed_variable) = _menhir_stack in
                    let (_tok : token) = _tok in
                    ((match _tok with
                    | CASE ->
                        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState53
                    | FUN ->
                        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState53
                    | IDENT _v ->
                        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
                    | LET ->
                        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState53
                    | MAJIDENT _v ->
                        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
                    | _ ->
                        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                        _menhir_env._menhir_shifted <- (-1);
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState53) : 'freshtv392)) : 'freshtv394)
                | _ ->
                    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                    _menhir_env._menhir_shifted <- (-1);
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv395 * _menhir_state * 'tv_typed_variable) = Obj.magic _menhir_stack in
                    ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv396)) : 'freshtv398)) : 'freshtv400)
            | MenhirState66 | MenhirState83 | MenhirState78 | MenhirState68 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv403 * _menhir_state * 'tv_typed_variable) = Obj.magic _menhir_stack in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv401 * _menhir_state * 'tv_typed_variable) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, tv) = _menhir_stack in
                let _v : 'tv_filter_variable = 
# 212 "parser.mly"
      ( PVar tv )
# 2142 "parser.ml"
                 in
                _menhir_goto_filter_variable _menhir_env _menhir_stack _menhir_s _v) : 'freshtv402)) : 'freshtv404)
            | MenhirState37 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv413 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * 'tv_typed_variable) = Obj.magic _menhir_stack in
                ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                let _tok = _menhir_env._menhir_token in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv411 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * 'tv_typed_variable) = _menhir_stack in
                let (_tok : token) = _tok in
                ((match _tok with
                | COMMA ->
                    _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
                | EQUAL ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv407 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * 'tv_typed_variable) = Obj.magic _menhir_stack in
                    ((let _tok = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv405 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * 'tv_typed_variable) = _menhir_stack in
                    let (_tok : token) = _tok in
                    ((match _tok with
                    | CASE ->
                        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState149
                    | FUN ->
                        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState149
                    | IDENT _v ->
                        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState149 _v
                    | LET ->
                        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState149
                    | MAJIDENT _v ->
                        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState149 _v
                    | _ ->
                        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                        _menhir_env._menhir_shifted <- (-1);
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState149) : 'freshtv406)) : 'freshtv408)
                | _ ->
                    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                    _menhir_env._menhir_shifted <- (-1);
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv409 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * 'tv_typed_variable) = Obj.magic _menhir_stack in
                    ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv410)) : 'freshtv412)) : 'freshtv414)
            | _ ->
                _menhir_fail ()) : 'freshtv416)) : 'freshtv418)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv419 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 2194 "parser.ml"
            )) * _menhir_state * 'tv_annotation) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv420)) : 'freshtv422)) : 'freshtv424)
    | MenhirState41 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv445) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 2203 "parser.ml"
        )) * _menhir_state * 'tv_annotation) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv443) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 2211 "parser.ml"
        )) * _menhir_state * 'tv_annotation) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | TYPEARROW ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv439 * _menhir_state * (
# 32 "parser.mly"
       (string)
# 2222 "parser.ml"
            )) * _menhir_state * 'tv_annotation) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, i), _, a) = _menhir_stack in
            let _v : 'tv_typed_parameter = 
# 87 "parser.mly"
      ( (i, a) )
# 2228 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv437) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_typed_parameter) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv435 * _menhir_state * 'tv_typed_parameter) = Obj.magic _menhir_stack in
            ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            let _tok = _menhir_env._menhir_token in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv433 * _menhir_state * 'tv_typed_parameter) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | COMMA ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv427) * _menhir_state * 'tv_typed_parameter) = Obj.magic _menhir_stack in
                ((let _tok = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv425) * _menhir_state * 'tv_typed_parameter) = _menhir_stack in
                let (_tok : token) = _tok in
                ((match _tok with
                | IDENT _v ->
                    _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState98 _v
                | _ ->
                    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                    _menhir_env._menhir_shifted <- (-1);
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState98) : 'freshtv426)) : 'freshtv428)
            | RPAREN ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv429 * _menhir_state * 'tv_typed_parameter) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, ap) = _menhir_stack in
                let _v : 'tv_typed_parameters = 
# 97 "parser.mly"
      ( [ ap ] )
# 2264 "parser.ml"
                 in
                _menhir_goto_typed_parameters _menhir_env _menhir_stack _menhir_s _v) : 'freshtv430)
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv431 * _menhir_state * 'tv_typed_parameter) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv432)) : 'freshtv434)) : 'freshtv436)) : 'freshtv438)) : 'freshtv440)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv441) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 2281 "parser.ml"
            )) * _menhir_state * 'tv_annotation) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv442)) : 'freshtv444)) : 'freshtv446)
    | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv455 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 2290 "parser.ml"
        )) * _menhir_state * 'tv_typed_parameters) * _menhir_state * 'tv_annotation) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv453 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 2298 "parser.ml"
        )) * _menhir_state * 'tv_typed_parameters) * _menhir_state * 'tv_annotation) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | EQUAL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv449 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 2307 "parser.ml"
            )) * _menhir_state * 'tv_typed_parameters) * _menhir_state * 'tv_annotation) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv447 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 2314 "parser.ml"
            )) * _menhir_state * 'tv_typed_parameters) * _menhir_state * 'tv_annotation) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | CASE ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState47
            | FUN ->
                _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState47
            | IDENT _v ->
                _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
            | LET ->
                _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState47
            | MAJIDENT _v ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState47) : 'freshtv448)) : 'freshtv450)
        | TYPEARROW ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv451 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 2341 "parser.ml"
            )) * _menhir_state * 'tv_typed_parameters) * _menhir_state * 'tv_annotation) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv452)) : 'freshtv454)) : 'freshtv456)
    | MenhirState60 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv465 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_typed_parameters) * _menhir_state * 'tv_annotation) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv463 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_typed_parameters) * _menhir_state * 'tv_annotation) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | ARROW ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv459 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_typed_parameters) * _menhir_state * 'tv_annotation) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv457 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_typed_parameters) * _menhir_state * 'tv_annotation) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | CASE ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | FUN ->
                _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | IDENT _v ->
                _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
            | LET ->
                _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | MAJIDENT _v ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState62) : 'freshtv458)) : 'freshtv460)
        | TYPEARROW ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv461 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_typed_parameters) * _menhir_state * 'tv_annotation) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv462)) : 'freshtv464)) : 'freshtv466)
    | MenhirState70 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv473 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_annotation) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv471 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_annotation) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | TYPEARROW ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | ARROW | COMMA | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv467 * _menhir_state) * _menhir_state * 'tv_annotation) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, a) = _menhir_stack in
            let _v : 'tv_filter_variable = 
# 214 "parser.mly"
      ( PVar (fresh (), a) )
# 2403 "parser.ml"
             in
            _menhir_goto_filter_variable _menhir_env _menhir_stack _menhir_s _v) : 'freshtv468)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv469 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_annotation) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv470)) : 'freshtv472)) : 'freshtv474)
    | MenhirState106 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv483 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_type_variables) * _menhir_state * 'tv_typed_parameters) * _menhir_state * 'tv_annotation) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv481 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_type_variables) * _menhir_state * 'tv_typed_parameters) * _menhir_state * 'tv_annotation) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | ARROW ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv477 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_type_variables) * _menhir_state * 'tv_typed_parameters) * _menhir_state * 'tv_annotation) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv475 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_type_variables) * _menhir_state * 'tv_typed_parameters) * _menhir_state * 'tv_annotation) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | CASE ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState108
            | FUN ->
                _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState108
            | IDENT _v ->
                _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _v
            | LET ->
                _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState108
            | MAJIDENT _v ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _v
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState108) : 'freshtv476)) : 'freshtv478)
        | TYPEARROW ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv479 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_type_variables) * _menhir_state * 'tv_typed_parameters) * _menhir_state * 'tv_annotation) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv480)) : 'freshtv482)) : 'freshtv484)
    | MenhirState141 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv493 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 2458 "parser.ml"
        )) * _menhir_state * 'tv_type_variables) * _menhir_state * 'tv_typed_parameters) * _menhir_state * 'tv_annotation) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv491 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 2466 "parser.ml"
        )) * _menhir_state * 'tv_type_variables) * _menhir_state * 'tv_typed_parameters) * _menhir_state * 'tv_annotation) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | EQUAL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv487 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 2475 "parser.ml"
            )) * _menhir_state * 'tv_type_variables) * _menhir_state * 'tv_typed_parameters) * _menhir_state * 'tv_annotation) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv485 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 2482 "parser.ml"
            )) * _menhir_state * 'tv_type_variables) * _menhir_state * 'tv_typed_parameters) * _menhir_state * 'tv_annotation) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | CASE ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState143
            | FUN ->
                _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState143
            | IDENT _v ->
                _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState143 _v
            | LET ->
                _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState143
            | MAJIDENT _v ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState143 _v
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState143) : 'freshtv486)) : 'freshtv488)
        | TYPEARROW ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv489 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 2509 "parser.ml"
            )) * _menhir_state * 'tv_type_variables) * _menhir_state * 'tv_typed_parameters) * _menhir_state * 'tv_annotation) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv490)) : 'freshtv492)) : 'freshtv494)
    | _ ->
        _menhir_fail ()

and _menhir_reduce5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_annotations = 
# 67 "parser.mly"
      ( [] )
# 2521 "parser.ml"
     in
    _menhir_goto_annotations _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_program : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_program -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv361 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * 'tv_program) = Obj.magic _menhir_stack in
    ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv359 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * 'tv_program) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | EOF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv355 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * 'tv_program) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv353 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * 'tv_program) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, t), _, d), _, p) = _menhir_stack in
        let _v : (
# 41 "parser.mly"
      (Fsafe.fsafe)
# 2545 "parser.ml"
        ) = 
# 47 "parser.mly"
      ( { types = t; globals = d; entry = p } )
# 2549 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv351) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 41 "parser.mly"
      (Fsafe.fsafe)
# 2557 "parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv349) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 41 "parser.mly"
      (Fsafe.fsafe)
# 2565 "parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv347) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_1 : (
# 41 "parser.mly"
      (Fsafe.fsafe)
# 2573 "parser.ml"
        )) = _v in
        (Obj.magic _1 : 'freshtv348)) : 'freshtv350)) : 'freshtv352)) : 'freshtv354)) : 'freshtv356)
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv357 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * 'tv_program) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv358)) : 'freshtv360)) : 'freshtv362)

and _menhir_run48 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 33 "parser.mly"
       (string)
# 2587 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv345 * _menhir_state * (
# 33 "parser.mly"
       (string)
# 2596 "parser.ml"
    )) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | LBRACKET ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv335 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 2605 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv333 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 2612 "parser.ml"
        )) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | IDENT _v ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState128 _v
        | MAJIDENT _v ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState128 _v
        | RBRACKET ->
            _menhir_reduce5 _menhir_env (Obj.magic _menhir_stack) MenhirState128
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState128) : 'freshtv334)) : 'freshtv336)
    | LPAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv339 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 2631 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv337 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 2638 "parser.ml"
        )) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | CASE ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | FUN ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | IDENT _v ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
        | LET ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | MAJIDENT _v ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState49) : 'freshtv338)) : 'freshtv340)
    | CASE | COMMA | DEF | EOF | FUN | IDENT _ | LBRACE | LET | MAJIDENT _ | PIPE | RBRACE | RPAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv341 * _menhir_state * (
# 33 "parser.mly"
       (string)
# 2661 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, i) = _menhir_stack in
        let _v : 'tv_dconstructor_application = 
# 190 "parser.mly"
      ( EConApp (i, [], []) )
# 2667 "parser.ml"
         in
        _menhir_goto_dconstructor_application _menhir_env _menhir_stack _menhir_s _v) : 'freshtv342)
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv343 * _menhir_state * (
# 33 "parser.mly"
       (string)
# 2677 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv344)) : 'freshtv346)

and _menhir_run50 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv331 * _menhir_state) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | LPAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv327 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv325 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | IDENT _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
        | RPAREN ->
            _menhir_reduce8 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState51) : 'freshtv326)) : 'freshtv328)
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv329 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv330)) : 'freshtv332)

and _menhir_run54 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 32 "parser.mly"
       (string)
# 2717 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv323 * _menhir_state * (
# 32 "parser.mly"
       (string)
# 2726 "parser.ml"
    )) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | LBRACKET ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv313 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 2735 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv311 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 2742 "parser.ml"
        )) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | IDENT _v ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState112 _v
        | MAJIDENT _v ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState112 _v
        | RBRACKET ->
            _menhir_reduce5 _menhir_env (Obj.magic _menhir_stack) MenhirState112
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState112) : 'freshtv312)) : 'freshtv314)
    | LPAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv317 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 2761 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv315 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 2768 "parser.ml"
        )) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | CASE ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | FUN ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | IDENT _v ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
        | LET ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | MAJIDENT _v ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState55) : 'freshtv316)) : 'freshtv318)
    | CASE | COMMA | DEF | EOF | FUN | IDENT _ | LBRACE | LET | MAJIDENT _ | PIPE | RBRACE | RPAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv319 * _menhir_state * (
# 32 "parser.mly"
       (string)
# 2791 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, i) = _menhir_stack in
        let _v : 'tv_expression = 
# 163 "parser.mly"
      ( { e = EVar i; t = Undefined } )
# 2797 "parser.ml"
         in
        _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v) : 'freshtv320)
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv321 * _menhir_state * (
# 32 "parser.mly"
       (string)
# 2807 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv322)) : 'freshtv324)

and _menhir_run56 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv309 * _menhir_state) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | LBRACKET ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv301 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv299 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | MAJIDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
        | RBRACKET ->
            _menhir_reduce54 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState100) : 'freshtv300)) : 'freshtv302)
    | LPAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv305 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv303 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | IDENT _v ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _v
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState57) : 'freshtv304)) : 'freshtv306)
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv307 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv308)) : 'freshtv310)

and _menhir_run63 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv297 * _menhir_state) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | CASE ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | FUN ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | IDENT _v ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
    | LET ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | MAJIDENT _v ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState63) : 'freshtv298)

and _menhir_goto_type_definition : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_type_definition -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv295 * _menhir_state * 'tv_type_definition) = Obj.magic _menhir_stack in
    ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv293 * _menhir_state * 'tv_type_definition) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | TYPE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState158
    | CASE | DEF | EOF | FUN | IDENT _ | LET | MAJIDENT _ ->
        _menhir_reduce52 _menhir_env (Obj.magic _menhir_stack) MenhirState158
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState158) : 'freshtv294)) : 'freshtv296)

and _menhir_run14 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 33 "parser.mly"
       (string)
# 2904 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _ = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv291) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (i : (
# 33 "parser.mly"
       (string)
# 2914 "parser.ml"
    )) = _v in
    ((let _v : 'tv_annotation = 
# 57 "parser.mly"
      ( AVar i )
# 2919 "parser.ml"
     in
    _menhir_goto_annotation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv292)

and _menhir_run15 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 32 "parser.mly"
       (string)
# 2926 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv289 * _menhir_state * (
# 32 "parser.mly"
       (string)
# 2935 "parser.ml"
    )) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | LBRACKET ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv283 * _menhir_state * (
# 32 "parser.mly"
       (string)
# 2944 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv281 * _menhir_state * (
# 32 "parser.mly"
       (string)
# 2951 "parser.ml"
        )) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | IDENT _v ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState16 _v
        | MAJIDENT _v ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState16 _v
        | RBRACKET ->
            _menhir_reduce5 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState16) : 'freshtv282)) : 'freshtv284)
    | ARROW | COMMA | EQUAL | RBRACKET | RPAREN | TYPEARROW ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv285 * _menhir_state * (
# 32 "parser.mly"
       (string)
# 2970 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, i) = _menhir_stack in
        let _v : 'tv_annotation = 
# 59 "parser.mly"
      ( AConApp (i, []) )
# 2976 "parser.ml"
         in
        _menhir_goto_annotation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv286)
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv287 * _menhir_state * (
# 32 "parser.mly"
       (string)
# 2986 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv288)) : 'freshtv290)

and _menhir_goto_global_definitions : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_global_definitions -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState36 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv275 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv273 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | CASE ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState151
        | FUN ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState151
        | IDENT _v ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState151 _v
        | LET ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState151
        | MAJIDENT _v ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState151 _v
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv271) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState151 in
            ((let _v : 'tv_program = 
# 51 "parser.mly"
      ( [] )
# 3021 "parser.ml"
             in
            _menhir_goto_program _menhir_env _menhir_stack _menhir_s _v) : 'freshtv272)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState151) : 'freshtv274)) : 'freshtv276)
    | MenhirState156 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv279 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definition) * _menhir_state * 'tv_global_definitions) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv277 * _menhir_state * 'tv_global_definition) * _menhir_state * 'tv_global_definitions) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, gd), _, gds) = _menhir_stack in
        let _v : 'tv_global_definitions = 
# 137 "parser.mly"
      ( gd :: gds )
# 3037 "parser.ml"
         in
        _menhir_goto_global_definitions _menhir_env _menhir_stack _menhir_s _v) : 'freshtv278)) : 'freshtv280)
    | _ ->
        _menhir_fail ()

and _menhir_run40 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 32 "parser.mly"
       (string)
# 3046 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv269 * _menhir_state * (
# 32 "parser.mly"
       (string)
# 3055 "parser.ml"
    )) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | COLON ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv265) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 3064 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv263) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 3071 "parser.ml"
        )) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | IDENT _v ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
        | MAJIDENT _v ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState41) : 'freshtv264)) : 'freshtv266)
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv267 * _menhir_state * (
# 32 "parser.mly"
       (string)
# 3090 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv268)) : 'freshtv270)

and _menhir_goto_data_constructors : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_data_constructors -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState9 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv253 * _menhir_state) * (
# 32 "parser.mly"
       (string)
# 3103 "parser.ml"
        )) * _menhir_state * 'tv_type_variables) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_data_constructors) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv251 * _menhir_state) * (
# 32 "parser.mly"
       (string)
# 3111 "parser.ml"
        )) * _menhir_state * 'tv_type_variables) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let (dcs : 'tv_data_constructors) = _v in
        ((let (((_menhir_stack, _menhir_s), i), _, tvs) = _menhir_stack in
        let _v : 'tv_type_definition = 
# 119 "parser.mly"
      ( TDef (i, tvs, dcs) )
# 3119 "parser.ml"
         in
        _menhir_goto_type_definition _menhir_env _menhir_stack _menhir_s _v) : 'freshtv252)) : 'freshtv254)
    | MenhirState32 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv257 * _menhir_state) * (
# 32 "parser.mly"
       (string)
# 3127 "parser.ml"
        )) * _menhir_state * 'tv_data_constructor) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_data_constructors) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv255 * _menhir_state * 'tv_data_constructor) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let (dcs : 'tv_data_constructors) = _v in
        ((let (_menhir_stack, _menhir_s, dc) = _menhir_stack in
        let _v : 'tv_data_constructors = 
# 125 "parser.mly"
      ( dc :: dcs )
# 3139 "parser.ml"
         in
        _menhir_goto_data_constructors _menhir_env _menhir_stack _menhir_s _v) : 'freshtv256)) : 'freshtv258)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv261 * _menhir_state) * (
# 32 "parser.mly"
       (string)
# 3147 "parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_data_constructors) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv259 * _menhir_state) * (
# 32 "parser.mly"
       (string)
# 3155 "parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let (dcs : 'tv_data_constructors) = _v in
        ((let ((_menhir_stack, _menhir_s), i) = _menhir_stack in
        let _v : 'tv_type_definition = 
# 117 "parser.mly"
      ( TDef (i, [], dcs) )
# 3163 "parser.ml"
         in
        _menhir_goto_type_definition _menhir_env _menhir_stack _menhir_s _v) : 'freshtv260)) : 'freshtv262)
    | _ ->
        _menhir_fail ()

and _menhir_run13 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 32 "parser.mly"
       (string)
# 3172 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv249 * _menhir_state * (
# 32 "parser.mly"
       (string)
# 3180 "parser.ml"
    )) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | IDENT _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | MAJIDENT _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState13) : 'freshtv250)

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_reduce44 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_global_definitions = 
# 135 "parser.mly"
      ( [] )
# 3203 "parser.ml"
     in
    _menhir_goto_global_definitions _menhir_env _menhir_stack _menhir_s _v

and _menhir_run37 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv247 * _menhir_state) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | IDENT _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv245 * _menhir_state * 'tv_type_definitions) * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState37 in
        let (_v : (
# 32 "parser.mly"
       (string)
# 3222 "parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv243 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 3230 "parser.ml"
        )) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | COLON ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv235 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 3241 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv233 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 3248 "parser.ml"
            )) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | MAJIDENT _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState135 _v
            | RBRACKET ->
                _menhir_reduce54 _menhir_env (Obj.magic _menhir_stack) MenhirState135
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState135) : 'freshtv234)) : 'freshtv236)
        | LPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv239 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 3265 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv237 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 3272 "parser.ml"
            )) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | IDENT _v ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState39) : 'freshtv238)) : 'freshtv240)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv241 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 3289 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv242)) : 'freshtv244)) : 'freshtv246)
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState37) : 'freshtv248)

and _menhir_goto_type_variables : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_type_variables -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv183 * _menhir_state) * (
# 32 "parser.mly"
       (string)
# 3307 "parser.ml"
        )) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 3311 "parser.ml"
        )) * _menhir_state * 'tv_type_variables) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv181 * _menhir_state * (
# 33 "parser.mly"
       (string)
# 3317 "parser.ml"
        )) * _menhir_state * 'tv_type_variables) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, i), _, tvs) = _menhir_stack in
        let _v : 'tv_type_variables = 
# 79 "parser.mly"
      ( i :: tvs )
# 3323 "parser.ml"
         in
        _menhir_goto_type_variables _menhir_env _menhir_stack _menhir_s _v) : 'freshtv182)) : 'freshtv184)
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv199 * _menhir_state) * (
# 32 "parser.mly"
       (string)
# 3331 "parser.ml"
        )) * _menhir_state * 'tv_type_variables) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv197 * _menhir_state) * (
# 32 "parser.mly"
       (string)
# 3339 "parser.ml"
        )) * _menhir_state * 'tv_type_variables) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | RBRACKET ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv193 * _menhir_state) * (
# 32 "parser.mly"
       (string)
# 3348 "parser.ml"
            )) * _menhir_state * 'tv_type_variables) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv191 * _menhir_state) * (
# 32 "parser.mly"
       (string)
# 3355 "parser.ml"
            )) * _menhir_state * 'tv_type_variables) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | EQUAL ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv187 * _menhir_state) * (
# 32 "parser.mly"
       (string)
# 3364 "parser.ml"
                )) * _menhir_state * 'tv_type_variables) = Obj.magic _menhir_stack in
                ((let _tok = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv185 * _menhir_state) * (
# 32 "parser.mly"
       (string)
# 3371 "parser.ml"
                )) * _menhir_state * 'tv_type_variables) = _menhir_stack in
                let (_tok : token) = _tok in
                ((match _tok with
                | MAJIDENT _v ->
                    _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
                | _ ->
                    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                    _menhir_env._menhir_shifted <- (-1);
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState9) : 'freshtv186)) : 'freshtv188)
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv189 * _menhir_state) * (
# 32 "parser.mly"
       (string)
# 3388 "parser.ml"
                )) * _menhir_state * 'tv_type_variables) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv190)) : 'freshtv192)) : 'freshtv194)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv195 * _menhir_state) * (
# 32 "parser.mly"
       (string)
# 3399 "parser.ml"
            )) * _menhir_state * 'tv_type_variables) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv196)) : 'freshtv198)) : 'freshtv200)
    | MenhirState100 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv215 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_type_variables) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv213 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_type_variables) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | RBRACKET ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv209 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_type_variables) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv207 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_type_variables) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | LPAREN ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv203 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_type_variables) = Obj.magic _menhir_stack in
                ((let _tok = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv201 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_type_variables) = _menhir_stack in
                let (_tok : token) = _tok in
                ((match _tok with
                | IDENT _v ->
                    _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _v
                | _ ->
                    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                    _menhir_env._menhir_shifted <- (-1);
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState103) : 'freshtv202)) : 'freshtv204)
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv205 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_type_variables) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv206)) : 'freshtv208)) : 'freshtv210)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv211 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_type_variables) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv212)) : 'freshtv214)) : 'freshtv216)
    | MenhirState135 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv231 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 3453 "parser.ml"
        )) * _menhir_state * 'tv_type_variables) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv229 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 3461 "parser.ml"
        )) * _menhir_state * 'tv_type_variables) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | RBRACKET ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv225 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 3470 "parser.ml"
            )) * _menhir_state * 'tv_type_variables) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv223 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 3477 "parser.ml"
            )) * _menhir_state * 'tv_type_variables) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | LPAREN ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv219 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 3486 "parser.ml"
                )) * _menhir_state * 'tv_type_variables) = Obj.magic _menhir_stack in
                ((let _tok = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv217 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 3493 "parser.ml"
                )) * _menhir_state * 'tv_type_variables) = _menhir_stack in
                let (_tok : token) = _tok in
                ((match _tok with
                | IDENT _v ->
                    _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState138 _v
                | _ ->
                    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                    _menhir_env._menhir_shifted <- (-1);
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState138) : 'freshtv218)) : 'freshtv220)
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv221 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 3510 "parser.ml"
                )) * _menhir_state * 'tv_type_variables) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv222)) : 'freshtv224)) : 'freshtv226)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv227 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 3521 "parser.ml"
            )) * _menhir_state * 'tv_type_variables) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv228)) : 'freshtv230)) : 'freshtv232)
    | _ ->
        _menhir_fail ()

and _menhir_goto_data_constructor : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_data_constructor -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv179 * _menhir_state * 'tv_data_constructor) = Obj.magic _menhir_stack in
    ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv177 * _menhir_state * 'tv_data_constructor) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | PIPE ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv171 * _menhir_state) * (
# 32 "parser.mly"
       (string)
# 3544 "parser.ml"
        )) * _menhir_state * 'tv_data_constructor) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv169 * _menhir_state) * (
# 32 "parser.mly"
       (string)
# 3551 "parser.ml"
        )) * _menhir_state * 'tv_data_constructor) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | MAJIDENT _v ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState32) : 'freshtv170)) : 'freshtv172)
    | CASE | DEF | EOF | FUN | IDENT _ | LET | MAJIDENT _ | TYPE ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv173 * _menhir_state * 'tv_data_constructor) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, dc) = _menhir_stack in
        let _v : 'tv_data_constructors = 
# 123 "parser.mly"
      ( [ dc ] )
# 3568 "parser.ml"
         in
        _menhir_goto_data_constructors _menhir_env _menhir_stack _menhir_s _v) : 'freshtv174)
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv175 * _menhir_state * 'tv_data_constructor) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv176)) : 'freshtv178)) : 'freshtv180)

and _menhir_run12 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 32 "parser.mly"
       (string)
# 3582 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv167 * _menhir_state * (
# 32 "parser.mly"
       (string)
# 3591 "parser.ml"
    )) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | COLON ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv165 * _menhir_state * (
# 32 "parser.mly"
       (string)
# 3604 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv166)) : 'freshtv168)

and _menhir_goto_type_definitions : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_type_definitions -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv159 * _menhir_state * 'tv_type_definitions) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv157 * _menhir_state * 'tv_type_definitions) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | DEF ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | CASE | EOF | FUN | IDENT _ | LET | MAJIDENT _ ->
            _menhir_reduce44 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState36) : 'freshtv158)) : 'freshtv160)
    | MenhirState158 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv163 * _menhir_state * 'tv_type_definition) * _menhir_state * 'tv_type_definitions) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv161 * _menhir_state * 'tv_type_definition) * _menhir_state * 'tv_type_definitions) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, td), _, tds) = _menhir_stack in
        let _v : 'tv_type_definitions = 
# 113 "parser.mly"
      ( td :: tds )
# 3639 "parser.ml"
         in
        _menhir_goto_type_definitions _menhir_env _menhir_stack _menhir_s _v) : 'freshtv162)) : 'freshtv164)
    | _ ->
        _menhir_fail ()

and _menhir_reduce54 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_type_variables = 
# 75 "parser.mly"
      ( [] )
# 3650 "parser.ml"
     in
    _menhir_goto_type_variables _menhir_env _menhir_stack _menhir_s _v

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 33 "parser.mly"
       (string)
# 3657 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv155 * _menhir_state * (
# 33 "parser.mly"
       (string)
# 3666 "parser.ml"
    )) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | COMMA ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv149 * _menhir_state) * (
# 32 "parser.mly"
       (string)
# 3675 "parser.ml"
        )) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 3679 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv147 * _menhir_state) * (
# 32 "parser.mly"
       (string)
# 3686 "parser.ml"
        )) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 3690 "parser.ml"
        )) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | MAJIDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
        | RBRACKET ->
            _menhir_reduce54 _menhir_env (Obj.magic _menhir_stack) MenhirState5
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState5) : 'freshtv148)) : 'freshtv150)
    | RBRACKET ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv151 * _menhir_state * (
# 33 "parser.mly"
       (string)
# 3707 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, i) = _menhir_stack in
        let _v : 'tv_type_variables = 
# 77 "parser.mly"
      ( [i] )
# 3713 "parser.ml"
         in
        _menhir_goto_type_variables _menhir_env _menhir_stack _menhir_s _v) : 'freshtv152)
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv153 * _menhir_state * (
# 33 "parser.mly"
       (string)
# 3723 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv154)) : 'freshtv156)

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 33 "parser.mly"
       (string)
# 3731 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv145 * _menhir_state * (
# 33 "parser.mly"
       (string)
# 3740 "parser.ml"
    )) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | LPAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv139 * _menhir_state) * (
# 32 "parser.mly"
       (string)
# 3749 "parser.ml"
        )) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 3753 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv137 * _menhir_state) * (
# 32 "parser.mly"
       (string)
# 3760 "parser.ml"
        )) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 3764 "parser.ml"
        )) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | IDENT _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState11) : 'freshtv138)) : 'freshtv140)
    | CASE | DEF | EOF | FUN | IDENT _ | LET | MAJIDENT _ | PIPE | TYPE ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv141 * _menhir_state * (
# 33 "parser.mly"
       (string)
# 3779 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, i) = _menhir_stack in
        let _v : 'tv_data_constructor = 
# 129 "parser.mly"
      ( TConApp (i, []) )
# 3785 "parser.ml"
         in
        _menhir_goto_data_constructor _menhir_env _menhir_stack _menhir_s _v) : 'freshtv142)
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv143 * _menhir_state * (
# 33 "parser.mly"
       (string)
# 3795 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv144)) : 'freshtv146)

and _menhir_discard : _menhir_env -> token =
  fun _menhir_env ->
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = _menhir_env._menhir_lexer lexbuf in
    _menhir_env._menhir_token <- _tok;
    _menhir_env._menhir_startp <- lexbuf.Lexing.lex_start_p;
    _menhir_env._menhir_endp <- lexbuf.Lexing.lex_curr_p;
    let shifted = Pervasives.(+) _menhir_env._menhir_shifted 1 in
    if Pervasives.(>=) shifted 0 then
      _menhir_env._menhir_shifted <- shifted;
    _tok

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState158 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv23 * _menhir_state * 'tv_type_definition) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv24)
    | MenhirState156 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv25 * _menhir_state * 'tv_global_definition) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv26)
    | MenhirState154 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv27 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv28)
    | MenhirState151 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv29 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv30)
    | MenhirState149 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv31 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * 'tv_typed_variable) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)
    | MenhirState146 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv33 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * 'tv_typed_variables) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv34)
    | MenhirState143 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv35 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 3850 "parser.ml"
        )) * _menhir_state * 'tv_type_variables) * _menhir_state * 'tv_typed_parameters) * _menhir_state * 'tv_annotation) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv36)
    | MenhirState141 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv37 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 3859 "parser.ml"
        )) * _menhir_state * 'tv_type_variables) * _menhir_state * 'tv_typed_parameters) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv38)
    | MenhirState138 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv39 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 3868 "parser.ml"
        )) * _menhir_state * 'tv_type_variables) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv40)
    | MenhirState135 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv41 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 3877 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)
    | MenhirState131 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv43 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 3886 "parser.ml"
        )) * _menhir_state * 'tv_annotations) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv44)
    | MenhirState128 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv45 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 3895 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)
    | MenhirState123 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv47 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_assignments) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv48)
    | MenhirState119 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv49 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_typed_variable) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState115 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv51 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 3914 "parser.ml"
        )) * _menhir_state * 'tv_annotations) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)
    | MenhirState112 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv53 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 3923 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)
    | MenhirState108 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv55 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_type_variables) * _menhir_state * 'tv_typed_parameters) * _menhir_state * 'tv_annotation) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv56)
    | MenhirState106 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv57 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_type_variables) * _menhir_state * 'tv_typed_parameters) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv58)
    | MenhirState103 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv59 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_type_variables) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv60)
    | MenhirState100 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv61 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)
    | MenhirState98 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv63) * _menhir_state * 'tv_typed_parameter) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv64)
    | MenhirState94 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv65 * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)
    | MenhirState88 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv67 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state * 'tv_filters) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv68)
    | MenhirState87 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv69 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state * 'tv_filters) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)
    | MenhirState83 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv71 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 3972 "parser.ml"
        )) * _menhir_state * 'tv_annotations) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv72)
    | MenhirState80 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv73 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 3981 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv74)
    | MenhirState78 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv75 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state * 'tv_filter) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv76)
    | MenhirState70 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv77 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv78)
    | MenhirState68 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv79 * _menhir_state) * _menhir_state * 'tv_expressions) * _menhir_state) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 4000 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv80)
    | MenhirState66 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv81 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv82)
    | MenhirState65 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv83 * _menhir_state) * _menhir_state * 'tv_expressions) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv84)
    | MenhirState63 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv85 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv86)
    | MenhirState62 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv87 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_typed_parameters) * _menhir_state * 'tv_annotation) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv88)
    | MenhirState60 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv89 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_typed_parameters) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv90)
    | MenhirState57 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv91 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv92)
    | MenhirState55 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv93 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 4039 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv94)
    | MenhirState53 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv95 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) * _menhir_state * 'tv_typed_variable) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv96)
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv97 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv98)
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv99 * _menhir_state * 'tv_type_definitions) * _menhir_state * 'tv_global_definitions) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 4058 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv100)
    | MenhirState47 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv101 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 4067 "parser.ml"
        )) * _menhir_state * 'tv_typed_parameters) * _menhir_state * 'tv_annotation) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv102)
    | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv103 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 4076 "parser.ml"
        )) * _menhir_state * 'tv_typed_parameters) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv104)
    | MenhirState41 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv105) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 4085 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv106)
    | MenhirState39 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv107 * _menhir_state * 'tv_type_definitions) * _menhir_state) * _menhir_state * (
# 32 "parser.mly"
       (string)
# 4094 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv108)
    | MenhirState37 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv109 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv110)
    | MenhirState36 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv111 * _menhir_state * 'tv_type_definitions) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv112)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv113 * _menhir_state) * (
# 32 "parser.mly"
       (string)
# 4113 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv114)
    | MenhirState32 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv115 * _menhir_state) * (
# 32 "parser.mly"
       (string)
# 4122 "parser.ml"
        )) * _menhir_state * 'tv_data_constructor) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv116)
    | MenhirState28 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv117 * _menhir_state * 'tv_typed_variable) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv118)
    | MenhirState22 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv119) * _menhir_state * 'tv_annotation) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv120)
    | MenhirState20 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv121 * _menhir_state * 'tv_annotation) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv122)
    | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv123 * _menhir_state * (
# 32 "parser.mly"
       (string)
# 4146 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv124)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv125 * _menhir_state * (
# 32 "parser.mly"
       (string)
# 4155 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv126)
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv127 * _menhir_state) * (
# 32 "parser.mly"
       (string)
# 4164 "parser.ml"
        )) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 4168 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv128)
    | MenhirState9 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv129 * _menhir_state) * (
# 32 "parser.mly"
       (string)
# 4177 "parser.ml"
        )) * _menhir_state * 'tv_type_variables) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv130)
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv131 * _menhir_state) * (
# 32 "parser.mly"
       (string)
# 4186 "parser.ml"
        )) * _menhir_state * (
# 33 "parser.mly"
       (string)
# 4190 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv132)
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv133 * _menhir_state) * (
# 32 "parser.mly"
       (string)
# 4199 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv134)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv135) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv136)

and _menhir_reduce52 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_type_definitions = 
# 111 "parser.mly"
      ( [] )
# 4213 "parser.ml"
     in
    _menhir_goto_type_definitions _menhir_env _menhir_stack _menhir_s _v

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv21 * _menhir_state) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | IDENT _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv17 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 32 "parser.mly"
       (string)
# 4231 "parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv15 * _menhir_state) * (
# 32 "parser.mly"
       (string)
# 4239 "parser.ml"
        )) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | EQUAL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv7 * _menhir_state) * (
# 32 "parser.mly"
       (string)
# 4248 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv5 * _menhir_state) * (
# 32 "parser.mly"
       (string)
# 4255 "parser.ml"
            )) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | MAJIDENT _v ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34) : 'freshtv6)) : 'freshtv8)
        | LBRACKET ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv11 * _menhir_state) * (
# 32 "parser.mly"
       (string)
# 4270 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv9 * _menhir_state) * (
# 32 "parser.mly"
       (string)
# 4277 "parser.ml"
            )) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | MAJIDENT _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
            | RBRACKET ->
                _menhir_reduce54 _menhir_env (Obj.magic _menhir_stack) MenhirState3
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState3) : 'freshtv10)) : 'freshtv12)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv13 * _menhir_state) * (
# 32 "parser.mly"
       (string)
# 4296 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv14)) : 'freshtv16)) : 'freshtv18)
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv19 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv20)) : 'freshtv22)

and fsafe : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 41 "parser.mly"
      (Fsafe.fsafe)
# 4311 "parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env =
      let (lexer : Lexing.lexbuf -> token) = lexer in
      let (lexbuf : Lexing.lexbuf) = lexbuf in
      ((let _tok = lexer lexbuf in
      {
        _menhir_lexer = lexer;
        _menhir_lexbuf = lexbuf;
        _menhir_token = _tok;
        _menhir_startp = lexbuf.Lexing.lex_start_p;
        _menhir_endp = lexbuf.Lexing.lex_curr_p;
        _menhir_shifted = 4611686018427387903;
        }) : _menhir_env)
    in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv3) = () in
    ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | TYPE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | CASE | DEF | EOF | FUN | IDENT _ | LET | MAJIDENT _ ->
        _menhir_reduce52 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv2)) : 'freshtv4))




