open! Core
open Cmdliner

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
  Cmd.v info Term.(const Server.start_server $ port)

let () = Cmd.eval cmd |> exit
