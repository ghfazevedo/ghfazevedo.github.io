---
title: Museums
lead: Natural history collections where I have studied specimens.

# Keep pins.csv off the public site; only the map uses it
build:
  publishResources: false

# ─────────────────────────────────────────────────────────────
# MAP PINS are in  pins.csv  in this folder (open it in Excel; save as "CSV UTF-8").
# Columns: title, lat, lon, year, type, album, note, precision
#   lat / lon  decimal degrees (Google Maps: right-click the museum and click the numbers)
#   type       one of the keys below (visit, loan) — sets the pin colour
#   album      optional: folder name of an album below, to link the pin to its photos
#   note       optional short text shown when the pin is clicked (Markdown allowed)
#   precision  write  approx  to show a rounded, soft-circle location instead of a point
# Rename the labels, change the colours, or add more types here:
# ─────────────────────────────────────────────────────────────
pin_types:
  visit: { label: Collection visited, color: "#B06D12" }
  #loan:  { label: Specimens examined (loans), color: "#1E6B66" }

# ─────────────────────────────────────────────────────────────
# ALBUMS (newest first). For each album:
#   1. create a folder inside content/museums/ (e.g. cas-2014)
#   2. drop the photos in it (any size)
#   3. add a block below. "photos:" is optional — leave it out to show every photo
#      in the folder; list them to set the order and captions.
#   Pins whose "album" column has this folder name get a "● on the map" link here.
# ─────────────────────────────────────────────────────────────
albums:
  - title: California Academy of Sciences (CAS)
    place: San Francisco, California
    year: 2014
    folder: cas-2014
    text: ""          # optional short description (Markdown allowed)
    credits: ""       # optional photo credits
    # photos:
    #   - file: photo1.jpg
    #     caption: Working in the arachnology collection
  - title: American Museum of Natural History (AMNH)
    place: New York, NY
    year: 2014
    folder: amnh-2014
  - title: "Museu Paraense Emílio Goeldi (MPEG)"
    place: Belém, PA
    year: 2010
    folder: goeldi-2010
  - title: Museum of Comparative Zoology - Harvard University (MCZ)
    place: Cambridge, MA
    year: 2014
    folder: mcz-2014
  - title: Muséum National d'Histoire Naturelle (MNHN)
    place: Paris, France
    year: 2016
    folder: mnhn-2016
  - title: San Diego State University Biodiversity Museum, Genomics Arachnid Collection
    place: San Diego, CA
    year: 2020
    folder: sdsu-2020
---
