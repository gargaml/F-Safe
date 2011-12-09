let main () =
  let lexbuf = Lexing.from_channel (open_in argv.[1]) in
  try
    Parser.script Lexer.token lexbuf
  with
    | Failure msg -> printf "Syntax error : %s\n%!" msg
    | Parsing.Parse_error -> printf "Parse error\n%!"
;;

main ();;

  
