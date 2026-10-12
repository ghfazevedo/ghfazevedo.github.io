---
title: Fieldwork
lead: My work also depends on sampling specimens in the field. Here are a few photos from some of the places where I have collected.

# ─────────────────────────────────────────────────────────────
# MAP PINS are in  pins.csv  in this folder (open it in Excel; save as "CSV UTF-8").
# Columns: title, lat, lon, year, type, album, note, precision
#   lat / lon  decimal degrees (Google Maps: right-click a spot and click the numbers)
#   type       one of the keys below (expedition, locality) — sets the pin colour
#   album      optional: folder name of an album below, to link the pin to its photos
#   note       optional short text shown when the pin is clicked (Markdown allowed)
#   precision  write  approx  for sensitive sites: the pin is rounded (~10 km) and shown as a soft circle
# ─────────────────────────────────────────────────────────────
# Keep pins.csv (with exact coordinates) off the public site; only the map uses it
build:
  publishResources: false

pin_types:
  expedition: { label: Expedition, color: "#A8322D" }
  locality:   { label: Collecting locality, color: "#2F5DA8" }

# ─────────────────────────────────────────────────────────────
# ALBUMS (newest first). For each album:
#   1. create a folder inside content/fieldwork/ (e.g. arizona-2022)
#   2. drop the photos in it (any size)
#   3. add a block below. "photos:" is optional — leave it out to show every photo
#      in the folder; list them to set the order and captions.
#   Pins whose "album" column has this folder name get a "● on the map" link here.
# ─────────────────────────────────────────────────────────────
albums:
  - title: "California & Nevada 2022"
    place: "California, Nevada, USA"
    year: 2022
    folder: California-Nevada-2022
    text: ""
    credits: ""
    # photos:
    #   - file: photo1.jpg
    #     caption: Beating vegetation for *Habronattus*
  - title: "Utah & Nevada 2021"
    place: "Nevada, Utah, USA"
    year: 2021
    folder: Utah-Nevada-2021
    text: ""
    credits: ""
  - title: "Californias 2020"
    place: "Baja California, Baja California Sur, Mexico"
    year: 2020
    folder: Californias-2020
    text: ""
    credits: ""
  - title: "Chile 2018"
    place: "Valparaíso, Santiago Metropolitan, O'Higgins, Maule & Biobío regions, Chile"
    year: 2018
    folder: Chile-2018
    text: ""
    credits: "Photos by Martín Ramírez"
---
