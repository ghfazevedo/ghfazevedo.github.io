---
# Leave the homepage title empty to use the site title
title: ""
date: 2024-09-24
type: landing

design:
  # Default section spacing
  spacing: "6rem"

sections:
  - block: resume-biography-3
    content:
      # Choose a user profile to display (a folder name within `content/authors/`)
      username: admin
      text: ""
      # Show a call-to-action button under your biography? (optional)
#      button:
#        text: Know more about me...
#        url: /about.md
    design:
      #css_class: bright
      background:
        color: white
        # Text color (true=light, false=dark, or remove for the dynamic theme color).
        #text_color_light: true
        image:
          # Add your image background to `assets/media/`.
          filename: oldmanuscript.png
          filters:
            brightness: 1.0
          size: cover
          position: center
          parallax: false

---
