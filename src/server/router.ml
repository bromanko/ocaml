let asset_loader =
  Static.loader
    ~read:(fun _root path -> Static_files.Asset.read path |> Lwt.return)
    ~digest:(fun _root path ->
      Option.map Dream.to_base64url (Static_files.Asset.digest path))
    ~not_cached:[ "robots.txt"; "/robots.txt" ]

let page_routes =
  Dream.scope "" []
    [ Dream.get "/" (fun _ -> Dream_html.respond (Templates.home ())) ]

let router =
  Dream.router
    [
      page_routes;
      Dream.scope "" []
        [ Dream.get "/**" (Dream.static ~loader:asset_loader "") ];
    ]
