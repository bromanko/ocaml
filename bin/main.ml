open! Core
open Cmdliner

let hello who =
  let open Dream_html in
  let open HTML in
  html [] [ body [] [ h1 [] [ txt "Hello, %s!" who ] ] ]

let start_server port =
  Dream.run ~port @@ Dream.logger @@ Dream.livereload
  @@ Dream.router
       [
         Dream.get "/" (fun _ -> Dream_html.respond (hello "world of the foo!"));
       ]

let port =
  let env =
    let doc = "Overrides the port." in
    Cmd.Env.info "SERVER_PORT" ~doc
  in
  let doc = "Port to listen on" in
  Arg.(value & opt int 8080 & info [ "p"; "port" ] ~env ~docv:"PORT" ~doc)

let cmd =
  let info =
    let doc = "Dream server" in
    Cmd.info "server" ~version:"%‌%VERSION%%" ~doc
  in
  Cmd.v info Term.(const start_server $ port)

let () = Cmd.eval cmd |> exit
