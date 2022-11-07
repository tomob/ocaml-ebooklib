open Core

module Epub = struct
  type t = {
    opf_file : string;
    opf_dir : string
  }
end

module Reader = struct
  open Markup
  open Lambdasoup

  let read_container zip_file =
    let container_entry = Zip.find_entry zip_file "META-INF/container.xml" in
    Zip.read_entry zip_file container_entry

  let get_rootfile container_content =
    string container_content
    |> parse_xml
    |> Markup.signals
    |> from_signals
    |> select_one "rootfile[media-type=\"application/oebps-package+xml\"]"
    |> require (* TODO: Handle missing rootfile *)
    |> attribute "full-path"
    |> require (* TODO: Handle missing path *)

  let read_file filename =
    let zip_file = Zip.open_in filename in
    let container = read_container zip_file in
    let rootfile = get_rootfile container in
    let open Epub in
    {opf_file = rootfile; opf_dir = Filename.dirname rootfile}
end

(* let read_epub name =
  let book = epub.book *)
