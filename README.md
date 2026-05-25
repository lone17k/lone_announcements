# Lone Announcements

A modern, beautifully designed, and multi-framework compatible job announcement system for FiveM. 

With **Lone Announcements**, players can broadcast their job status (e.g., Police, EMS, Mechanics) to the entire server using a sleek, animated UI. The resource features an automatic framework bridge, meaning it works out of the box with most popular frameworks with zero setup required.

## Features

- **Multi-Framework Support (Auto-Detect)**: Natively supports QBCore, Qbox, ESX, and Custom frameworks. Just plug it in, and the bridge will figure out the rest!
- **Stunning UI**: Features a sleek, modern UI with an animated spinning gradient border, glassmorphism effects, Google Fonts (`Poppins`, `Montserrat`, `Inter`), and FontAwesome icons.
- **Highly Configurable**: Change the command name, cooldowns, durations, job logos, sounds, and UI colors directly in the `config.lua`.
- **Per-Job Customization**: Set unique titles, border colors, and notification sounds for each individual job (e.g., Blue for Police, Red for EMS).
- **Smart Fallbacks**: If a player's job isn't explicitly defined in the config, the system elegantly falls back to a default logo and sound.
- **Spam Protection**: Built-in command cooldowns per-job to prevent players from spamming announcements.
- **Economy Integrated**: Option to charge players a configurable fee (from bank or cash) for placing job advertisements.

## Installation

1. Download or clone this repository into your `resources` folder (e.g., `[standalone]/lone_announcements`).
2. Add `ensure lone_announcements` to your `server.cfg`.
3. Configure `config.lua` to your liking.
4. Restart your server!

## Configuration

Everything can be adjusted inside the `config.lua`:

- **`Config.Framework`**: Set to `"auto"` by default. Can be forced to `"qb"`, `"qbox"`, `"esx"`, or `"custom"`.
- **`Config.Command`**: Adjust the chat command name, set the spam cooldown, and optionally define a monetary cost required to place an ad.
- **`Config.UI`**: Tweak default colors, display durations, and fallback images/sounds.
- **`Config.Jobs`**: Add as many jobs as you want. Define their display name, custom image URL, sound file (located in `web/sounds/`), and custom border glow colors.

## Requirements / Dependencies

- None! It is completely standalone thanks to the internal bridge.

## Preview

The UI triggers at the bottom center of the screen, sliding up beautifully, displaying the job logo, an animated gradient border, and the message content with a clean real-time timestamp. Extremely long messages are protected by an elegant custom scrollbar to prevent screen overflow.

---
**Author**: Lone dev
**Version**: 1.0.0
