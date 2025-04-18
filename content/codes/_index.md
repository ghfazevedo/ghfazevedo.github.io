---
title: 'Projects'
date: 2024-05-19
type: landing

design:
  # Section spacing
  spacing: '5rem'
  background:
    color: white
    image:
      # Add your image background to `assets/media/`.
      filename: oldmanuscript.png
      filters:
        brightness: 1.0
      size: cover
      position: center
      parallax: false

# Page sections
sections:
  - block: collection
    content:
      title: Codes
      text: Here you will find links to codes on my github repository.
      filters:
        folders:
          - codes
    design:
      view: article-grid
      fill_image: false
      columns: 2
---
